//
//  SettingsLauncher.swift
//  youtube
//
//  Created by Brian Voong on 6/17/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

public enum Alingment {
    case left
    case right
}



public class SlidingWindow: NSObject {
    
   
    private  let blackView = UIView()
    public var title:NSAttributedString?
    public var alingment:Alingment? = Alingment.left
    
    private let contentView: UIView = {
        let layout = UIView()
        layout.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layout.layer.cornerRadius = 10
        layout.backgroundColor = UIColor.white
        return layout
    }()
    
    public let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.white
        return containerView
    }()
    
    
    
    public func show() {
        
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleDismiss))
            swipeGesture.direction = .down
            swipeGesture.numberOfTouchesRequired = 1
            blackView.addGestureRecognizer(swipeGesture)
            window.addSubview(blackView)
            
            window.addSubview(contentView)
            var height: CGFloat = CGFloat()
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                height = UIScreen.main.bounds.height / 2 + 27
            } else {
                height = UIScreen.main.bounds.height / 1.5 + 27
            }
            
            let y = window.frame.height - height
            
            contentView.frame =  CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            let titleLabel = UILabel(frame: CGRect(x: contentView.frame.midX - contentView.frame.width / 4 , y: 8, width: contentView.frame.width / 2, height: 30))
            titleLabel.attributedText = title
            titleLabel.textAlignment = .center
            contentView.addSubview(titleLabel)
            
            let separatorLineView = UIView()
            separatorLineView.frame.origin = CGPoint(x: 0, y: titleLabel.frame.height + 8)
            separatorLineView.frame.size = CGSize(width: contentView.frame.width, height: 1)
            separatorLineView.backgroundColor = UIColor.groupTableViewBackground
            contentView.addSubview(separatorLineView)
            
            
            let cancelBtn = UIButton()
            if alingment == Alingment.left {
                 cancelBtn.frame.origin = CGPoint(x: 8, y: 8)
            } else {
                 cancelBtn.frame.origin = CGPoint(x: self.contentView.frame.maxX - 68, y: 8)
            }
           
            cancelBtn.frame.size = CGSize(width:60, height: 30)
            cancelBtn.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            cancelBtn.setImage(UIImage(named:"downarrow"), for: .normal)
            cancelBtn.imageView?.contentMode = .scaleAspectFit
            contentView.addSubview(cancelBtn)
            
            
  
            containerView.frame = CGRect(x: 0, y: separatorLineView.frame.maxY, width: contentView.frame.width, height:  self.contentView.frame.height  - 38)
            contentView.addSubview(containerView)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                
                self.blackView.alpha = 1
                
                self.contentView.frame =  CGRect(x: 0, y:y, width:self.contentView.frame.width, height: self.contentView.frame.height)
                
            }, completion: nil)
        }
    }
    
    @objc public func handleDismiss() {
        UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .showHideTransitionViews, animations: {
            
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                
                self.contentView.frame =   CGRect(x: 0, y: window.frame.height, width: self.contentView.frame.width, height: self.contentView.frame.height)
            }
            
        }, completion: nil)
    }
    
    
    
    
    
    override public init() {
        super.init()
        
    }
    
}

