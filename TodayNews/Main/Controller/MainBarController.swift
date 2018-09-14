//
//  MainBarController.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/12.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

class MainBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.globalColor()
        let bar = UITabBar.appearance()
        bar.tintColor = UIColor.orange
        addAllChild()

        // Do any additional setup after loading the view.
    }
    func addAllChild(){
        setChildVC(viewController: HomeViewController(), imageName: "home_tabbar_night_32x32_", selectedImage: "home_tabbar_press_night_32x32_", title: "首页")
        setChildVC(viewController: HuoShanViewController(), imageName: "huoshan_tabbar_night_32x32_", selectedImage: "huoshan_tabbar_press_night_32x32_", title: "火山")
        setChildVC(viewController: VideoViewController(), imageName: "video_tabbar_night_32x32_", selectedImage: "video_tabbar_press_night_32x32_", title: "视频")
        setChildVC(viewController: MineViewController(), imageName: "mine_tabbar_night_32x32_", selectedImage: "mine_tabbar_press_night_32x32_", title: "我的")
        setValue(MyTabBar(), forKey: "tabBar")
    }
    private func setChildVC(viewController:UIViewController,imageName:String,selectedImage:String,title:String){
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage(named:selectedImage)
        viewController.title = title
        let nav = MyNavController(rootViewController: viewController)
        addChildViewController(nav)
        
    }

}
