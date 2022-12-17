//
//  SearchVC.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import UIKit

class SearchVC: UIViewController {
    
    lazy var searchBar: UISearchBar = UISearchBar()
    private let viewModel = SearchViewModel()
    
    @IBOutlet var searchView: SearchView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search for the book title"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        navigationItem.titleView = searchBar
        
        
        searchView.booksCollectionView.delegate = self
        searchView.booksCollectionView.dataSource = self
        searchView.booksCollectionView.register(UINib(nibName: "SearchBookCell", bundle: nil), forCellWithReuseIdentifier: "bookCell")
        
    }


}

extension SearchVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as! SearchBookCell
        cell.bookTitle.text = "Amazing Book"
        cell.bookImage.image = UIImage(systemName: "eraser")
        return cell
    }
    
    
    
}

extension SearchVC: UICollectionViewDelegate {
    
}

extension SearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 1 , height: collectionView.frame.height * 0.3)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }

    
    
}
