//
//  ClothesViewController.swift
//  ColoringHouse
//
//  Created by 辜鹏 on 2019/10/22.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class ClothesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSources = ["clothes1","clothes2","clothes3","clothes4","clothes5","clothes6","clothes7","clothes8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        navigationController?.navigationBar.frame = CGRect(x: 0, y: 35, width: screenWidth, height: 44)

    }
    
    
    
    func setupUI()  {
        
        let title = UIImage(named: "clothestitle")
        let imageView = UIImageView(image:title)
        self.navigationItem.titleView = imageView
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 14
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        let width = contentWidth / 2 - 2
        
        let height = contentHeight / 4
        
        layout.itemSize = CGSize(width: width , height: height)
        
        layout.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = layout
        
        
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = item
        
    }
    
}

extension ClothesViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:ClothesCell = collectionView.dequeueReusableCell(withReuseIdentifier:"ClothesCell", for: indexPath) as! ClothesCell
        
        cell.imageView.image = UIImage(named: dataSources[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let detailsVc:DetailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        
        detailsVc.passedIndex = indexPath.row
        detailsVc.passedCategory = "clothes"
        
        navigationController?.pushViewController(detailsVc, animated: true)
        
        
    }
    
    
}
