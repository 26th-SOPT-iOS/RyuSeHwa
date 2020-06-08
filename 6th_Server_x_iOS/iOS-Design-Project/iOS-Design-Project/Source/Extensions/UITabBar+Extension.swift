//
//  UITabBar+Extension.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/06/01.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
import UIKit

fileprivate let tabBarItemTag: Int = 10090

extension  UITabBar {
    
    public func addItemBadge(atIndex index: Int, num: Int) {
        guard let itemCount = self.items?.count, itemCount > 0 else {
            return
        }
        guard index < itemCount else {
            return
        }
        removeItemBadge(atIndex: index)
        
        let badgeView = UIView()
        badgeView.tag = tabBarItemTag + Int(index)
        badgeView.layer.cornerRadius = 10
        badgeView.backgroundColor = UIColor.systemBlue
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .white
        label.text = "\(num)"
        label.sizeToFit()

        badgeView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalToSystemSpacingAfter: badgeView.centerXAnchor, multiplier: 1.0).isActive = true
        label.centerYAnchor.constraint(equalToSystemSpacingBelow: badgeView.centerYAnchor, multiplier: 1.0).isActive = true
        
        let tabFrame = self.frame
        let percentX = (CGFloat(index) + 0.56) / CGFloat(itemCount)
        let x = (percentX * tabFrame.size.width).rounded(.up)
        let y = (CGFloat(0.1) * tabFrame.size.height).rounded(.up)
        badgeView.frame = CGRect(x: x, y: y, width: 20, height: 20)
        addSubview(badgeView)
    }
    
    //return true if removed success.
    @discardableResult
    public func removeItemBadge(atIndex index: Int) -> Bool {
        for subView in self.subviews {
            if subView.tag == (tabBarItemTag + index) {
                subView.removeFromSuperview()
                return true
            }
        }
        return false
    }
    
}
