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
    
    var realmArray : Results<RealmBooks>?
    
    let realm = try! Realm()
    
    func getRealmObjects() {
        let any = realm.objects(RealmBooks.self)
        realmArray = any
//        print(realmArray)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(realmArray?.count)
        return booksArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as! HomeBookCell
        let item = booksArray[indexPath.row]
        cell.setUpCell(item: item)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 1 , height: collectionView.frame.height * 0.3)
    }

    
}
