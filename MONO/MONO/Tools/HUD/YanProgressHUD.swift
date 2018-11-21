//
//  YanProgressHUD.swift
//  MONO
//
//  Created by 石原さとみ on 2018/11/20.
//  Copyright © 2018 Tencent. All rights reserved.
//

import UIKit
import MBProgressHUD

class YanProgressHUD: MBProgressHUD {

     class func showInfo(title: String) {
        let view = viewToShow()
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = title
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1)
    }

}

extension YanProgressHUD {
    fileprivate class func viewToShow() -> UIView {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal {
            let windowArray = UIApplication.shared.windows
            for tempWin in windowArray {
                if tempWin.windowLevel == UIWindowLevelNormal {
                    window = tempWin
                    break
                }
            }
            
        }
        return window!
    }
}
