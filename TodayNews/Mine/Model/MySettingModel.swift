//
//  MySettingModel.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/28.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit
import HandyJSON


struct MySettingModel: HandyJSON {
    var title :String = ""
    var subtitle :String = ""
    var rightTitle :String = ""
    var isHiddenRightTitle :Bool = false
    var isHiddenSubtitle :Bool = false
    var isHiddenRightArraw :Bool = false
    var isHiddenSwitch :Bool = false
}
