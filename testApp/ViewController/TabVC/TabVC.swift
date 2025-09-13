//
//  TabVC.swift
//  testApp
//
//  Created by HTS-676 on 13/09/25.
//

import UIKit

class TabVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        tabBar.applyTopCornerRadius(
            20,
            borderColor: .lightGray,
            borderWidth: 1,
            shadowColor: .black,
            shadowOpacity: 0.2,
            shadowOffset: CGSize(width: 0, height: -3),
            shadowRadius: 6
        )
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = .PRIMARY_COLOR
        
        let firstVC = FirstVC()
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let secondVC = SecondVC()
        secondVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        
        let thirdVC = ThirdVC()
        thirdVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        
        viewControllers = [firstVC, secondVC, thirdVC]
        
        // Hide unselected titles
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        updateTabBarTitles(selectedIndex: selectedIndex)
//    }
//    
//    
//    private func updateTabBarTitles(selectedIndex: Int) {
//        guard let items = tabBar.items else { return }
//        
//        for (index, item) in items.enumerated() {
//            item.title = (index == selectedIndex) ? (item.title ?? "") : nil
//            debugPrint("\(item.title)")
//        }
//    }
    
}
