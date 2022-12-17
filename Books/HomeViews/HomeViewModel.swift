//
//  HomeViewModel.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import Foundation
import UIKit
import RealmSwift
import Kingfisher

class HomeViewModel {
    
    var booksArray = [Items]()
    
    var realmArray : Results<LastSearch>?
    
    let realm = try! Realm()
    
    func getRealmObjects() {
        let any = realm.objects(LastSearch.self)
        realmArray = any
//        print(realmArray)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(realmArray?.count)
        return realmArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as! HomeBookCell
        let data = realmArray?[indexPath.row]
        
        cell.bookTitle.text = data?.title
        let url = URL(string: data?.smallThumbnail ?? "")
        cell.bookImage.kf.setImage(with: url)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 1 , height: collectionView.frame.height * 0.3)
    }

    
}
