//
//  AppDelegate.swift
//  MONO
//
//  Created by 石原さとみ on 2018/10/24.
//  Copyright © 2018年 Tencent. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = YanMainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}
