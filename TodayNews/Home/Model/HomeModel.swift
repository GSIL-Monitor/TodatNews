//
//  HomeModel.swift
//  TodayNews
//
//  Created by tupservice on 2018/10/23.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit
import HandyJSON


struct HomeModel: HandyJSON {
    var category :String = ""
    var web_url:String = ""
    var name:String = ""
    var concern_id:String = ""
    var icon_url:String = ""
    var flags:Int = 0
    var tip_new:Int = 0
    var default_add:Int = 0
}
