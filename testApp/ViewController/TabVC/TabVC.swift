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
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white
        tabBar.backgroundColor = .PRIMARY_COLOR
        
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let companyVC = CompanyVC()
        companyVC.tabBarItem = UITabBarItem(title: "Company", image: UIImage(systemName: "person.3.fill"), tag: 1)
        
        let settingPageVC = SettingViewController()
        settingPageVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        
        viewControllers = [homeVC, companyVC, settingPageVC]
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
}
