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
    
    private let realm = try! Realm()
    
    func getRealmObjects() {
        let realmObjects = realm.objects(RealmBooks.self)
        booksArray = fillBooksArray(array: realmObjects)
    }
    
    func fillBooksArray(array: Results<RealmBooks> ) -> [Items] {
        
        for book in array {
            var bookObj = Items()
            
            bookObj.id                                   = book.id
            bookObj.volumeInfo.title                     = book.title
            bookObj.volumeInfo.publishedDate             = book.publishedDate
            bookObj.volumeInfo.description               = book.description
            bookObj.volumeInfo.imageLinks.smallThumbnail = book.smallThumbnail
            bookObj.volumeInfo.imageLinks.thumbnail      = book.thumbnail
            self.booksArray.append(bookObj)
        }
        
        return booksArray
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
