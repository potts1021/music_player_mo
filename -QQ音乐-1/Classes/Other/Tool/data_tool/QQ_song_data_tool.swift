//
//  QQ_song_data_tool.swift
//  -QQ音乐-1
//
//  Created by Pottsmo on 16/6/5.
//  Copyright © 2016年 Pottsmo. All rights reserved.
//

import UIKit

class QQ_song_data_tool: NSObject {

    class func get_song_model(result : (models : [QQ_song_model]?)->()) {
//        模拟发送一个网络请求,获取
//        异步
        
        
//        1.解析数据
//          加载plist
        guard let path = NSBundle.mainBundle().pathForResource("Musics.plist", ofType: nil) else{
            return result(models: nil)
        }
        guard let dict_array = NSArray(contentsOfFile: path) else{
            return result(models: nil)
        }
        
        
//        遍历字典
        var model_array = [QQ_song_model]()
        
        for dict in dict_array{
            let model = QQ_song_model(dict: dict as! [String : AnyObject])
            model_array.append(model)
      
        }
//        返回结果
        result(models: model_array)
    }
    
    
    
}
