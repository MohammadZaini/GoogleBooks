//
//  DetailsView.swift
//  Books
//
//  Created by Hello on 12/18/22.
//

import UIKit
import Kingfisher

class DetailsView: UIView {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var publisherName: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    
    
    var viewModel = DetailsViewModel()
    
    
    func updateUI() {
        publisherName.text   = viewModel.bookDetails?.publisher
        publishedDate.text   = viewModel.bookDetails?.publishedDate
        bookDescription.text = viewModel.bookDetails?.description
        let url = URL(string: viewModel.bookDetails?.imageLinks.smallThumbnail ?? "")
        bookImage.kf.setImage(with: url)
        
    }
    
}
