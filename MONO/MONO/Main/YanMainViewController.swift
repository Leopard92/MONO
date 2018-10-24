//
//  YanMainViewController.swift
//  MONO
//
//  Created by 石原さとみ on 2018/10/24.
//  Copyright © 2018年 Tencent. All rights reserved.
//

import UIKit

class YanMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupChildControllers()
    }

}

extension YanMainViewController {
    
    private func setupChildControllers() {
        let array = [
            ["clsName": "YanRecommendController", "title": "", "imageName": "tab-recommend"],
            ["clsName": "YanDiscoverController", "title": "", "imageName": "tab-explore"],
            ["clsName": "YanCommunityController", "title": "", "imageName": "tab-social"],
            ["clsName": "YanMineController", "title": "", "imageName": "tab-mine"],
        ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    private func controller(dict:[String: String]) -> UIViewController {
        
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else {
                
                return UIViewController()
        }
        
        let vc = cls.init()
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "-active")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, -10, 0)
        
        let nav = YanNavigationController(rootViewController: vc)
        
        return nav
        
    }
}
