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
    
    
    func fillData(item: VolumeInfo) {
        
        bookTitle.text = item.title
        let url = URL(string: item.imageLinks.thumbnail)
        bookImage.kf.setImage(with: url)
        
    }

}
