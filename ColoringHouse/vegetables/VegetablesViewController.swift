//
//  VegetablesViewController.swift
//  ColoringHouse
//
//  Created by 辜鹏 on 2019/10/22.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class VegetablesViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSources = ["vegetables1","vegetables2","vegetables3","vegetables4","vegetables5","vegetables6","vegetables7","vegetables8"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        navigationController?.navigationBar.frame = CGRect(x: 0, y: 35, width: screenWidth, height: 44)

    }
    
    
    func setupUI()  {
        
        let title = UIImage(named: "vegetablestitle")
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

extension VegetablesViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:VegetablesCell = collectionView.dequeueReusableCell(withReuseIdentifier:"VegetablesCell", for: indexPath) as! VegetablesCell
        
        cell.imageView.image = UIImage(named: dataSources[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsVc:DetailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        
        detailsVc.passedIndex = indexPath.row
        detailsVc.passedCategory = "vegetables"
        
        navigationController?.pushViewController(detailsVc, animated: true)
        
        
    }
    
    
    
}
