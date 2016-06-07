//
//  QQ_song_player.swift
//  -QQ音乐-1
//
//  Created by Pottsmo on 16/6/6.
//  Copyright © 2016年 Pottsmo. All rights reserved.
//

import UIKit
import AVFoundation
//这个类只是负责单首歌曲的播放
class QQ_song_player: NSObject {

    // 记录着当前正在播放的播放器对象

    
    // 根据一个歌曲名称, 开始播放一首歌曲

    // 获取老的URL, 跟新的URL进行比较, 如果相同, 则继续播放, 如果不同, 则, 创建新的播放器, 继续播放
/*
    1 首先创建一个成员属性记录当前的播放器对象
    2 创建方法 根据获取来的url 播放音乐
    */
    var player : AVAudioPlayer?
    
    func play_song(url_string : String?)
    {
        guard let url = NSBundle.mainBundle().URLForResource(url_string, withExtension: nil) else {
            return
        }
        
        if player?.url == url {
            player?.play()
            return
        }
        
        
        do{
            player = try AVAudioPlayer(contentsOfURL: url)
            
            player?.prepareToPlay()
            
            player?.play()
        }
        catch{
            print(error)
        }
    }
    
}
