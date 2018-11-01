//
//  YanNavigationController.swift
//  MONO
//
//  Created by 石原さとみ on 2018/10/24.
//  Copyright © 2018年 Tencent. All rights reserved.
//

import UIKit

class YanNavigationController: UINavigationController {

    override func viewDidLoad() {
        UIApplication.shared.statusBarStyle = .lightContent
//        self.navigationBar.isTranslucent = false
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
        }

        super.pushViewController(viewController, animated: true)
    }
    
}
