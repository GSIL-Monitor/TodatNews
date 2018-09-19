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
import SwiftyJSON


struct NetworkTool :NetworkToolProtocol {}
protocol NetworkToolProtocol {
    
    //我的界面模块
    static func loadMineModel(_ completionHandler:@escaping (_ mymodel:[MyCellModel])->())
    ///mine 关注
    static func loadRelationFollow(_ completionHandler:@escaping (_ attion :String)-> ())

}
extension NetworkToolProtocol
{
    
   
    static func loadMineModel(_ completionHandler:@escaping (_ mymodel:[MyCellModel])->())
    {
        var titles = [MyCellModel]()
        let BASE_URL = "https://is.snssdk.com"
        let device_id: Int = 6096495334
        //        let iid: Int = 5034850950
        let url = BASE_URL + "/user/tab/tabs/?device_id=" + "\(device_id)"
        Alamofire.request(url).responseJSON { (response) in
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                if let data = json["data"].dictionary {
                    if let sections = data["sections"]?.arrayObject {
                        completionHandler(sections.flatMap({ item in
                            .flatMap({ row in
                                MyCellModel.deserialize(from: row as? NSDictionary)
                            })
                        }))
                    }
                }
            }
    }
            
    
    static func loadRelationFollow(_ completionHandler: @escaping (_ attion :String)-> ())
    {
        
        let BASE_URL = "https://is.snssdk.com"
        let device_id: Int = 6096495334
        let url = BASE_URL + "/concern/v2/follow/my_follow/?device_id=" + "\(device_id)"
        Alamofire.request(url).responseJSON { (string) in
            completionHandler(string.description)
        }
        
    
    }

}

