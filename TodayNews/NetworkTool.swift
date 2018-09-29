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
    static func loadMineModel(_ completionHandler:@escaping (_ mymodel:[[MyCellModel]])->())
    ///mine 关注
    static func loadMineConner(_ completionHandler:@escaping (_ attion :[MyConner])-> ())
    ///offline
    static func loadOfflineModel (_ completionHandler:@escaping (_ mymodel:[OfflineModel])->())

}
extension NetworkToolProtocol
{
    
   
    static func loadMineModel(_ completionHandler:@escaping (_ mymodel:[[MyCellModel]])->())
    {
        var title = [[MyCellModel]]()
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
                let myConcer = "{\"grey_text\":\"\",\"text\":\"我的关注\"}"
                title.append([MyCellModel.deserialize(from: myConcer)!])
                if let data = json["data"].dictionary{
                    if let sections = data["sections"]?.arrayObject{
                        title += sections.flatMap({ item in
                            (item as! [Any]).flatMap({
                                MyCellModel.deserialize(from: $0 as? Dictionary)
                            })
                        })
                    }
                    
                }
                completionHandler(title)
                
            }
        }
        
    }
    //
            
    
    static func loadMineConner(_ completionHandler: @escaping (_ attion :[MyConner])-> ())
    {
        
        var myconner = [MyConner]()
        let BASE_URL = "https://is.snssdk.com"
        let device_id: Int = 6096495334
        let url = BASE_URL + "/concern/v2/follow/my_follow/?device_id=" + "\(device_id)"
        Alamofire.request(url).responseJSON { (response) in
            let json = JSON(response.result.value!)
            if let data = json["data"].arrayObject{
                myconner += data.flatMap({ item in
                    MyConner.deserialize(from: item as? Dictionary)
                })
            }
            completionHandler(myconner)
            
        }
        
    
    }
    
    ///offline
    static func loadOfflineModel (_ completionHandler:@escaping (_ mymodel:[OfflineModel])->())
    {
        var offlineArray = [OfflineModel]()
        let BASE_URL = "https://is.snssdk.com"
        let device_id: Int = 6096495334
        let iid: Int = 5034850950
        let url = BASE_URL + "/article/category/get_subscribed/v1/?device_id=" + "\(device_id)" + "?iid" + "\(iid)"
        Alamofire.request(url).responseJSON { (response) in
            let json = JSON(response.result.value!)
            let data1 = json["data"]
            if let data2 = data1["data"].arrayObject{
                offlineArray += data2.flatMap({ item in
                    OfflineModel.deserialize(from: item as? Dictionary)
                })
            }
            completionHandler(offlineArray)
            
        }
        
    }

}

