import PlaygroundSupport
import SwiftUI

struct PureGeniusView: View {
  var body: some View {
    ZStack {
      Rectangle()
        .fill()
        .foregroundColor(.init(hue: 0.57, saturation: 0.25, brightness: 1))
      Circle()
        .frame(width: 320, height: 320)
        .foregroundColor(.init(hue: 0.8, saturation: 0.25, brightness: 0.75))
      VStack {
        PGWordView(word: ["P", "U", "R", "E"]).offset(x: 0, y: 20)
        PGWordView(word: ["G", "E", "N", "I", "U", "S"]).offset(x: 0, y: -20)
      }
    }
  }
}

struct PGWordView: View {
  var word: [String]
  var body: some View {
    HStack {
      ForEach(word.identified(by: \.self)) { letter in
        PGLetterView(text: letter)
      }
    }
  }
}

struct PGLetterView: View {
  var text: String
  var body: some View {
    ZStack {
      MovingLetterView(text: text, color: .init(hue: 0.14, saturation: 0.56, brightness: 0.98))
      MovingLetterView(text: text, color: .init(hue: 0.37, saturation: 0.52, brightness: 0.7))
    }
  }
}

struct MovingLetterView: View {
  var text: String
  var color: Color
  
  @State var position: CGPoint = .zero
  @State var activeTimer: Timer = nil
  
  private let animationDuration: Double = 2
  private let maxOffset: CGFloat = 10
  private var timer: Timer {
    return Timer.scheduledTimer(withTimeInterval: self.animationDuration * 0.25, repeats: true) {_ in
      let x = CGFloat(arc4random_uniform(UInt32(self.maxOffset))) - (self.maxOffset / 2)
      let y = CGFloat(arc4random_uniform(UInt32(self.maxOffset))) - (self.maxOffset / 2)
      self.position = CGPoint.init(x: x, y: y)
    }
  }
  
  var body: some View {
    Text(text)
      .color(self.color)
      .font(Font.custom("Baskerville-Bold", size: 40))
      .bold()
      .offset(by: self.position)
      .animation(.basic(duration: self.animationDuration, curve: .easeInOut))
      .onAppear {
        self.activeTimer = self.timer
    }
      .onDisappear {
        self.activeTimer = nil
    }
  }
}

extension View {
  public func offset(by offset: CGPoint) -> Self.Modified<_OffsetEffect> {
    self.offset(x: offset.x, y: offset.y)
  }
}

PlaygroundPage.current.liveView = UIHostingController(rootView: PureGeniusView())
