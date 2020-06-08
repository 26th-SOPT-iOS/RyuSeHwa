//
//  ShoppingBasketHeaderView.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/05/31.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ShoppingBasketHeaderView: UIView {
    
    var cagetory: ProductCategory = .normalProduct
    var extraPriceForPurchasing: Int = 0
    var gage: Float = 0.4
    lazy var bgView: UIView = {
      let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 20)
        view.backgroundColor = UIColor(red: 242 / 255, green: 242 / 255, blue: 242 / 255, alpha: 1.0)
        return view
    }()
    lazy var backgroundImg: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect.init(x: 0, y: 0, width: 375, height: 68)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var selectedButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage.init(named: "btnCheck"), for: .normal)
        button.setBackgroundImage(UIImage(named: "btnCheckSelected"), for: .selected)
        button.frame = CGRect.init(x: 0, y: 0, width: 48, height: 48)
        return button
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 88, height: 19)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.black
        label.textAlignment = .center
        //label.invalidateIntrinsicContentSize()
        return label
    }()
    
    lazy var priceProgressBar: UIProgressView = {
        let prgView = UIProgressView()
        prgView.frame = CGRect(x: 0, y: 0, width: 317, height: 3)
        prgView.progress = self.gage
        prgView.progressTintColor = UIColor(red: 82 / 242,
                                           green: 82 / 242,
                                           blue: 82 / 242,
                                           alpha: 1.0)
        prgView.trackTintColor = UIColor(red: 242 / 255,
                                        green: 242 / 255,
                                        blue: 242 / 255,
                                        alpha: 1.0)
        
        return prgView
    }()
    
    lazy var extraPriceForPurchasingLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 225, height: 15)
        label.textColor = UIColor(red: 59 / 255, green: 59 / 255, blue: 59 / 255, alpha: 1.0)
        label.textAlignment = .center
        label.text = "17,140원 추가시 주문 가능"
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    
    lazy var deliveryTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.text = "밤 12시전까지 주문시 내일(토) 5/23 새벽 도착 보장"

        return label
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
        // 이미지
        
        self.addSubview(self.backgroundImg)
//        self.addSubview(self.deliveryTimeLabel)
        self.addSubview(self.categoryLabel)
        self.addSubview(self.priceProgressBar)
        self.addSubview(self.selectedButton)
        self.addSubview(self.bgView)
        self.bgView.addSubview(self.deliveryTimeLabel)
        
        setUpBackgroundImageConstrint()
        setCategoryLabelConstraint()
        setDeliveryTimeLabelConstraint()
        setPriceProgressBarConstraint()
        setCheckButtonConstrint()
        
    }
}
//MARK:- SetView
extension ShoppingBasketHeaderView {
    func setBackgroundImageView(){
        switch self.cagetory {
        case .normalProduct:
            self.backgroundImg.image = UIImage(named: "imgSellerproduct")
        case .rocketDelivery:
            self.backgroundImg.image = UIImage(named: "imgRocektdeliveryGradient")
        case .rocketFresh:
            self.backgroundImg.image = UIImage(named: "imgRocketfreshGradient")
        }
    }
    
    func setCategoryLabel(){
        switch self.cagetory {
        case .normalProduct:
            self.categoryLabel.text = "판매자 상품"
        case .rocketDelivery:
            self.categoryLabel.text = "로켓배송 상품"
        case .rocketFresh:
            self.categoryLabel.text = "로켓프레시 상품"
        }
    }
    func setExtraPriceForPurchasing(){
        if self.cagetory == .rocketDelivery || self.cagetory == .rocketFresh {
            addSubview(self.extraPriceForPurchasingLabel)
            setExtraPriceForPurchasingLabelConstraint()
        }
    }

}

// MARK:- Autolayout
extension ShoppingBasketHeaderView {
    
    func setExtraPriceForPurchasingLabelConstraint(){

        self.extraPriceForPurchasingLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraintTop = NSLayoutConstraint(item: self.extraPriceForPurchasingLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 10)
        let constraintTrailing = NSLayoutConstraint(item: self.extraPriceForPurchasingLabel,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: -16)
        NSLayoutConstraint.activate([constraintTop, constraintTrailing])
    }
    
