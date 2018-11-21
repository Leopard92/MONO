//
//  YanStartMovieView.swift
//  MONO
//
//  Created by 石原さとみ on 2018/10/30.
//  Copyright © 2018年 Tencent. All rights reserved.
//

import UIKit
import AVKit
import RxCocoa
import RxSwift

class AnimationDelegate: NSObject,CAAnimationDelegate {
    var animationDelegatePlayer = AVPlayer()
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        animationDelegatePlayer.play()
    }
}

class YanStartMovieView: UIView {
    
    var movieUrl = String()
    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    var endButton = UIButton()
    
    

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupSubViews()
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func enterMainAction() {
        
    }

}

extension YanStartMovieView {
    fileprivate func setupSubViews() {
        
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let backLayer = CALayer()
        backLayer.frame = UIScreen.main.bounds
        backLayer.contents = UIImage.getLaunch().cgImage
        self.layer.addSublayer(backLayer)
        
        
        /// 播放视频
        let player = AVPlayer(url: Bundle.main.url(forResource: movieUrl, withExtension: "mp4")!)
        player.volume = 3.0
        self.player = player
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravity.resize
        playerLayer.frame = UIScreen.main.bounds
        self.playerLayer = playerLayer
        
        /// 描述
        let imageView = UIImageView(image: UIImage(named: "welcome_video_info"))
        imageView.frame = CGRect(x: UIScreen.main.bounds.size.width/2 - 193/2, y: UIScreen.main.bounds.size.height - 220, width: 193, height: 99)
        self.addSubview(imageView)
        
        /// 下一页按钮
        let endButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.size.width/2 - 25, y: UIScreen.main.bounds.size.height - 100, width: 50, height: 50))
        endButton.alpha = 0.0
        endButton.setBackgroundImage(UIImage(named: "welcome_video_start"), for: .normal)
        endButton.addTarget(self, action: #selector(enterMainAction), for: .touchUpInside)
        self.endButton = endButton
        self.addSubview(endButton)
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationBecomeActive1), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        let scaleAnimation = CABasicAnimation(keyPath: "opacity")
        scaleAnimation.fromValue = NSNumber(value: 0.0)
        scaleAnimation.toValue = NSNumber(value: 1.0)
        scaleAnimation.duration = 1.0
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        let animationDelegate = AnimationDelegate()
        animationDelegate.animationDelegatePlayer = self.player
        scaleAnimation.delegate = animationDelegate
        self.playerLayer.add(scaleAnimation, forKey: nil)
        UIView.animate(withDuration: 2.0) {
            self.endButton.alpha = 1.0
        }
        
        
    }
    
    @objc fileprivate func applicationBecomeActive1() {
        self.player.play()
    }
}
