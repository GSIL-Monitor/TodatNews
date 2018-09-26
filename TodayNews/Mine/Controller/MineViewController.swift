//
//  MineViewController.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/12.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit
import Alamofire

class MineViewController: UITableViewController {
    var sections = [[MyCellModel]]()
    var myConner = [MyConner]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.ym_registerCell(cell: MyFirstSectionCell.self)
        tableView.ym_registerCell(cell: MyOtherCell.self)
        NetworkTool.loadMineModel { (string) in
            self.sections = string
            self.tableView.reloadData()
        }
        
        NetworkTool.loadMineConner { (response) in
            self.myConner = response;
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
    }    

}

extension MineViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0  {
            return 144
        }else {
            return 40
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MyFirstSectionCell
            cell.array = myConner
            return cell
        }else {
            let cell = tableView.ym_dequeueReusableCell(indexPath: indexPath) as MyOtherCell
            let model = sections[indexPath.section][indexPath.row]
            cell.model = model
            return cell
        }
       
    }
    
    
    
}
