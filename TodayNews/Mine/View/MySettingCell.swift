//
//  MySettingCell.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/28.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

class MySettingCell: UITableViewCell,RegisterCellFromNib {

    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var subtitleLab: UILabel!
    @IBOutlet weak var imagev: UIImageView!
    @IBOutlet weak var ss: UISwitch!
    @IBOutlet weak var rightTitle: UILabel!
    
    var cellModel = MySettingModel(){
        didSet{
            titleLab.text = cellModel.title
            subtitleLab.text = cellModel.subtitle
            rightTitle.text = cellModel.rightTitle
            imagev.isHidden = cellModel.isHiddenRightArraw
            ss.isHidden = cellModel.isHiddenSwitch
            subtitleLab.isHidden = cellModel.isHiddenSubtitle
            rightTitle.isHidden = cellModel.isHiddenRightTitle
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
