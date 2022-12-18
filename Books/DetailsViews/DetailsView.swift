//
//  DetailsView.swift
//  Books
//
//  Created by Hello on 12/18/22.
//

import UIKit

class DetailsView: UIView {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var publisherName: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    
    
   private var viewModel = DetailsViewModel()
    
    
    func setUpItems(item: Items) {
//        viewModel.bookDetails?.publisher
        publisherName.text   = item.volumeInfo.publisher
        publishedDate.text   = item.volumeInfo.publishedDate
        bookDescription.text = item.volumeInfo.description
        
        let url = URL(string: item.volumeInfo.imageLinks.smallThumbnail)
        bookImage.kf.setImage(with: url)
        
        
    }
    
}
