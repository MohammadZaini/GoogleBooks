//
//  DetailsVC.swift
//  Books
//
//  Created by Hello on 12/18/22.
//

import UIKit

class DetailsVC: UIViewController {

    var volumeInfo: VolumeInfo?
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var publisherName: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var bookDescription: UITextView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        publisherName.text = volumeInfo?.publisher
        publishedDate.text = volumeInfo?.publishedDate
        bookDescription.text = volumeInfo?.description
       
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
