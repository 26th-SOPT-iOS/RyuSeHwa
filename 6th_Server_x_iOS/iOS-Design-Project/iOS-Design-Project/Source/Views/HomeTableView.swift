//
//  HomeTableView.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class HomeTableView: UITableView {
    
    @IBOutlet weak var ContentScroll: UIScrollView!
    private var productInformation:[Product] = []
    var productImageName :[String] = ["ad1","ad2","ad3","ad4"]
    var productNameArray : [String] = ["1번상품","2번상품","3번상품","4번상품"]
    var productPriceArray : [String] = ["565,000","990,423","7,172","506"]
    var numberOfProduct :Int = 4
    var cellFrame = CGRect(x: 0, y: 0, width: 95, height: 162)
    private func setProductInformations(){
    for i in 0..<4{
        self.productInformation[i] = Product(product: productImageName[i], name: productNameArray[i], price: productPriceArray[i])
        }
    }
    private func setSubView(){
    for i in 0..<numberOfProduct{
            self.cellFrame.origin.x = ContentScroll.frame.size.width*CGFloat(i)
            productImage.image = UIImage(named: self.productImageName[i])
            self.ContentScroll.addSubview(productImage)
            productImage.frame = self.cellFrame
    }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
extension HomeExVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productInformation.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let ProductCell = tableView.dequeueReusableCell(withIdentifier:HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
        
        return ProductCell
    }
}
extension HomeExVC: UITableViewDelegate{
    
}

