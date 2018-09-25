//
//  MyFirstSectionCell.swift
//  TodayNews
//
//  Created by xun wang on 2018/9/23.
//  Copyright © 2018年 huawei. All rights reserved.
//

import UIKit

class MyFirstSectionCell: UITableViewCell {
    
    var array = [MyConner](){
        didSet {
            self.collectionV.reloadData()
        }
    }
    
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var collectionV: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "MineConnerCell", bundle: nil)
        collectionV.register(nib, forCellWithReuseIdentifier: "MineConnerCell")
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.collectionViewLayout = MyConnerFlowLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension MyFirstSectionCell :UICollectionViewDataSource,UICollectionViewDelegate{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return array.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MineConnerCell", for: indexPath) as! MineConnerCell
        cell.myConner = array[indexPath.row]
        return cell
    }

}
class MyConnerFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: 58, height: 74)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
    }
}
