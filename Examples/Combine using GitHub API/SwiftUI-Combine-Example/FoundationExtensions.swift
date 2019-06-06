import SwiftUI
import Combine

enum RequestError: Error {
    case request(code: Int, error: Error?)
    case unknown
}

extension URLSession {
    func send(request: URLRequest) -> AnyPublisher<(data: Data, response: HTTPURLResponse), RequestError> {
        AnyPublisher<(data: Data, response: HTTPURLResponse), RequestError> { subscriber in
            let task = self.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    let httpReponse = response as? HTTPURLResponse
                    if let data = data, let httpReponse = httpReponse, 200..<300 ~= httpReponse.statusCode {
                        _ = subscriber.receive((data, httpReponse))
                        subscriber.receive(completion: .finished)
                    }
                    else if let httpReponse = httpReponse {
                        subscriber.receive(completion: .failure(.request(code: httpReponse.statusCode, error: error)))
                    }
                    else {
                        subscriber.receive(completion: .failure(.unknown))
                    }
                }
            }

            subscriber.receive(subscription: AnySubscription(task.cancel))
            task.resume()
        }
    }
}

extension JSONDecoder: TopLevelDecoder {}
