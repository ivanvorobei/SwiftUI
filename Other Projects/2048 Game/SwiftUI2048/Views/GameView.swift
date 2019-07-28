//
//  GameView.swift
//  SwiftUI2048
//
//  Created by Hongyu on 6/5/19.
//  Copyright © 2019 Cyandev. All rights reserved.
//

import SwiftUI

extension Edge {
    
    static func from(_ from: GameLogic.Direction) -> Self {
        switch from {
        case .down:
            return .top
        case .up:
            return .bottom
        case .left:
            return .trailing
        case .right:
            return .leading
        }
    }
    
}

struct GameView : View {
    
    @State var gestureStartLocation: CGPoint = .zero
    @State var lastGestureDirection: GameLogic.Direction = .up
    @EnvironmentObject var gameLogic: GameLogic
    
    fileprivate struct LayoutTraits {
        let bannerOffset: CGSize
        let containerAlignment: Alignment
    }
    
    fileprivate func layoutTraits(`for` proxy: GeometryProxy) -> LayoutTraits {
        let landscape = proxy.size.width > proxy.size.height
        
        return LayoutTraits(
            bannerOffset: landscape
                ? .init(width: proxy.safeAreaInsets.leading + 32, height: 0)
                : .init(width: 0, height: proxy.safeAreaInsets.top + 32),
            containerAlignment: landscape ? .leading : .top
        )
    }
    
    var gesture: some Gesture {
        let threshold: CGFloat = 44
        let drag = DragGesture()
            .onChanged { v in
                guard self.gestureStartLocation != v.startLocation else { return }
                
                withTransaction(Transaction()) {
                    self.gestureStartLocation = v.startLocation
                    
                    if v.translation.width > threshold {
                        // Move right
                        self.gameLogic.move(.right)
                        self.lastGestureDirection = .right
                    } else if v.translation.width < -threshold {
                        // Move left
                        self.gameLogic.move(.left)
                        self.lastGestureDirection = .left
                    } else if v.translation.height > threshold {
                        // Move down
                        self.gameLogic.move(.down)
                        self.lastGestureDirection = .down
                    } else if v.translation.height < -threshold {
                        // Move up
                        self.gameLogic.move(.up)
                        self.lastGestureDirection = .up
                    } else {
                        // Direction cannot be deduced, reset gesture state.
                        self.gestureStartLocation = .zero
                    }
                }
                
                // After the scene is updated, reset the last gesture direction
                // to make sure the animation is right when user starts a new
                // game.
                OperationQueue.main.addOperation {
                    self.lastGestureDirection = .up
                }
            }
        return drag
    }
    
    var body: some View {
        GeometryReader { proxy in
            bind(self.layoutTraits(for: proxy)) { layoutTraits in
                ZStack(alignment: layoutTraits.containerAlignment) {
                    Text("2048")
                        .font(Font.system(size: 48).weight(.black))
                        .foregroundColor(Color(red:0.47, green:0.43, blue:0.40, opacity:1.00))
                        .offset(layoutTraits.bannerOffset)
                    
                    ZStack(alignment: .top) {
                        BlockGridView(matrix: self.gameLogic.blockMatrix,
                                      blockEnterEdge: .from(self.lastGestureDirection))
                            .gesture(self.gesture)
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                    .background(
                        Rectangle().fill(Color(red:0.96, green:0.94, blue:0.90, opacity:1.00))
                )
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}

#if DEBUG
struct GameView_Previews : PreviewProvider {
    
    static var previews: some View {
        GameView()
            .environmentObject(GameLogic())
    }
    
}
#endif
