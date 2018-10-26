//
//  UIColor+Extention.swift
//  TodayNews
//
//  Created by tupservice on 2018/9/12.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

protocol NibLoadable{}
extension NibLoadable{
    static func loadViewFromNib() ->Self{
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! Self
    }
}
extension UIView
{
    var x:CGFloat{
        get {return frame.origin.x}
        set(newValue){
            var newFrame:CGRect = frame
            newFrame.origin.x = newValue
            frame = newFrame
        }
    }
    
    var y:CGFloat{
        get {return frame.origin.y}
        set(newValue){
            var newFrame:CGRect = frame
            newFrame.origin.y = newValue
            frame = newFrame
        }
    }
    var size :CGSize{
        get {return frame.size}
        set(newValue){
            var newSize = frame.size
            newSize = newValue
            frame.size = newSize
        }
    }
    var width:CGFloat{
        get{
            return frame.size.width
        }
        set(newValue){
            var  newSize = frame.size
            newSize.width = newValue
            frame.size = newSize
        }
    }
    var height:CGFloat{
        get{
            return frame.size.height
        }
        set(newValue){
            var newFrame = frame
            newFrame.size.height = newValue
            frame = newFrame
        }
    }
    var centerX:CGFloat{
        get{
            return center.x
        }
        set(newValue){
            var newCenter = center
            newCenter.x = newValue
            center = newCenter
        }
    }
    var centerY:CGFloat{
        get{
            return center.y
        }
        set(newValue){
            var newCenter = center
            newCenter.y = newValue
            center = newCenter
        }
    }
}

extension UIColor{
   class func globalColor() -> UIColor {
        return UIColor(red: 245/255.0, green: 93/255.0, blue: 245/255.0, alpha: 1.0)
    }
}

protocol RegisterCellFromNib{
    
}
extension RegisterCellFromNib{
    static var identifier:String{
        return "\(self)"
    }
    static var nib :UINib?{
        return UINib(nibName: "\(self)", bundle: nil)
    }
}

extension UITableView
{
    func ym_registerCell<T:UITableViewCell>(cell:T.Type) where T:RegisterCellFromNib
    {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        }else{
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    func ym_dequeueReusableCell<T:UITableViewCell>(indexPath:IndexPath) -> T where T:RegisterCellFromNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
extension UICollectionView
{
    func ym_registerCell<T:UICollectionViewCell>(cell:T.Type) where T:RegisterCellFromNib {
        if let nib = T.nib{
            register(nib, forCellWithReuseIdentifier: T.identifier)
        }else{
            register(cell, forCellWithReuseIdentifier: T.identifier)
        }
    }
    func ym_dequeueReuseableCell<T:UICollectionViewCell>(indexPath:IndexPath) -> T where T:RegisterCellFromNib {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}




