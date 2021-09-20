//
//  AnimationUtils.swift
//  CleanCode
//
//  Created by Jose Martins on 22/03/21.
//

import UIKit
import Lottie

final class AnimationsUtils {
    
    private static var loadingMask = UIView(frame: UIScreen.main.bounds)
    private static var isRunningRippleAnimation = false
    
    private static func showLoading() {
        
        if loadingMask.subviews.count > 0 {
            return
        }
        
        loadingMask.alpha = 0
        
        loadingMask.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        //  Animation
        
        let hudSquare: CGFloat = 180
        
        var hudCenter = loadingMask.center
        hudCenter.x -= hudSquare/2
        hudCenter.y -= hudSquare/2
        
        loadingMask.addSubview(self.getLottieLoadingAnimation(center: hudCenter, size: hudSquare))
        
        //  Adding Mask
        
        let window: UIWindow? = UIApplication.shared.windows.first
        window?.addSubview(loadingMask)
        
        UIView.animate(withDuration: 0.3) {
            loadingMask.alpha = 1
        }
    }
    
    private static func getLottieLoadingAnimation(center: CGPoint, size: CGFloat) -> AnimationView {
        
        let animationView = AnimationView(name: "loading") // ./Application/Files
        animationView.frame = CGRect(origin: center, size: CGSize(width: size, height: size))
        animationView.loopMode = .loop
        animationView.play()
        
        return animationView
    }
    
    private static func hideLoading() {
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        loadingMask.alpha = 0
                       },
                       completion: { (finished) in
                        
                        if finished {
                            
                            loadingMask.removeFromSuperview()
                            loadingMask = UIView(frame: UIScreen.main.bounds)
                        }
                       })
    }
    
    static func loading(_ loading: Bool) {
        if loading {
            showLoading()
        }else{
            hideLoading()
        }
    }
    
    static func makeRippleEffect(to referenceView: UIView, point: CGPoint, completion: (() -> Void)? = nil) {
        
        if !isRunningRippleAnimation {
            let size = referenceView.bounds.size
            
            let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            
            let rippleShape = CAShapeLayer()
            rippleShape.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            rippleShape.path = path.cgPath
            
            rippleShape.fillColor =  UIColor.white.withAlphaComponent(0.3).cgColor
            
            rippleShape.strokeColor = UIColor.white.withAlphaComponent(0.3).cgColor
            rippleShape.lineWidth = 1
            rippleShape.position = point
            rippleShape.opacity = 0
            
            referenceView.layer.addSublayer(rippleShape)
            
            let scaleAnin = CABasicAnimation(keyPath: "transform.scale")
            scaleAnin.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
            scaleAnin.toValue = NSValue(caTransform3D: CATransform3DMakeScale(2, 2, 1))
            
            let opacityAnim = CABasicAnimation(keyPath: "opacity")
            opacityAnim.fromValue = 1
            opacityAnim.toValue = nil
            
            let animation = CAAnimationGroup()
            animation.animations = [scaleAnin, opacityAnim]
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            let duration: Double = 0.7
            let repeatCount: Double = 1
            let dispatchTime = duration * repeatCount
            
            animation.duration = CFTimeInterval(duration)
            animation.repeatCount = Float(repeatCount)
            animation.isRemovedOnCompletion = true
            
            isRunningRippleAnimation = true
            rippleShape.add(animation, forKey: "rippleEffect")
            
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + dispatchTime) {
                    DispatchQueue.main.async {
                        completion()
                        isRunningRippleAnimation = false
                    }
                }
            }
        }
        
        
    }
    
    static func makeBounceAnimation(withDuration duration: TimeInterval = 0.9,
                                    animations: @escaping () -> Void,
                                    completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 1,
            options: .curveEaseInOut,
            animations: animations, completion: completion)
    }
    
    static func makeBasicAnimation(withDuration duration: TimeInterval = 0.3,
                                   animations: @escaping () -> Void,
                                   completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: duration,
            animations: animations,
            completion: completion
        )
    }
    
    static func makeBasicAnimation(in view: UIView,
                                   withDuration duration: TimeInterval = 0.3,
                                   animations: @escaping () -> Void,
                                   completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: duration,
            animations: {
                animations()
                view.layoutIfNeeded()
            },
            completion: completion
        )
    }
}
