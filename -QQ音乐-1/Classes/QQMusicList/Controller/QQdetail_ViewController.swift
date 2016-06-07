//
//  QQdetail_ViewController.swift
//  -QQ音乐-1
//
//  Created by Pottsmo on 16/6/5.
//  Copyright © 2016年 Pottsmo. All rights reserved.
//

import UIKit
//拿来放属性的
class QQdetail_ViewController: UIViewController {

    @IBOutlet weak var background_imageV: UIImageView!
  
    /*******    Top_View     *********/
    @IBOutlet weak var song_name_lebal: UILabel!
    
    @IBOutlet weak var singer_name_label: UILabel!
    /*******    Center_View     *********/
/// 中间歌手图片
    @IBOutlet weak var singer_imageView: UIImageView!
 /// 歌词
    @IBOutlet weak var song_word: UILabel!
/// 左滑有歌词
    @IBOutlet weak var song_word_detail: UIScrollView!
    var song_word_view: UIView?
    /*******    Bottom_View     *********/

    @IBOutlet weak var song_slider: UISlider!
    @IBOutlet weak var song_begin_time: UILabel!
    @IBOutlet weak var song_end_time: UILabel!
    
}

//主要的业务逻辑
extension QQdetail_ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
//        设置界面
        add_custom_view()
    }

    override func viewWillLayoutSubviews() {
//        设置布局
        set_all_frame()
    }
}

/**
 // 专门用来布局的方法
 // 主入口 - 1. 负责添加设置控件
 // 主入口- 2, 负责布局控件'
 
 // 添加控件  1
 // 布局控件 N
 // 状态栏
 // 图片slider player_slider_playback_thumb
 // 动画    当拖动scrollview的时候,中间歌手view慢慢消失 设置透明度
 **/



// 界面操作

extension QQdetail_ViewController{
// 原则, 一定要把, 控件的添加, 和 控件的布局区分开
// 控件的添加属于一次性的操作, 布局是可以多次
       func add_custom_view(){
        add_song_word_inScrollView()
        setup_slider_pictutre()
        setUpNavBar()
    }
    func add_song_word_inScrollView(){
        song_word_view = UIView()
        song_word_view?.backgroundColor = UIColor.clearColor()
        song_word_detail.bounces = false
        song_word_detail.addSubview(song_word_view!)

    }
    func setup_slider_pictutre(){
        song_slider.setThumbImage(UIImage(named: "player_slider_playback_thumb"), forState: .Normal)
    }
    func setUpNavBar(){
        self.navigationController?.navigationBarHidden = true
//        设置背景视图
        song_word_detail.pagingEnabled = true
        song_word_detail.showsHorizontalScrollIndicator = false
        song_word_detail.delegate = self
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}


//设置布局

extension QQdetail_ViewController{
    func set_all_frame(){
        setUp_detailView_frame()
        set_singer_pic_corner()
    }
    
    func setUp_detailView_frame(){
        song_word_view?.frame = song_word_detail.bounds
        song_word_view?.x = (song_word_view?.width)!
        song_word_detail.contentSize = CGSize(width:song_word_detail.width*2, height: 0)
        
    }
    func set_singer_pic_corner(){
        singer_imageView.layer.cornerRadius = singer_imageView.width*0.5
        singer_imageView.layer.masksToBounds = true
    }
    
}

extension QQdetail_ViewController: UIScrollViewDelegate{


    func scrollViewDidScroll(scrollView: UIScrollView) {
        let content_offset_x = scrollView.contentOffset.x
        let alpha_scale = 1 - content_offset_x / song_word_detail.width
        
        song_word.alpha = alpha_scale
        singer_imageView.alpha = alpha_scale
        
    }





}