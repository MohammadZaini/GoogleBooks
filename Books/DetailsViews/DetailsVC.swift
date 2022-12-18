//
//  DetailsVC.swift
//  Books
//
//  Created by Hello on 12/18/22.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {

    var volumeInfo: VolumeInfo?
    
    @IBOutlet var detailsView: DetailsView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        
        detailsView.publisherName.text = volumeInfo?.publisher
        detailsView.publishedDate.text = volumeInfo?.publishedDate
        detailsView.bookDescription.text = volumeInfo?.description
        let url = URL(string: volumeInfo?.imageLinks.smallThumbnail ?? "")
        detailsView.bookImage.kf.setImage(with: url)
    }
    
  

}
