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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.register(UINib(nibName: "MyFirstSectionCell", bundle: nil), forCellReuseIdentifier: "MyFirstSectionCell")
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstSectionCell", for: indexPath) as! MyFirstSectionCell
            cell.array = myConner
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
            let model = sections[indexPath.section][indexPath.row]
            cell.textLabel?.text = model.text
            cell.detailTextLabel?.text = model.grey_text
            return cell
        }
       
    }
    
    
    
}