    func setPriceProgressBarConstraint(){
        self.priceProgressBar.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.priceProgressBar,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self.selectedButton,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTrailing = NSLayoutConstraint(item: self.priceProgressBar,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: -16)
        let constraintTop = NSLayoutConstraint(item: self.priceProgressBar,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self.categoryLabel,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: 4)
        let constraintBottom = NSLayoutConstraint(item: self.priceProgressBar,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: self.backgroundImg,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: -12)
        NSLayoutConstraint.activate([constraintLeading, constraintTrailing, constraintTop, constraintBottom])
    }
    
    func setDeliveryTimeLabelConstraint(){
        self.deliveryTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.deliveryTimeLabel,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 16)
        let constraintTop = NSLayoutConstraint(item: self.deliveryTimeLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self.backgroundImg,
                                               attribute: .bottom,
                                               multiplier: 1.0,
                                               constant: 3)
        
        self.bgView.translatesAutoresizingMaskIntoConstraints = false
        let bgConstraintLeading = NSLayoutConstraint(item: self.bgView,
                                                     attribute: .leading,
                                                     relatedBy: .equal,
                                                     toItem: self,
                                                     attribute: .leading,
                                                     multiplier: 1.0,
                                                     constant: 0)
        let bgConstraintTrailing = NSLayoutConstraint(item: self.bgView,
                                                     attribute: .trailing,
                                                     relatedBy: .equal,
                                                     toItem: self,
                                                     attribute: .trailing,
                                                     multiplier: 1.0,
                                                     constant: 0)
        let bgConstraintTop = NSLayoutConstraint(item: self.bgView,
                                                     attribute: .top,
                                                     relatedBy: .equal,
                                                     toItem: self.backgroundImg,
                                                     attribute: .bottom,
                                                     multiplier: 1.0,
                                                     constant: 0)
        let bgConstraintHeight = NSLayoutConstraint(item: self.bgView,
                                                    attribute: .height,
                                                    relatedBy: .equal,
                                                    toItem: .none,
                                                    attribute: .notAnAttribute,
                                                    multiplier: 0,
                                                    constant: 20)
        
        NSLayoutConstraint.activate([bgConstraintLeading, bgConstraintTrailing, bgConstraintTop, bgConstraintHeight])
        NSLayoutConstraint.activate([constraintLeading, constraintTop])
    }
    func setUpBackgroundImageConstrint(){
        self.backgroundImg.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.backgroundImg,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTrailing = NSLayoutConstraint(item: self.backgroundImg,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        let constriantTop = NSLayoutConstraint(item: self.backgroundImg,
                                              attribute: .top,
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: .top,
                                              multiplier: 1.0,
                                              constant: 0)
        let constraintHeight = NSLayoutConstraint(item: self.backgroundImg,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: .none,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: 48)
        let constraintBottom = NSLayoutConstraint(item: self,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: self.backgroundImg,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 20)
        
        NSLayoutConstraint.activate([constraintLeading, constraintTrailing, constriantTop, constraintHeight])
    }
    
    func setCheckButtonConstrint(){
        self.selectedButton.translatesAutoresizingMaskIntoConstraints = false
        let constraintLeading = NSLayoutConstraint(item: self.selectedButton,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        let constraintTop = NSLayoutConstraint(item: self.selectedButton,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 0)
        let constraintBottom = NSLayoutConstraint(item: self.selectedButton,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: self.backgroundImg,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 0)
        let ratio = NSLayoutConstraint(item: self.selectedButton,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: self.selectedButton,
                                       attribute: .width,
                                       multiplier: 1.0,
                                       constant: 0)
        
        NSLayoutConstraint.activate([constraintLeading, constraintTop, constraintBottom, ratio])
    }
    
    func setCategoryLabelConstraint(){
        self.categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraintLeading = NSLayoutConstraint(item: self.categoryLabel,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self.selectedButton,
                                                   attribute: .trailing,
                                                   multiplier: 1.0,
                                                   constant: 0)
        
        let constraintTop = NSLayoutConstraint(item: self.categoryLabel,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 8.0)
        
        NSLayoutConstraint.activate([constraintLeading, constraintTop])
    }
}
