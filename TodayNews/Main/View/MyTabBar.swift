//
//  MyTabBar.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/12.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var publishBtn:UIButton = {
       let  publishBtn = UIButton(type: .custom)
        publishBtn.setImage(UIImage(named:"feed_publish_44x44_"), for: .normal)
        publishBtn.sizeToFit()
        return publishBtn
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let widthd:CGFloat =  frame.width*0.2
        let heightd:CGFloat = 49
        var index = 0
        publishBtn.center = CGPoint(x: frame.width*0.5, y: heightd*0.5-7)
        for button in subviews {
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){
                continue
            }
            let buttonwidthindex = index > 1 ? CGFloat(index+1) :CGFloat(index)
            button.frame = CGRect(x: CGFloat(buttonwidthindex * widthd), y: 0, width: CGFloat(widthd), height: CGFloat(heightd))
    
            index += 1
            
            
        }
    }
    
}
