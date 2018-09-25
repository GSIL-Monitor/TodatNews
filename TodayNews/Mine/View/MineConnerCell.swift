//
//  MineConnerCell.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/21.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

class MineConnerCell: UICollectionViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    
    var myConner = MyConner(){
        didSet{
            imageV.image = UIImage(named: myConner.icon)
            nameLab.text = myConner.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    
    
}
