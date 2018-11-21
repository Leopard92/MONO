//
//  AppDelegate.swift
//  MONO
//
//  Created by 石原さとみ on 2018/10/24.
//  Copy    right © 2018年 Tencent. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = UIColor.white
        window?.rootViewController = YanMainViewController()
        window?.makeKeyAndVisible()
        
//        if !UserDefaults.standard.bool(forKey: "FirstLoad") {
//            YanStartMovieHelper.sharedInstance.showStartMoviewWithMovieURL(movieURL: "welcome")
//            UserDefaults.standard.set(true, forKey: "FirstLoad")
//        }
//        
        
        
        return true
    }

}

