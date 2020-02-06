//
//  DetailViewController.swift
//  ColoringHouse
//
//  Created by 辜鹏 on 2019/10/23.
//  Copyright © 2019 PengGu. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation
class DetailViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var currentIndexPath: IndexPath? {
        for cell in self.collectionView.visibleCells {
            let indexPath = self.collectionView.indexPath(for: cell)
            return indexPath
        }
        
        return nil
    }
    
    var passedIndex:Int?
    
    var passedCategory:String?
    var dataSources:[String] = [String]()
    var dataSources_vegetables = ["vegetables1","vegetables2","vegetables3","vegetables4","vegetables5","vegetables6","vegetables7","vegetables8"]
    var dataSources_clothes = ["clothes1","clothes2","clothes3","clothes4","clothes5","clothes6","clothes7","clothes8"]
    var dataSources_food = ["food1","food2","food3","food4","food5","food6","food7","food8"]
    
    
    var penColordataSource = [.green,.yellow,.red, UIColor.rgb(red: 251, green: 79, blue: 82),UIColor.rgb(red: 9, green: 19, blue: 186),UIColor.rgb(red: 249, green: 0, blue: 192),UIColor.rgb(red: 36, green: 228, blue: 253),UIColor.rgb(red: 27, green: 126, blue: 252),UIColor.rgb(red: 159, green: 0, blue: 251),UIColor.rgb(red: 247, green: 0, blue: 128)]
    
    var preButton:UIBarButtonItem?
    var nextButton:UIBarButtonItem?
    
    
    @IBOutlet var penButtons: [UIButton]!
    
    var enlarge:CGFloat = 1
    
    

    var tapflag = [false,false,false,false,false,false,false,false,false,false]
    
    var player:AVAudioPlayer?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initdataSource()
        setupUI()
        navigationController?.navigationBar.frame = CGRect(x: 0, y: 35, width: screenWidth, height: 44)
        

        
        DispatchQueue.main.async {
            
            self.collectionView.scrollToItem(at: IndexPath(row: self.passedIndex!, section: 0), at: .right, animated: false)
            self.collectionView.layoutSubviews()

        }
        
        playbgMusic()
        
        
    }
    
    func playbgMusic()  {
        
        let url = Bundle.main.url(forResource: "bgmusic", withExtension: "mp3")!

        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }

            player.prepareToPlay()
            player.play()
            player.numberOfLoops = -1

        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func enlargeAction(_ sender: Any) {
        
        enlarge = enlarge + 0.1
        let cell:DetailCell = collectionView.cellForItem(at:currentIndexPath! ) as! DetailCell
        
        UIView.animate(withDuration: 0.3) { () -> Void in
            
            cell.imageView.transform = CGAffineTransform(scaleX: self.enlarge, y: self.enlarge)
            
            UserDefaults.standard.set(cell.scrollView.contentSize.width, forKey: "width")
            UserDefaults.standard.set(cell.scrollView.contentSize.height, forKey: "height")

           
            cell.scrollView.contentSize.width =  cell.scrollView.contentSize.width + 20
            
            cell.scrollView.contentSize.height =  cell.scrollView.contentSize.height + 20
        }
        
    }
    
    
    @IBAction func reductionAction(_ sender: Any) {
        
        
        let cell:DetailCell = collectionView.cellForItem(at:currentIndexPath! ) as! DetailCell
        
        UIView.animate(withDuration: 0.3) { () -> Void in
            
            cell.imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            var width = UserDefaults.standard.float(forKey: "width")
            var height = UserDefaults.standard.float(forKey: "height")
            
            
            
            cell.scrollView.contentSize.width =  CGFloat(width)
             
            cell.scrollView.contentSize.height =  CGFloat(height)

            
        }

        
        
        
    }
    
    

    @IBAction func clearAction(_ sender: Any) {
        
        let cell:DetailCell = collectionView.cellForItem(at:currentIndexPath! ) as! DetailCell
        cell.imageView.newColor = .white
    }
    
    
    
    @IBAction func randomAction(_ sender: Any) {
        
        let redRandom = Int.random(in: 0...255)
        let greenRandom = Int.random(in: 0...255)
        let blueredRandom = Int.random(in: 0...255)

        
        let cell:DetailCell = collectionView.cellForItem(at:currentIndexPath! ) as! DetailCell
        cell.imageView.newColor = UIColor.rgb(red: CGFloat(redRandom), green: CGFloat(greenRandom), blue: CGFloat(blueredRandom))

        
    }
    
    
    
    @IBAction func touchPenAction(_ sender: UIButton) {
        
        if  let penNumber = penButtons.firstIndex(of: sender) {
            
            print("sender num \(penNumber)")
            
            let cell:DetailCell = collectionView.cellForItem(at:currentIndexPath! ) as! DetailCell
            cell.imageView.newColor = penColordataSource[penNumber]
            
            
            // default state
            if tapflag[penNumber] == false {
                
                UIView.animate(withDuration: 0.7) { () -> Void in
                    sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                }
                
                
                let nums = [0,1,2,3,4,5,6,7,8,9]
                
                let exceptNums = nums.filter{
                    
                    $0 != penNumber
                }
                for item in exceptNums {
                    
                    UIView.animate(withDuration: 0.7) { () -> Void in
                        self.penButtons[item].transform = CGAffineTransform(scaleX: 1, y: 1)
                    }

                }
                
                
                tapflag[penNumber] = true
                
                return

                
            }else {
                
                UIView.animate(withDuration: 0.7) { () -> Void in
                    sender.transform = CGAffineTransform(scaleX: 1, y: 1)
                }

                tapflag[penNumber] = false

                
            }
            
            
            
            
            
        
            
        } else {
            
            print("chosen pen was not in penButtons")
            
        }
        
    }
    
    func initdataSource()  {
        
        switch passedCategory {
            
        case "food":
            dataSources = dataSources_food
        case "vegetables":
            dataSources = dataSources_vegetables
        case "clothes":
            dataSources = dataSources_clothes
        default:
            print("error ... ")
        }
        
        
    }
    
    
    func setupUI()  {
        
        let preImage    = UIImage(named: "back")!
        let nextImage  = UIImage(named: "next")!
        
        preButton   = UIBarButtonItem(image: preImage.withRenderingMode(.alwaysOriginal),  style: .plain, target: self, action: #selector(preAction))
        nextButton = UIBarButtonItem(image: nextImage.withRenderingMode(.alwaysOriginal),  style: .plain, target: self, action:#selector(nextAction))
        
        navigationItem.rightBarButtonItems = [nextButton!,preButton!]
        
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: detailWidth , height: detailHeight + 30 )
        
        layout.scrollDirection = .horizontal
        
        collectionView.collectionViewLayout = layout
        
        
    }
    
    
    
    @objc func preAction(){
        
         
        
        var correntRowIndex = currentIndexPath!.row  - 1
        
        
        if correntRowIndex <=  0  {
            
            correntRowIndex = 7
            preButton?.tintColor = .clear
            
        }else{
            
            preButton?.tintColor = nil
            nextButton?.tintColor = nil
            
        }
        
        collectionView.scrollToItem(at: IndexPath(row: correntRowIndex, section: 0), at: .centeredHorizontally, animated: false)
        
        
    }
    
    @objc func nextAction(){
        
        var correntRowIndex = currentIndexPath!.row  + 1

        if correntRowIndex == dataSources.count  {
           
            correntRowIndex = 0

            nextButton?.tintColor = .clear
            
        }else{
            
            preButton?.tintColor = nil
            nextButton?.tintColor = nil
        }
        
        
        collectionView.scrollToItem(at: IndexPath(row: correntRowIndex, section: 0), at: .centeredHorizontally, animated: false)
        
        
    }
    
    
    
    
    
    
}
extension DetailViewController:UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:DetailCell = collectionView.dequeueReusableCell(withReuseIdentifier:"DetailCell", for: indexPath) as! DetailCell
        
        cell.imageView.image = UIImage(named: dataSources[indexPath.row])
        
        return cell
        
    }
    

    
    
}


