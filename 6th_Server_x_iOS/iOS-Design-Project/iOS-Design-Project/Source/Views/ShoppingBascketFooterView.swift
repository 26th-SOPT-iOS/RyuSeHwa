//
//  ShoppingBascketFooterView.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/06/01.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ShoppingBascketFooterView: UIView {

    
    lazy var paymentPriceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 110, height: 15)
        label.text = "결제예상금액 : 32,860원"
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = UIColor(red: 59 / 255, green: 59 / 255, blue: 59 / 255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    lazy var priceBgView: UIView = {
       let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 23)
        view.backgroundColor = UIColor(red: 250 / 255, green: 250 / 255, blue: 250 / 255, alpha: 1.0)
        return view
    }()
    
    lazy var viewToSavePrice: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 32)
        return view
    }()

    lazy var imageToSavePrice: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 375, height: 32)
        imageView.image = UIImage(named: "btnSavedeliveryfee")
       return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setUpView()
    }
    
    func setUpView(){
        self.addSubview(self.priceBgView)
        self.priceBgView.addSubview(self.paymentPriceLabel)

        self.addSubview(self.viewToSavePrice)
        self.viewToSavePrice.addSubview(self.imageToSavePrice)
        
        setPriceBgViewConstraint()
        setPaymentPriceLabelConstraint()
        setViewToSavePriceConstraint()
        setImageToSavePriceConstraint()
    }
}


extension ShoppingBascketFooterView {
    func setPriceBgViewConstraint(){
        self.priceBgView.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.priceBgView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTrailing = NSLayoutConstraint(item: self.priceBgView,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTop = NSLayoutConstraint(item: self.priceBgView,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintHeight = NSLayoutConstraint(item: self.priceBgView,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: .none,
                                                   attribute: .notAnAttribute,
                                                   multiplier: 0,
                                                   constant: 23)
        
        NSLayoutConstraint.activate([constraintLeading, constraintTrailing, constraintTop, constraintHeight])
    }
    func setPaymentPriceLabelConstraint(){
        self.paymentPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraintTrailing = NSLayoutConstraint(item: self.paymentPriceLabel,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self.priceBgView,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        let constraintTop = NSLayoutConstraint(item: self.paymentPriceLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self.priceBgView,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 4)
        NSLayoutConstraint.activate([constraintTop, constraintTrailing])
    }
    
    func setViewToSavePriceConstraint(){
        self.viewToSavePrice.translatesAutoresizingMaskIntoConstraints = false
        let constraintTop = NSLayoutConstraint(item: self.viewToSavePrice,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self.priceBgView,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: 0)
        let constraintLeading = NSLayoutConstraint(item: self.viewToSavePrice,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTrailing = NSLayoutConstraint(item: self.viewToSavePrice,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        let constraintHeight = NSLayoutConstraint(item: self.viewToSavePrice,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: .none,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 0,
                                                  constant: 32)
        
        NSLayoutConstraint.activate([constraintTrailing, constraintTop, constraintLeading, constraintHeight])
    }
    
    func setImageToSavePriceConstraint(){
        self.imageToSavePrice.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.imageToSavePrice,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self.viewToSavePrice,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTrailing = NSLayoutConstraint(item: self.imageToSavePrice,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self.viewToSavePrice,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTop = NSLayoutConstraint(item: self.imageToSavePrice,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: self.viewToSavePrice,
                                                   attribute: .top,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintBottom = NSLayoutConstraint(item: self.imageToSavePrice,
                                                  attribute: .bottom,
                                                   relatedBy: .equal,
                                                   toItem: self.viewToSavePrice,
                                                   attribute: .bottom,
                                                   multiplier: 1.0,
                                                   constant: 0)
        
        NSLayoutConstraint.activate([constraintLeading, constraintTrailing, constraintTop, constraintBottom])
    }
}
