//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ContainerView: UIView {
    convenience init(frame: CGRect, color: UIColor) {
        self.init(frame: frame)
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}

class CircleView: UIView {
    convenience init(frame: CGRect, color: UIColor) {
        self.init(frame: frame)
        backgroundColor = color
        layer.cornerRadius = frame.width / 2
    }
}

let frame = CGRect(x: 0, y: 0, width: 300, height: 600)
let containerView = ContainerView(frame: frame, color: UIColor.black)

let f1 = CGRect(x: 50, y: 50, width: 50, height: 50)
let f2 = CGRect(x: 130, y: 50, width: 50, height: 50)
let f3 = CGRect(x: 210, y: 50, width: 50, height: 50)

let v1 = CircleView(frame: f1, color: UIColor.green)
let v2 = CircleView(frame: f2, color: UIColor.red)
let v3 = CircleView(frame: f3, color: UIColor.blue)

[v1,v2,v3].forEach { containerView.addSubview($0) }

let animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn, animations: nil)

animator.addAnimations {
    v1.frame.origin.y = 200
    v2.frame.origin.y = 400
    v3.frame.origin.y = 500
}

//animator.startAnimation()
//PlaygroundPage.current.liveView = containerView
