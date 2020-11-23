//
//  HistoryViewController.swift
//  Translator
//
//  Created by admin on 18.11.2020.
//

import UIKit

class HistoryViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HistoryCell
        cell.contentView.isUserInteractionEnabled = true
        cell.layer.cornerRadius = 8
        cell.firstText.text = "ciukdsbvcdsjlhbvidusjkbcldhsjbclkdshjvcnkjdsbvnjkdsbvldsnkjlvbdskvldjbvkdjbvdsklvbdskvbmdskvbdskvmbdskvbdsklvmbsdkvmbskvmbsdkvbmsdvksmbdvksbvskdbvksdvbskdvbkdlbvciukdsbvcdsjlhbvidusjkbcldhsjbclkdshjvcnkjdsbvnjkdsbvldsnkjlvbdskvldjbvkdjbvdsklvbdskvbmdskvbdskvmbdskvbdsklvmbsdkvmbskvmbsdkvbmsdvksmbdvksbvskdbvksdvbskdvbkdlbv"
        cell.secondText.text = "ciukdsbvcdsjlhbvidusjkbcldhsjbclkdshjvcnkjdsbvnjkdsbvldsnkjlvbdskvldjbvkdjbvdsklvbdskvbmdskvbdskvmbdskvbdsklvmbsdkvmbskvmbsdkvbmsdvksmbdvksbvskdbvksdvbskdvbkdlbvciukdsbvcdsjlhbvidusjkbcldhsjbclkdshjvcnkjdsbvnjkdsbvldsnkjlvbdskvldjbvkdjbvdsklvbdskvbmdskvbdskvmbdskvbdsklvmbsdkvmbskvmbsdkvbmsdvksmbdvksbvskdbvksdvbskdvbkdlbv"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 340, height: 300)
    }
}

