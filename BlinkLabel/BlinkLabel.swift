//
//  BlinkLabel.swift
//  BlinkLabel
//
//  Created by Nayem BJIT on 5/9/19.
//  Copyright © 2019 BJIT Ltd. All rights reserved.
//

import UIKit

class BlinkLabel: UILabel {

    var colors: [UIColor] = []
    var speed: Double = 1.0
    private var shouldAnimate = true
    private var currentColorIndex = 0

    func startBlinking() {
        if colors.count <= 1 {
            /// Can not blink
            return
        }

        shouldAnimate = true
        currentColorIndex = 0
        let toColor = self.colors[self.currentColorIndex]
        animateToColor(toColor)
    }

    func stopBlinking() {
        shouldAnimate = false
        self.layer.removeAllAnimations()
    }

    private func animateToColor(_ color: UIColor) {

        if !shouldAnimate {return}

        let changeColor = CATransition()
        changeColor.duration = speed
        changeColor.type = .fade
        changeColor.repeatCount = 1
        changeColor.delegate = self
        changeColor.isRemovedOnCompletion = true
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.layer.add(changeColor, forKey: nil)
            self.textColor = color
        }
        CATransaction.commit()
    }

}

extension BlinkLabel: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {

            if !self.shouldAnimate {return}

            /// Calculating the next colour
            self.currentColorIndex += 1
            if self.currentColorIndex == self.colors.count {
                self.currentColorIndex = 0
            }

            let toColor = self.colors[self.currentColorIndex]

            /// You can remove this delay and directly call the function self.animateToColor(toColor) I just gave this to increase the visible time for each colour.
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
                self.animateToColor(toColor)
            })
        }
    }
}
