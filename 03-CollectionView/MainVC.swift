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
    
    private let myCollectionView: UICollectionView = {
        //layout değişkenine UICollectionViewFlowLayout diyerek "layout" değişkenimizi UICollectionViewFlowLayout komutlarını etkinleştiriyoruz.
        let layout = UICollectionViewFlowLayout()
        // collectionViewimize "frame" zero diyerek çerçeveyi sıfırlayıp collectionViewLayoutumuzun ise  verdiğimiz "layout" değişkeni olduğunu belirtiyoruz.
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
       // collectionViewe kendi sınırlarımız içinde olacağını belirtiyoruz.
        cv.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        
        cv.register(TopImageCell.self, forCellWithReuseIdentifier: TopImageCell.identifier)
        cv.register(BottomCell.self, forCellWithReuseIdentifier: BottomCell.identifier)
        
        
      return cv
    }()

        

    override func viewDidLoad() {
        super.viewDidLoad()
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
                
                // bttmCell section
                if indexPath.section == 1 {
                    let bttmCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: BottomCell.identifier, for: indexPath) as! BottomCell
                    bttmCell.backgroundColor = .blue
                    return bttmCell
                    
                }
                // top section
                let topCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: TopImageCell.identifier, for: indexPath) as! TopImageCell
                topCell.backgroundColor = .green
                
                return topCell
            }
    
    
}
