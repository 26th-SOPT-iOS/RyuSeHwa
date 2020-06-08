//
//  ShoppingBasketJHVC.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/05/27.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ShoppingBasketJHVC: UIViewController {
    
    //MARK:- Normal Property
    var selectedTab: SelectedTapInShoppingCart = .normalPurchase
    var myProductList: [ProductJH] = []
    
    var rocketFreshProductList: [ProductJH] = []
    var rocketDeliveryProductList: [ProductJH] = []
    var normalProductList: [ProductJH] = []
    
    var itemCount: Int = 0
    
    //MARK:- IBOutlet
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDummy()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //self.tableViewHeight.constant = 0

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Custom Method
    func setDummy(){
        self.myProductList.append(ProductJH(category: .rocketDelivery, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .rocketDelivery, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .rocketDelivery, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .rocketFresh, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .rocketFresh, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .rocketFresh, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .rocketFresh, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .normalProduct, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .normalProduct, name: "123", imgStr: "123", priceStr: "!23"))
        self.myProductList.append(ProductJH(category: .normalProduct, name: "123", imgStr: "123", priceStr: "!23"))
    }

    
    @IBAction func touchUpBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- Extension TableView

extension ShoppingBasketJHVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        
        case 2, 3, 4:
            return 68
        case 5:
            return 18
        default:
            return .leastNonzeroMagnitude
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
                switch section {
        
        case 2, 3, 4:
            return 55
        default:
            return .leastNonzeroMagnitude
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let contentView = ShoppingBasketHeaderView(frame: CGRect(x: 0, y: 0, width: 375, height: 68))
        switch section {
        case 2:
            contentView.cagetory = .rocketFresh
        case 3:
            contentView.cagetory = .rocketDelivery
        case 4:
            contentView.cagetory = .normalProduct
        case 5:
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: 375, height: 18)
            view.backgroundColor = UIColor(red: 248 / 255, green: 248 / 255, blue: 248 / 255, alpha: 1.0)
            view.layer.borderWidth = 0.2
        
            return view
        default:
            return nil
        }
        
        contentView.setBackgroundImageView()
        contentView.setCategoryLabel()
        contentView.setExtraPriceForPurchasing()
        contentView.backgroundColor = UIColor.red
        headerView.addSubview(contentView)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = ShoppingBascketFooterView(frame: CGRect(x: 0, y: 0, width: 375, height: 55))
        footerView.backgroundColor = .blue
        switch section {
        case 2, 3, 4:
            break
        default:
            return nil
        }
        return footerView
    }
}
extension ShoppingBasketJHVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNum: Int = 0
        
        switch section {
        case 0:
            rowNum = 1
        case 1:
            rowNum = 1
        case 2:
            rowNum = self.myProductList.filter{
                $0.category == .rocketFresh
            }.count
        case 3:
            rowNum = self.myProductList.filter{
                $0.category == .rocketDelivery
            }.count
        case 4:
            rowNum = self.myProductList.filter{
                $0.category == .normalProduct
            }.count
        case 5:
            rowNum = 2
        default:
            break
        }

        return rowNum
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TabBarCellJH.identifier)
                as? TabBarCellJH{
                cell.tabIndicatorView.backgroundColor = .systemBlue
                cell.indicatorHeightConstraint.constant = 3
                return cell
            }
            
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EditTabCellJH.identifier) as? EditTabCellJH{
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ProductInShoppingBasketCell.identifier) as? ProductInShoppingBasketCell {
                
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ProductInShoppingBasketCell.identifier) as? ProductInShoppingBasketCell {
                
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ProductInShoppingBasketCell.identifier) as? ProductInShoppingBasketCell {
                
                return cell
            }
        case 5:
            print(indexPath.row)
            if indexPath.row == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: ProductPriceDetailCellJH.identifier) as? ProductPriceDetailCellJH {
                    return cell
                }
            }
            else {
                if let cell = tableView.dequeueReusableCell(withIdentifier: ProductTotalPriceCellJH.identifier) as? ProductTotalPriceCellJH {
                    return cell
                }
            }
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}

// MARK:- Enum SelectedTapInShoppingCart
enum SelectedTapInShoppingCart: Int{
    case normalPurchase = 0
    case regularDelivery = 1
}



