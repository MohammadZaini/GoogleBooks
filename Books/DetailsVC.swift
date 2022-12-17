//
//  DetailsVC.swift
//  Books
//
//  Created by Hello on 12/18/22.
//

import UIKit

class DetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search for books"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        navigationItem.titleView = searchBar
       
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
