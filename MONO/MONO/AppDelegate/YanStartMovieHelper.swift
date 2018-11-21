//
//  YanStartMovieHelper.swift
//  MONO
//
//  Created by 石原さとみ on 2018/10/30.
//  Copyright © 2018年 Tencent. All rights reserved.
//

import UIKit

class YanStartMovieHelper: NSObject {

    static let sharedInstance = YanStartMovieHelper()
    private override init() {}

}

extension YanStartMovieHelper {
    func showStartMoviewWithMovieURL(movieURL: String) {
        
        let startMovie = YanStartMovieView()
        startMovie.frame = UIScreen.main.bounds
        startMovie.backgroundColor = UIColor.white
        startMovie.movieUrl = movieURL
        UIApplication.shared.keyWindow?.addSubview(startMovie)
    }
    
}
