//
//  HistoryViewController.swift
//  Translator
//
//  Created by admin on 18.11.2020.
//

import UIKit
import RealmSwift

class HistoryViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var translatedItems : Results<Text>?
    var sectionInsets = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        translatedItems = DBManager.sharedDB.getDataFrDB()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = translatedItems?.count else { return 0 }
        return count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HistoryViewCell
        cell.contentView.isUserInteractionEnabled = true
        cell.layer.cornerRadius = 8
        let items : Text = (translatedItems!.sorted(byKeyPath: "date", ascending: false)[indexPath.row])
        cell.setLabels(item: items)

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.bottom * (1 + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / 1
        
        if let item = translatedItems?.sorted(byKeyPath: "date", ascending: false)[indexPath.row] {
            
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            
            let estimatedFrame = NSString(string: item.inputText + item.translatedText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: nil, context: nil)
            
            return CGSize(width: widthPerItem, height: estimatedFrame.height + 110)
        }
        return CGSize(width: widthPerItem, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.bottom
    }
}

