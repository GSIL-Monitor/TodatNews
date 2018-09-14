//
//  NetworkTool.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/12.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit
import Foundation
import Alamofire


struct NetworkTool :NetworkToolProtocol {}
protocol NetworkToolProtocol {
    ///mine 关注
    static func loadRelationFollow(_ completionHandler:@escaping (_ attion :String)-> ())

}
extension NetworkToolProtocol
{
    static func loadRelationFollow(_ completionHandler: @escaping (_ attion :String)-> ())
    {
        var str = ""
        let BASE_URL = "https://is.snssdk.com"
        let device_id: Int = 6096495334
        let iid: Int = 5034850950
        let url = BASE_URL + "/concern/v2/follow/my_follow/?device_id=" + "\(device_id)"
        let params = ["device_id": device_id]
        Alamofire.request(url).responseJSON { (string) in
            completionHandler(string.description)
        }
        
    
    }

}

