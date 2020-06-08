//
//  TabbarVC.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 07/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {
    static let identifier = "TabbarVC"
    
    var currentSelectedIndex:Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.gray
        setTabBar()
        
        guard let items = tabBar.items else { return }

        items[0].title = "Title0"
        items[1].title = "Title1"
        //items[2].title = "Title2"
    }

    
    func setTabBar(){
        
        // Home Tab
        let categoryStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        guard let firstTab = categoryStoryboard.instantiateViewController(identifier: "HomeVC")
            as? HomeVC  else {
            return
        }
        
        firstTab.tabBarItem.title = "dd"
        //firstTab.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        //firstTab.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        print(#function)
        
        
        // Location Tab
        let searchStoryboard = UIStoryboard.init(name: "Location_1", bundle: nil)
        guard let secondTab = searchStoryboard.instantiateViewController(identifier: "Location1VC")
            as? Location1VC  else {
            return
        }

        secondTab.tabBarItem.title = "Location"
        //secondTab.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        //secondTab.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        
        // Location Tab
        let myPageStoryboard = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let thirdTab = myPageStoryboard.instantiateViewController(identifier: "MyPageVC")
            as? MyPageVC  else {
            return
        }
        thirdTab.tabBarItem.title = "MyPage"
        }


}

//extension TabbarVC: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if (tabBarController.selectedIndex == 4) {
//
//            let shoppingBasketStoryboard = UIStoryboard.init(name: "ShoppingBaseketJH", bundle: nil)
//            guard let fifthTab = shoppingBasketStoryboard.instantiateViewController(identifier: "ShoppingBasketJHVC")
//                as? ShoppingBasketJHVC  else {
//                return
//            }
//            tabBarController.selectedIndex = self.currentSelectedIndex
//            self.navigationController?.pushViewController(fifthTab, animated: true)
//            print(#function)
//        } else {
//            self.currentSelectedIndex = tabBarController.selectedIndex
//        }
//
//    }
//}

