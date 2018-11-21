//
//  APIError.swift
//  MONO
//
//  Created by 石原さとみ on 2018/11/20.
//  Copyright © 2018 Tencent. All rights reserved.
//

import Foundation
import MBProgressHUD

enum APIError: Error {
    // 请求出错，服务器返回对应描述文字
    case error(wrong: String)
    // 服务器返回的数据不是 Json
    case dataJSON(wrong: String)
    // 服务器返回数据为空
    case dataEmpty(wrong: String)
    // 服务器返回的数据不能解析
    case datamatch(wrong: String)
    // 网络请求错误
    case network(wrong: String)
}

extension APIError {
    func showHUD() {
        switch self {
        case .error(let wrong):
            YanProgressHUD.showInfo(<#T##YanProgressHUD#>)
            break
        default:
            <#code#>
        }
    }
}
