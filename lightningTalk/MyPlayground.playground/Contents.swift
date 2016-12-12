//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

protocol Corners {
    var topLeft: CGPoint { get }
    var topRight: CGPoint { get }
    var bottomLeft: CGPoint { get }
    var bottomRight: CGPoint { get }
}

extension UIView: Corners {
    var topLeft: CGPoint { return self.frame.origin }
    var topRight: CGPoint { return CGPoint(x: self.frame.maxX, y: self.frame.origin.y) }
    var bottomLeft: CGPoint { return CGPoint(x: self.frame.origin.x, y: self.frame.maxY) }
    var bottomRight: CGPoint { return CGPoint(x: self.frame.maxX, y: self.frame.maxY) }
}

class ContainerView: UIView {
    convenience init(frame: CGRect, color: UIColor) {
        self.init(frame: frame)
        layer.borderColor = UIColor.green.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 1
        layer.masksToBounds = true
    }
}

class CircleView: UIView {
    convenience init(frame: CGRect, color: UIColor) {
        self.init(frame: frame)
        backgroundColor = color
        layer.cornerRadius = frame.width / 3
    }
}

let frame = CGRect(x: 0, y: 0, width: 300, height: 600)
let containerView = ContainerView(frame: frame, color: UIColor.black)

let f1 = CGRect(x: 50, y: 50, width: 50, height: 50)
let f2 = CGRect(x: 130, y: 50, width: 50, height: 50)
let f3 = CGRect(x: 210, y: 50, width: 50, height: 50)
let f4 = CGRect(x: 150, y: 150, width: 50, height: 50)

let v1 = CircleView(frame: f1, color: UIColor.green)
let v2 = CircleView(frame: f2, color: UIColor.red)
let v3 = CircleView(frame: f3, color: UIColor.blue)
let v4 = CircleView(frame: f4, color: UIColor.orange)

let views = [v1, v2, v3, v4]
views.forEach { containerView.addSubview($0) }

let items = UIDynamicItemBehavior(items: views)
items.elasticity = 0.9
//items.angularResistance = 10
//items.charge = 1.0
items.allowsRotation = true

let animator = UIDynamicAnimator(referenceView: containerView)
let gravity = UIGravityBehavior(items: views)
let collision = UICollisionBehavior(items: views)

collision.addBoundary(withIdentifier: NSString(string:"left"), from: containerView.topLeft, to: containerView.bottomLeft)
collision.addBoundary(withIdentifier: NSString(string:"right"), from: containerView.topRight, to: containerView.bottomRight)
collision.addBoundary(withIdentifier: NSString(string:"top"), from: containerView.topLeft, to: containerView.topRight)
collision.addBoundary(withIdentifier: NSString(string:"bottom"), from: containerView.bottomRight, to: containerView.bottomLeft)

//animator.addBehavior(gravity)
//animator.addBehavior(collision)
//animator.addBehavior(items)
//
//PlaygroundPage.current.liveView = containerView
