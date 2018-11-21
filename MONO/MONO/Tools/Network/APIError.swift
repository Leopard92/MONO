//
//  APIError.swift
//  MONO
//
//  Created by 石原さとみ on 2018/11/20.
//  Copyright © 2018 Tencent. All rights reserved.
//

import Foundation

enum APIError: Error {
    // 请求出错，服务器返回对应描述文字
    case error(wrong: String)
    // 服务器返回的数据不是 Json
    case dataJSON(wrong: String)
    // 服务器返回数据为空
    case dataEmpty(wrong: String)
    // 服务器返回的数据不能解析
    case dataMatch(wrong: String)
    // 网络请求错误
    case netError(wrong: String)
    
    static func networkWrong(with error: NSError) -> APIError {
        if let errorMessage = error.userInfo["NSLocalizedDescription"] as? String {
            return APIError.netError(wrong: errorMessage)
        }
        
        if error.domain == "Alamofire.AFError" {
            if error.code == 4 {
                return APIError.dataEmpty(wrong: "Server return data is nil or zero length.")
            }
        }
        
        return APIError.netError(wrong: "Unknow Network Wrong")
    }
}

extension APIError {
    func showHUD() {
        switch self {
        case .error(let wrong):
            YanProgressHUD.showInfo(title: wrong)
        case .dataEmpty(let wrong):
            YanProgressHUD.showInfo(title: wrong)
        case .dataJSON(let wrong):
            YanProgressHUD.showInfo(title: wrong)
        case .dataMatch(let wrong):
            YanProgressHUD.showInfo(title: wrong)
        case .netError(let wrong):
            YanProgressHUD.showInfo(title: wrong)
        }
    }
}
