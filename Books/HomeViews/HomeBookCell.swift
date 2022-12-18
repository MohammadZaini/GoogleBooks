//
//  HomeBookCell.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import UIKit
import Kingfisher

class HomeBookCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setUpCell(item: Items) {
        
        bookTitle.text = item.volumeInfo.title
        let url = URL(string: item.volumeInfo.imageLinks.thumbnail)
        bookImage.kf.indicatorType = .activity
        bookImage.kf.setImage(with: url, options: [.transition(.fade(0.7))])
        
    }

}
