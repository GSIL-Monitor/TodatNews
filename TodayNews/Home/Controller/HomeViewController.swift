//
//  HomeViewController.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/12.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit



extension HomeViewController {
    func leftClick(_ sender :UIButton)
    {
        print("1")
    }
    func centerClick(_ sender :UIButton)
    {
        print("2")
    }
    func rightClick(_ sender :UIButton)
    {
        print("3")
    }
}
class HomeViewController: UIViewController,MyNavHeaderViewDidDelegate {
    
    var header = MyNavHeaderView.loadViewFromNib()
    var homeModel :NSArray?
    
    var title = SGPageTitleView
    

    let mineTitleTable = MineTitleTable()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        view.addSubview(header)
        header.delegate = self
        
        
        
        NetworkTool.loadOfflineModel { (response) in
            self.mineTitleTable.insert(response)
        }
        NetworkTool.homeModel { (response) in
            self.homeModel = response as NSArray
        }
        // Do any additional setup after loading the view.
        
        ///dev
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
