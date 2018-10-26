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
///api/news/feed/v64/?fp=PlTqFW4_PMFIFlPMFSU1FYmILrFe&version_code=6.7.0&app_name=news_article&vid=3AB35AAE-F324-4C0D-862E-0EB83F9B3AD3&device_id=35133532083&channel=App%20Store&resolution=1242*2208&aid=13&ab_version=425531,559756,552451,486952,542982,554256,239098,562987,467914,170988,170989,493249,552518,374119,437000,478531,517764,489318,501963,562067,553435,550042,435215,562018,551605,522765,416055,561659,558139,555254,378450,471406,557509,271178,326524,326532,545079,559797,562041,496389,537662,546064,554836,549647,424177,214069,549709,559909,562134,442255,563212,546702,280449,281298,325620,547364,552098,562626,431142,498375,554469,539504,467513,554004,543967,444464,304488,457481,562436&ab_feature=z1&openudid=75fbbf856f79eee49c7f58774926bc6a54319a1d&pos=5pe9vb/88Pzt0fLz+vTp6Pn4v72nvayvrbOvrayrqq6tqKqqqqylrrGXvb2//PD87d706eS/vae9v3sAMHgqA3glH7+xl729v/zw/O3R/On06ej5+L+9p72urbOspa6pr6+rqq6kr6+srqmxl729v/H86fTp6Pn4v72nva2xl729v/Hy8/r06ej5+L+9p72tsZe9vb/+9Onkv72nvb97ADB4KgO/l+A%3D&idfv=3AB35AAE-F324-4C0D-862E-0EB83F9B3AD3&ac=WIFI&os_version=12.0&ssmix=a&device_platform=iphone&iid=32820300964&ab_client=a1,f2,f7,e1&device_type=iPhone%207%20Plus&idfa=14708FA6-AE39-45A3-96FF-453ACB22F672&detail=1&category=video&last_refresh_sub_entrance_interval=63&list_entrance=main_tab&tt_from=pull&count=20&loc_mode=1&LBS_status=authroize&cp=5fBeDe153aBBAq1&min_behot_time=1540438906&image=1&strict=0&language=zh-Hans-CN&refer=1&as=a29593ed2aeb1bcb015836&ts=1540438970 HTTP/1.1

let device_id: Int64 = 35133532083
let iid: Int64 = 32820300964
struct NetworkTool :NetworkToolProtocol {}
protocol NetworkToolProtocol {
    
    
    
    ///home模块
    static func homeSuggest(_ handler:@escaping(_ message:String)->())
    static func homeModel(_ handler:@escaping (_ model:[HomeModel])->())
    //我的界面模块
    static func loadMineModel(_ completionHandler:@escaping (_ mymodel:[[MyCellModel]])->())
    ///mine 关注
    static func loadMineConner(_ completionHandler:@escaping (_ attion :[MyConner])-> ())
    ///offline
    static func loadOfflineModel (_ completionHandler:@escaping (_ mymodel:[OfflineModel])->())
    
    
    static func loadHomePageSuggest(_ complementHandler:@escaping (_ dic:NSDictionary)->())

}
extension NetworkToolProtocol
{
    ///home模块
    static func homeSuggest(_ handler:@escaping(_ message:String)->()){
        let BASE_URL = "https://is.snssdk.com"
        
        let url = BASE_URL + "/search/suggest/homepage_suggest/?device_id=" + "\(device_id)"
        Alamofire.request(url).responseJSON { (response) in
            let value = response.result.value
            let json  = JSON(value)
            let str = json["data"].dictionary
            let message = str!["homepage_search_suggest"]?.description
            handler(message!)
            
        }
    }
    static func homeModel(_ handler:@escaping (_ model:[HomeModel])->())
    {
        var array = [HomeModel]()
        let BASE_URL = "https://is.snssdk.com"
        let url = BASE_URL + "/article/category/get_subscribed/v1/?device_id=" + "\(device_id)" + "?iid" + "\(iid)"
        Alamofire.request(url).responseJSON { (response) in
            let value = response.result.value
            let json = JSON(value!)
            guard json["message"] == "success" else{
                return
            }
            let data = json["data"]
            if let dd = data["data"].arrayObject{
                array += dd.flatMap({ item  in
                    HomeModel.deserialize(from: item as? Dictionary)
                })
            }
            handler(array)
        }
    }
   
    static func loadMineModel(_ completionHandler:@escaping (_ mymodel:[[MyCellModel]])->())
    {
        var title = [[MyCellModel]]()
        let BASE_URL = "https://is.snssdk.com"
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
    static func loadHomePageSuggest(_ complementHandler:@escaping (_ dic:NSDictionary)->())
    {
        let BASE_URL = "https://is.snssdk.com"
       
        let url = BASE_URL + "/article/category/get_subscribed/v1/?"
        Alamofire.request(url).responseJSON { (response) in
            let json = JSON(response.result.value!)
            let data1 = json["data"]
            
            complementHandler(data1.dictionary as! NSDictionary)
            
        }
    }

}

