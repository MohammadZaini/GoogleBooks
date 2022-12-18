//
//  SearchViewModel.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import Foundation
import UIKit
import RealmSwift

class SearchViewModel {
    
    
    private let realm = try! Realm()
    var searchArray = [Items]()
    var lastSearchArray = [String]()
    
    
    
    func returnLastSearch() {
        let lastSearch = realm.objects(LastSearchKey.self)
        lastSearchArray = convert(array: lastSearch)
        
    }
    
    func convert(array: Results<LastSearchKey> ) -> [String] {
        var lastObj = String()
        for last in array {
            
            lastObj = last.lastSearch
            lastSearchArray.append(lastObj)
        }
        return lastSearchArray
    }
 
    func deleteRealmObj() {
        
        try! realm.write {
            
            let deleteAllObjects = realm.objects(RealmBooks.self)
            realm.delete(deleteAllObjects)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as! SearchBookCell
        
        let item = searchArray[indexPath.item]
        cell.setUpCell(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 1 , height: collectionView.frame.height * 0.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }

}
