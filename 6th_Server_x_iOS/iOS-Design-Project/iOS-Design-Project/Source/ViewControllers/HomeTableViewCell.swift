//
//  HomeTableViewCell.swift
//  iOS-Design-Project
//
//  Created by 김태훈 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier:String = "ProductTableViewCell"
    
    //@IBOutlet weak var contentCollectionView: UICollectionView!
    var contentLabel:UILabel!

    private var ProductInformation:[Product] = []
    private func setProductInformation(){
        for i in 0..<5{
            ProductInformation[i] = Product(imagname: "img"+String(i), name: "item"+String(i), price: "price"+String(i))
        }
        //contentCollectionView.delegate = self
        //contentCollectionView.dataSource = self
        print("여기불러와짐")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setProductInformation()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setProductInformation(ProductCategory:String){
        contentLabel.text = ProductCategory
    }
}
extension HomeTableViewCell : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductInformation.count
    }
    
}

extension HomeTableViewCell : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        cell.ProductImage.image = UIImage(named: ProductInformation[indexPath.row].ProductImageName)
        cell.ProductName.text = ProductInformation[indexPath.row].ProductName
        cell.ProductPrice.text = ProductInformation[indexPath.row].ProductPrice
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(indexPath,"번 아이템 터치")
    }
}



extension HomeExVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productInformation.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell=tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for:indexPath) as? HomeTableViewCell
            else{
                print("실패")
                return UITableViewCell()}
        cell.testLabel.text = productInformation[indexPath.row]
        print("cell.testLabel.text")
        return cell
    }
}
extension HomeExVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
