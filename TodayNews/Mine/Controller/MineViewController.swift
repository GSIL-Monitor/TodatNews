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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        NetworkTool.loadMineModel { (string) in
            self.sections = string
            self.tableView.reloadData()
        }
        NetworkTool.loadMineConner { (response) in
            print("\(response)")
        }
        // Do any additional setup after loading the view.
    }    

}

extension MineViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self), for: indexPath)
        let model = sections[indexPath.section][indexPath.row]
        cell.textLabel?.text = model.text
        cell.detailTextLabel?.text = model.grey_text
        return cell
    }
    
    
    
}
