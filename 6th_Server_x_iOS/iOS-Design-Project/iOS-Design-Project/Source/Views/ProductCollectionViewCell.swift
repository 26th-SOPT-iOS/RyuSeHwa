//
//  ProductCollectionViewCell.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/28.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var InnerCollectionView: UICollectionView!
    static let identifier:String = "ProductCell"
    override func awakeFromNib() {
       super.awakeFromNib()
        setupViews()
       //custom logic goes here
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private var ProductInformation:[[Product]] = []
    var sectionNumber:Int?
    func setupViews(){
        let item1 = Product(imagname: "img1", name: "item1", price: "price1")
        let item2 = Product(imagname: "img2", name: "item2", price: "price2")
        let item3 = Product(imagname: "img3", name: "item3", price: "price3")
        let item4 = Product(imagname: "img4", name: "item4", price: "price4")
        let item5 = Product(imagname: "img5", name: "item5", price: "price5")
        let item6 = Product(imagname: "img6", name: "item6", price: "price6")
        let item7 = Product(imagname: "img7", name: "item7", price: "price7")
        let item8 = Product(imagname: "img8", name: "item8", price: "price8")
        let item9 = Product(imagname: "img9", name: "item9", price: "price9")
        
        let array1:[Product] = [item1,item2,item3,item4,item5,item6,item7,item8,item9]
        let array2:[Product] = [item1,item2,item3,item4,item5,item6,item7,item8,item9]
        let array3:[Product] = [item1,item2,item3,item4,item5,item6,item7,item8,item9]
        ProductInformation=[array1,array2,array3]

        InnerCollectionView.delegate = self
        InnerCollectionView.dataSource = self
    }

}

extension ProductCollectionViewCell:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ProductInformation[sectionNumber!].count
    }
}
extension ProductCollectionViewCell:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:InnerProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: InnerProductCollectionViewCell.identifier, for: indexPath) as! InnerProductCollectionViewCell
        cell.ProductImage.image = UIImage(named: ProductInformation[sectionNumber!][indexPath.row].ProductImageName)
        cell.ProductName.text = ProductInformation[sectionNumber!][indexPath.row].ProductName
        cell.ProductPrice.text = ProductInformation[sectionNumber!][indexPath.row].ProductPrice
        return cell
    }
}
extension ProductCollectionViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6.5, left: 11, bottom: 0, right: 11)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width : 95,height:121)
    }
}

