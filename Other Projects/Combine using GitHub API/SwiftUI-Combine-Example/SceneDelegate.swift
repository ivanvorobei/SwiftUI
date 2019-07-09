import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(
            rootView: SearchUserView().environmentObject(SearchUserViewModel())
        )
        self.window = window
        window.makeKeyAndVisible()
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: SearchUserView().environmentObject(SearchUserViewModel()))
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
