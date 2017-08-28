//
//  KSYProgressView.swift
//  KSYProgressView
//
//  Created by huangdaxia on 2017/8/28.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

public class KSYProgressView: UIView {
    
    /// 进度条样式
    public let progressBarType: KSYProgressBarType
    
    fileprivate let progressLayer = CAShapeLayer()
    fileprivate let progressBackgroundLayer = CAShapeLayer()
    
    /// 进度条颜色
    public var progressColor: UIColor = .white {
        didSet {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            progressLayer.strokeColor = progressColor.cgColor
            CATransaction.commit()
        }
    }
    
    /// 进度条背景颜色
    public var progressBackgroundColor: UIColor = UIColor(white: 1, alpha: 0.3) {
        didSet {
            progressBackgroundLayer.strokeColor = progressBackgroundColor.cgColor
        }
    }
    
    /// 进度值
    public var progress: CGFloat = 0.35 {
        didSet {
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            progressLayer.strokeEnd = min(1, progress)
            CATransaction.commit()
        }
    }
    
    /// 进度条宽度
    public var barWidth: CGFloat = 10
    
    public init(progressBarType: KSYProgressBarType = .circle) {
        self.progressBarType = progressBarType
        
        super.init(frame: .zero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        var path: UIBezierPath
        switch progressBarType {
        case .circle:
            path = UIBezierPath(ovalIn: bounds.insetBy(dx: barWidth * 0.5, dy: barWidth * 0.5))
        case .line:
            path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: bounds.height / 2))
            path.addLine(to: CGPoint(x: bounds.width, y: bounds.height / 2))
        }
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        progressLayer.path = path.cgPath
        progressLayer.bounds = bounds
        progressLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        progressLayer.lineWidth = barWidth
        progressLayer.strokeEnd = progress
        progressLayer.strokeColor = progressColor.cgColor
        
        progressBackgroundLayer.path = path.cgPath
        progressBackgroundLayer.bounds = bounds
        progressBackgroundLayer.position = progressLayer.position
        progressBackgroundLayer.strokeColor = progressBackgroundColor.cgColor
        progressBackgroundLayer.lineWidth = barWidth
        CATransaction.commit()
    }
    
    fileprivate func setup() {
        backgroundColor = .clear
        
        switch progressBarType {
        case .circle:
            progressLayer.lineCap = kCALineCapRound
            progressLayer.transform = CATransform3DMakeRotation(-CGFloat(Double.pi * 0.5), 0, 0, 1)
            progressLayer.fillColor = UIColor.clear.cgColor
        case .line:
            progressLayer.fillColor = UIColor.clear.cgColor
        }
        
        progressBackgroundLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(progressBackgroundLayer)
        layer.addSublayer(progressLayer)
    }
    
    public func update(progress: CGFloat, color: UIColor, animated: Bool, completion: (() -> Void)? = nil) {
        CATransaction.begin()
        CATransaction.setDisableActions(!animated)
        
        if animated {
            CATransaction.setAnimationDuration(1)
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
            CATransaction.setCompletionBlock(completion)
            
            let oldColor = self.progressColor.cgColor
            let oldProgress = self.progress
            
            let strokeColorAnimation = CABasicAnimation(keyPath: "strokeColor")
            strokeColorAnimation.fromValue = oldColor
            strokeColorAnimation.toValue = color.cgColor
            progressLayer.add(strokeColorAnimation, forKey: "strokeColor")
            
            let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
            strokeAnimation.fromValue = oldProgress
            strokeAnimation.toValue = progress
            progressLayer.add(strokeAnimation, forKey: "strokeEnd")
        }
        
        self.progressColor = color
        self.progress = progress
        
        CATransaction.commit()
        
        if !animated {
            completion?()
        }
    }
    
}
