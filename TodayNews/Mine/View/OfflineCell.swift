//
//  OfflineCell.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/29.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

class OfflineCell: UITableViewCell,RegisterCellFromNib {

    @IBOutlet weak var leftLab: UILabel!
    @IBOutlet weak var rightBtn: UIButton!
    
    var model = OfflineModel() {
        didSet{
            leftLab.text = model.name
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
