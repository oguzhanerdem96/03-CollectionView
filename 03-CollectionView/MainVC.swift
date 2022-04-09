//
//  ViewController.swift
//  03-CollectionView
//
//  Created by Oğuzhan Erdem on 8.04.2022.
//

import UIKit

class MainVC: UIViewController {
    
    static var bottomImageArr = ["a5","a3","v1","v2","v3", "v4"]
        static var albumArr = ["v1","v2","a3","a4","a5","a6","a7","a8","v3","v1","a2","v3", "v4"]
    
    // background Image , All views
    private let myView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bl2")
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    
    
    
    
    private let myCollectionView: UICollectionView = {
        //layout değişkenine UICollectionViewFlowLayout diyerek "layout" değişkenimizi UICollectionViewFlowLayout komutlarını etkinleştiriyoruz.
        let layout = UICollectionViewFlowLayout()
        // collectionViewimize "frame" zero diyerek çerçeveyi sıfırlayıp collectionViewLayoutumuzun ise  verdiğimiz "layout" değişkeni olduğunu belirtiyoruz.
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
       // collectionViewe kendi sınırlarımız içinde olacağını belirtiyoruz.
        
        layout.scrollDirection = .vertical
        cv.backgroundColor = .clear
        cv.register(TopImageCell.self, forCellWithReuseIdentifier: TopImageCell.identifier)
        cv.register(BottomCell.self, forCellWithReuseIdentifier: BottomCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
      return cv
    }()

        

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        

        
    }
    func setupViews() {
        view.addSubview(myView)
        view.addSubview(myCollectionView)
        setCollectionViewConstraints()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }


}
extension MainVC {
    // collectionView Constraints
    func setCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        
    }
}

extension MainVC: UICollectionViewDelegate , UICollectionViewDataSource {
    // 2 tane bölüm olsun
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    // kaçtane hücre oluşturulacağı
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return MainVC.albumArr.count
            
        }
        return 1
    }
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
                print("mysection", indexPath.section)
                // bttmCell section
                if indexPath.section == 1 {
                    let bttmCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: BottomCell.identifier, for: indexPath) as! BottomCell
                    bttmCell.bottomImages = MainVC.albumArr[indexPath.item]
                    return bttmCell
                    
                }
                // top section
                let topCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: TopImageCell.identifier, for: indexPath) as! TopImageCell
                topCell.myImages = MainVC.bottomImageArr
                
                return topCell
            }
    
    
}
extension MainVC: UICollectionViewDelegateFlowLayout {
    // her hücre boyutu width , height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // section 1 için
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width/3) - 16, height: 100)
        }
        // üst section için
        return CGSize(width: view.frame.width, height: 400)
    
    }
    // hücreler arası boşluk için
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
}
