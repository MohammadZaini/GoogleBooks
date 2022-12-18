//
//  SearchBookCell.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import UIKit
import Kingfisher

class SearchBookCell: UICollectionViewCell {

    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(item: Items) {
        
        bookTitle.text = item.volumeInfo.title
        let url = URL(string: item.volumeInfo.imageLinks.smallThumbnail)
        bookImage.kf.indicatorType = .activity
        bookImage.kf.setImage(with: url, options: [.transition(.fade(0.7))])
        
        
    }

}
