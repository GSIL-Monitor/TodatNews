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
        // Do any additional setup after loading the view.
        
        ///dev
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
