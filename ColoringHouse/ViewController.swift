//
//  ViewController.swift
//  ColoringHouse
//
//  Created by 辜鹏 on 2019/10/22.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI()  {
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()

    }


}

