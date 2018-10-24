//
//  Bundle+Extension.swift
//  MONO
//
//  Created by 石原さとみ on 2018/10/24.
//  Copyright © 2018年 Tencent. All rights reserved.
//

import Foundation

extension Bundle {
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
