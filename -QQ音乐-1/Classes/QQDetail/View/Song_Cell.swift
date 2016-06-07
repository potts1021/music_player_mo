//
//  Song_Cell.swift
//  -QQ音乐-1
//
//  Created by Pottsmo on 16/6/5.
//  Copyright © 2016年 Pottsmo. All rights reserved.
//

import UIKit
enum Song_cell_animation_type {
    case Scale
    case Rotation
}
class Song_Cell: UITableViewCell {

    @IBOutlet weak var icon_iamgeView: UIImageView!
    @IBOutlet weak var song_name_label: UILabel!
    @IBOutlet weak var singger_name: UILabel!
    
    var song_model : QQ_song_model?{
        didSet{
            if song_model?.icon != nil{
            icon_iamgeView.image = UIImage(named: (song_model?.icon)!)
            }
            song_name_label.text = song_model?.name
            singger_name.text = song_model?.singer
//            print(song_model?.name,song_model?.singer)
        }
    }
    
    
    static let ID : String = "music_cell"
//    从xib加载完成后,再设置他的圆角半径
    override func awakeFromNib() {
        super.awakeFromNib()
        icon_iamgeView.layer.cornerRadius = icon_iamgeView.frame.size.width * 0.5
      icon_iamgeView.layer.masksToBounds = true
    }

    
    class func cellWithTableView(tableview : UITableView) -> Song_Cell {
        var cell = tableview.dequeueReusableCellWithIdentifier(ID) as? Song_Cell
        
        if cell == nil{
//      不强行转成指定的song_cell系统不会知道他的类型只能转为uitableviewCell
            cell = NSBundle.mainBundle().loadNibNamed("Song_Cell", owner: nil, options: nil).first as? Song_Cell
            
        }
        
        return cell!
    }
    
    
    
    
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        
    }
    
    
    func animation_cell(type : Song_cell_animation_type){
        if type == .Rotation{
            self.layer.removeAnimationForKey("rotation")
            
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation.y")
            animation.values = [M_PI * 0.25, 0 ]
            animation.duration = 0.5
            
//            动画都是作用在layer层上面的
            self.layer.addAnimation(animation, forKey: "rotation")
            
            
            
        }
        else if type == .Scale
        {
            self.layer.removeAnimationForKey("scale_mo")
            let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
            animation.values = [0.5 , 1 , 0.2 , 1]
            animation.duration = 0.5
            self.layer.addAnimation(animation, forKey: "scale_mo")
        }
        
    }
    
    
    
    
    
}
