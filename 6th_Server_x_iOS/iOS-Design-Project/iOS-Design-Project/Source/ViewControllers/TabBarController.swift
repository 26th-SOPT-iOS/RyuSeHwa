//
//  TabBarController.swift
//  iOS-Design-Project
//
//  Created by 이주혁 on 2020/05/24.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    var currentSelectedIndex:Int = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tabBar.tintColor = UIColor.mainblue
        setTabBar()
        // Do any additional setup after loading the view.
        self.delegate = self
    }

    
    
    func setTabBar(){
        
        // Category Tab
        let categoryStoryboard = UIStoryboard.init(name: "Category", bundle: nil)
        guard let firstTab = categoryStoryboard.instantiateViewController(identifier: "CategoryVC")
            as? CategoryVC  else {
            return
        }
        
        firstTab.tabBarItem.title = ""
        firstTab.tabBarItem.image = UIImage(named: "iconCategory")?.withRenderingMode(.alwaysOriginal)
        firstTab.tabBarItem.selectedImage = UIImage(named: "iconCategory2")?.withRenderingMode(.alwaysOriginal)
        print(#function)
        // Search Tab
        let searchStoryboard = UIStoryboard.init(name: "Search", bundle: nil)
        guard let secondTab = searchStoryboard.instantiateViewController(identifier: "SearchVC")
            as? SearchVC  else {
            return
        }

        secondTab.tabBarItem.title = ""
        secondTab.tabBarItem.image = UIImage(named: "iconSearch")?.withRenderingMode(.alwaysOriginal)
        secondTab.tabBarItem.selectedImage = UIImage(named: "iconSearch2")?.withRenderingMode(.alwaysOriginal)
        
        // Home Tab
        // 세화님 뷰
        let homeStoryboard = UIStoryboard.init(name: "HomeSH", bundle: nil)
        guard let thirdTab = homeStoryboard.instantiateViewController(identifier: "HomeSHVC")
            as? HomeSHVC  else {
            return
        }
        // 태훈님 뷰
        // let homeStoryboard = UIStoryboard.init(name: "HomeExample", bundle: nil)
        // guard let thirdTab = homeStoryboard.instantiateViewController(identifier: "HomeExVC")
        //     as? HomeExVC  else {
        //     return
        // }
        // 유진님 뷰
//        let homeStoryboard = UIStoryboard.init(name: "YJHome", bundle: nil)
//        let thirdTab = homeStoryboard.instantiateViewController(identifier: "YJHomeNavi")
//

        thirdTab.tabBarItem.title = ""
        thirdTab.tabBarItem.image = UIImage(named: "iconHome")?.withRenderingMode(.alwaysOriginal)
        thirdTab.tabBarItem.selectedImage = UIImage(named: "iconHomeSelected")?.withRenderingMode(.alwaysOriginal)
        
        // PersonalInfo Tab
        let personalInfoStoryboard = UIStoryboard.init(name: "PersonalInfo", bundle: nil)
        guard let fourthTab = personalInfoStoryboard.instantiateViewController(identifier: "PersonalInfoVC")
            as? PersonalInfoVC  else {
            return
        }

        fourthTab.tabBarItem.title = ""
        fourthTab.tabBarItem.image = UIImage(named: "iconMy")?.withRenderingMode(.alwaysOriginal)
        fourthTab.tabBarItem.selectedImage = UIImage(named: "iconMy2")?.withRenderingMode(.alwaysOriginal)
        // Shopping Basket Tab
//        let shoppingBasketStoryboard = UIStoryboard.init(name: "ShoppingBasketExample", bundle: nil)
//        guard let fifthTab = shoppingBasketStoryboard.instantiateViewController(identifier: "ShoppingBasketExVC")
//            as? ShoppingBasketExVC  else {
//            return
//        }
//        let shoppingBasketStoryboard = UIStoryboard.init(name: "ShoppingBaseketJH", bundle: nil)
//        guard let fifthTab = shoppingBasketStoryboard.instantiateViewController(identifier: "ShoppingBasketJHVC")
//            as? ShoppingBasketJHVC  else {
//            return
//        }
        let fifthTab = UIViewController()
//        fifthTab.tabBarItem.badgeColor = UIColor.systemBlue
//        fifthTab.tabBarItem.badgeValue = "2"
        
        fifthTab.tabBarItem.title = ""
        fifthTab.tabBarItem.image = UIImage(named: "iconCart")
        fifthTab.tabBarItem.selectedImage = UIImage(named: "iconCart")?.withRenderingMode(.alwaysTemplate)

        // Create an Array of Tables with Tabs as Elements.
        let tabs =  [firstTab, secondTab, thirdTab, fourthTab, fifthTab]
        
        // Set the ViewController.
        self.setViewControllers(tabs, animated: false)
        tabBar.addItemBadge(atIndex: 4, num: 4)
        self.selectedViewController = thirdTab
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if (tabBarController.selectedIndex == 4) {
            
            let shoppingBasketStoryboard = UIStoryboard.init(name: "ShoppingBaseketJH", bundle: nil)
            guard let fifthTab = shoppingBasketStoryboard.instantiateViewController(identifier: "ShoppingBasketJHVC")
                as? ShoppingBasketJHVC  else {
                return
            }
            tabBarController.selectedIndex = self.currentSelectedIndex
            self.navigationController?.pushViewController(fifthTab, animated: true)
            print(#function)
        } else {
            self.currentSelectedIndex = tabBarController.selectedIndex
        }

    }
}


