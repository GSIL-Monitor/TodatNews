//
//  MyOtherCell.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/26.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

class MyOtherCell: UITableViewCell,RegisterCellFromNib{
    
    var model = MyCellModel(){
        didSet{
            leftLab.text = model.text
            rightLab.text = model.grey_text
        }
    }
    

    @IBOutlet weak var leftLab: UILabel!
    @IBOutlet weak var rightLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
