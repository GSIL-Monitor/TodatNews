//
//  MySettingTableViewController.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/28.
//  Copyright © 2018年 huawei. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class MySettingTableViewController: UITableViewController {
    var array = [[MySettingModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.ym_registerCell(cell: MySettingCell.self)
        tableView.rowHeight = 44
        let path = Bundle.main.path(forResource: "MySetting", ofType: "plist")
        let dic  = NSArray(contentsOfFile: path!) as! [Any]
       array = dic.flatMap { item  in
        (item as! [Any]).flatMap({
                MySettingModel.deserialize(from: $0 as? Dictionary)
            })
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return array.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array[section].count
    }

 
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MySettingCell
        cell.cellModel = array[indexPath.section][indexPath.row]
        
        return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 0:
               let vc = OffLineViewController()
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
            
        default:
            break
        }
        
    }
    

}
extension MySettingTableViewController
{
    func calculate()  {
        let cache = KingfisherManager.shared.cache
        cache.calculateDiskCacheSize { size in
            let sizeM = Double(size)/1024/1024
            let ssss =  String(format: "%.2fM", sizeM)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "sendClear"), object: self, userInfo: ["sendClear":ssss])
        }
    }
}
