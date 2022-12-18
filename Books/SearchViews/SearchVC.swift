//
//  SearchVC.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import UIKit


protocol SearchVCDelegate: AnyObject {
    
    func updateLastSearch(searchKey: String)
}

class SearchVC: UIViewController{
 
    lazy var searchBar: UISearchBar = UISearchBar()
    private let viewModel = SearchViewModel()
    
    var delegate : SearchVCDelegate?
    
    @IBOutlet var searchView: SearchView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search for the book title"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        
        
        searchView.booksCollectionView.delegate = self
        searchView.booksCollectionView.dataSource = self
        searchView.booksCollectionView.register(UINib(nibName: "SearchBookCell", bundle: nil), forCellWithReuseIdentifier: "bookCell")
        
    }
    
    func hanldeResponse(data: Data) {
        do {
            let results = try JSONDecoder().decode(Books.self, from: data)
            viewModel.searchArray = results.items
            searchView.booksCollectionView.reloadData()
            
            
        } catch {
            print("error while parsing")
            
        }
        
        
    }
    


}

extension SearchVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModel.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    
    
}

extension SearchVC: UICollectionViewDelegate {
    
}

extension SearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        viewModel.collectionView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        viewModel.collectionView(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section)
    }

    
    
}

extension SearchVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
    
            self.delegate?.updateLastSearch(searchKey: text)
            
            NetworkManager().fetchData(title: text) { fetchedData in
                self.hanldeResponse(data: fetchedData)
            }
        }
    }
    
}
