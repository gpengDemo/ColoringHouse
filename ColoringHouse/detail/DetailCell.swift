//
//  DetailCell.swift
//  ColoringHouse
//
//  Created by 辜鹏 on 2019/10/23.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: PaintImageView!
    
    
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
}

extension DetailCell :UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return imageView
    
    }

}
