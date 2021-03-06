//
//  QQ_music_operation_tool.swift
//  -QQ音乐-1
//
//  Created by Pottsmo on 16/6/6.
//  Copyright © 2016年 Pottsmo. All rights reserved.
//

import UIKit

// 一定要看的东西!!!!!!----------


//  负责, 歌曲之间的调度(上一首, 下一首, 循环, 顺序, 随机)
//  一定要注意!!!!! 把具体功能实现,和 业务逻辑区分开,
//  这样做的好处, 一个是方便维护, 出问题好排除BUG, 另外一个, 是因为, 具体功能, 和业务逻辑的重用价值不一样, 具体功能, 重用性最高, 但是, 业务逻辑相对来说比较差, 所以, 如果综合到一块, 造成后期重用麻烦, 需要分离出来


// 注意: 这一层, 是真正与外界对接的一层, 千万不要在控制器里面, 使用 QQMusicTool, 这一层操作,
// 跨层有很多弊端, 一个是维护问题, 而是往后的扩展问题
class QQ_music_operation_tool: NSObject {
    
    // 单例的好处
    // 节省内存
    // 共享数据
    static let share_player : QQ_music_operation_tool = QQ_music_operation_tool()
    
    let play_tool : QQ_song_player = QQ_song_player()
    
    // 真正去播放歌曲, 控制单首歌曲操作的工具类
    func play_the_song(model_song: QQ_song_model){
        // 根据一个音乐数据模型, 去播放一首歌曲
        play_tool.play_song(model_song.filename)
    }
    

    
    
}
