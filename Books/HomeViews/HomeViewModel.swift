//
//  HomeViewModel.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var booksArray : [String]!
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as! HomeBookCell
        
        cell.bookTitle.text = "nice job"
        return cell
        
    }
    
}
