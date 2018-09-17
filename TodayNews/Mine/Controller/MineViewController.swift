//
//  MineViewController.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/12.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit
import Alamofire

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkTool.loadRelationFollow { (string) in
            print("\(string)")
        }
        // Do any additional setup after loading the view.
    }

}

extension MineViewController {
    
    
    
    
}
