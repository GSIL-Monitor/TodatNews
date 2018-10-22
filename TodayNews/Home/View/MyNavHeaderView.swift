//
//  MyNavHeaderView.swift
//  TodayNews
//
//  Created by tupservice on 2018/10/22.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

protocol MyNavHeaderViewDidDelegate: class {
    func leftClick(_ sender :UIButton)
    func centerClick(_ sender :UIButton)
    func rightClick(_ sender :UIButton)
}


class MyNavHeaderView: UIView,NibLoadable {
    
    weak var delegate :MyNavHeaderViewDidDelegate?
    

    @IBAction func leftClick(_ sender: UIButton) {
        delegate?.leftClick(sender)
       
    }
    
    @IBAction func centerClick(_ sender: UIButton) {
        delegate?.centerClick(sender)
    }
    
    
    @IBAction func rightClick(_ sender: UIButton) {
        delegate?.rightClick(sender)
    }
    
    override func awakeFromNib() {
        self.frame = CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 64)
        super.awakeFromNib()
    }
}
