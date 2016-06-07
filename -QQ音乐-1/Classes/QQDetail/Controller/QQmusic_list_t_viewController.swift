//
//  QQmusic_list_t_viewController.swift
//  -QQ音乐-1
//
//  Created by Pottsmo on 16/6/5.
//  Copyright © 2016年 Pottsmo. All rights reserved.
//

import UIKit

class QQmusic_list_t_viewController: UITableViewController {
    var song_list:[QQ_song_model] = [QQ_song_model](){
        didSet{
            tableView.reloadData()
        }
    }

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        界面展示
        
//        负责加载数据
        QQ_song_data_tool.get_song_model { (models) -> () in
            if models != nil{
             //展示数据
                self.song_list = models!
            }
        }
        
        
        setUp_view()
        
    }
    

   


}

// 功能实现
//选中cell 播放对应歌曲
extension QQmusic_list_t_viewController{

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // 1. 取出数据模型
        let model = song_list[indexPath.row]
        
        // 2. 根据数据模型,播放音乐
        QQ_music_operation_tool.share_player.play_the_song(model)
        
        
        
//        3.跳转
        performSegueWithIdentifier("listToDetail", sender: nil)
    }

}





//      动画
extension QQmusic_list_t_viewController{
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
//        取出cell
       let display_cell = cell as? Song_Cell
        
//        做动画
        display_cell?.animation_cell(Song_cell_animation_type.Rotation)
        
        
        
    }


}

//界面设置
extension QQmusic_list_t_viewController{
    
    //主入口   :设置界面
    func setUp_view(){
        
        setBackView()
        setUpTableView()
        setup_nacbar()
        
    }

//设置背景图片 QQListBack
    func setBackView() -> () {
        let image = UIImage(named: "QQListBack")
        let iamge_view = UIImageView(image: image)
        tableView.backgroundView = iamge_view


    }

//    tableview 行高60 隐藏分割线
    func setUpTableView() -> () {
        tableView.rowHeight = 60
        tableView.separatorStyle = .None
    }

    // 隐藏导航栏
    func setup_nacbar(){
        self.navigationController?.navigationBarHidden = true
    }

    
//    设置状态栏
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}



//s数据处理
extension QQmusic_list_t_viewController{
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return song_list.count + 10
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = Song_Cell.cellWithTableView(tableView)
        
        if (indexPath.row <  song_list.count) {
            
            let song_model = song_list[indexPath.row]
            cell.song_model = song_model
        }
        
        
        
        
        return cell
    }
    
    
}
