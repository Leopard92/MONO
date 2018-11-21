//
//  APIRouter.swift
//  MONO
//
//  Created by JG Yan on 2018/11/21.
//  Copyright © 2018 Tencent. All rights reserved.
//

import UIKit
import Alamofire

enum APIRouter: String, URLConvertible {
    // 早午茶
    case tea = "tea"
    // 我的关注
    case attention = "recommendation"
    
    static var baseUrl: String {
        get {
            return ""
        }
    }
    
    var appendUrl: String {
        get {
            return rawValue
        }
    }
    
    
    func asURL() throws -> URL {
        let urlString = APIRouter.baseUrl.appending(appendUrl)
        
        return URL(string: urlString)!
    }
}
