//
//  Home.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet var homeView: HomeView!
    private let viewModel = HomeViewModel()
    
    lazy var searchBar: UISearchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.lastSearch.layer.cornerRadius = 25
        homeView.lastSearch.clipsToBounds = true
        
         searchBar.searchBarStyle = UISearchBar.Style.default
         searchBar.placeholder = " Search for books"
         searchBar.sizeToFit()
         searchBar.isTranslucent = false
         navigationItem.titleView = searchBar
        
        homeView.booksCollectionView.dataSource = self
        homeView.booksCollectionView.delegate = self
        
        NetworkManager().fetchData()
    }

    
    
    func handleResponse(data: Data) {
        do {
            let response = try JSONDecoder().decode(Books.self, from: data)
            print(response)
        } catch {
            
            print("Error while parsing")
        }
    }


    
    var api = "https://www.googleapis.com/books/v1/volumes?q=title&key= https://www.googleapis.com/books/v1/volumes/id?key= "

}

extension HomeVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModel.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    
    
}

extension HomeVC : UICollectionViewDelegate {
    
    
}
