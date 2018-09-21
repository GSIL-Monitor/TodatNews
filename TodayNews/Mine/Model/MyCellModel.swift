//
//  MyCellModel.swift
//  TodayNews
//
//  Created by xun wang on 2018/9/20.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit
import HandyJSON


struct MyCellModel: HandyJSON {
    var grey_text :String = ""
    var url:String = ""
    var text:String = ""
    var key:String = ""
    var tip_new:Int = 0
    
}
struct MyConner :HandyJSON {
    var description:String = ""
    var url:String = ""
    var tips:Bool = false
    var icon:String = ""
    var type:String = ""
    var name:String = ""
    var media_id:Bool = false
    var userid:Int = 0
    var time:String = ""
    var is_verify:Bool = false
    var user_auth_info:String = ""
    var userAuthInfo:UserAuthInfo?{
        return UserAuthInfo.deserialize(from: user_auth_info)
    }
    
    var id:Int=0
}
struct UserAuthInfo :HandyJSON{
    var auth_type:String = ""
    var auth_info:String = ""
}
