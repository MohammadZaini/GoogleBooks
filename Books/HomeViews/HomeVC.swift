//
//  Home.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import UIKit
import RealmSwift

protocol HomeVCDelegate {
    
    func navigateToDetailsVC()
    
}

class HomeVC: UIViewController {

    @IBOutlet var homeView: HomeView!
    private let viewModel = HomeViewModel()
    
    
    let realm = try! Realm()
    lazy var searchBar: UISearchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        NetworkManager().fetchData(title: "great") { fetchedData in
            self.handleResponse(data: fetchedData)
        }
        
        homeView.booksCollectionView.register(UINib(nibName: "HomeBookCell", bundle: nil), forCellWithReuseIdentifier: "bookCell")
        
        homeView.lastSearch.layer.cornerRadius = 25
        homeView.lastSearch.clipsToBounds = true
        
         searchBar.searchBarStyle = UISearchBar.Style.default
         searchBar.placeholder = " Search for books"
         searchBar.sizeToFit()
         searchBar.isTranslucent = false
         navigationItem.titleView = searchBar
        searchBar.delegate = self
        
        homeView.booksCollectionView.dataSource = self
        homeView.booksCollectionView.delegate   = self
        
        viewModel.getRealmObjects()
        
    }
    
    
    
    func handleResponse(data: Data) {
        do {
            let results = try JSONDecoder().decode(Books.self, from: data)
            viewModel.booksArray = results.items
            print(viewModel.booksArray.count)
            
            for book in results.items {
                
                try realm.write {
                    
                    
                    
                    let realmObj = LastSearch()
                
                    realmObj.id = book.id
                    realmObj.title = book.volumeInfo.title
                    realmObj.subtitle = book.volumeInfo.subtitle ?? ""
                    realmObj.publishedDate = book.volumeInfo.publishedDate ?? ""
                    realmObj.smallThumbnail = book.volumeInfo.imageLinks.smallThumbnail
                    realmObj.thumbnail = book.volumeInfo.imageLinks.thumbnail
                    
                    
                    realm.add(realmObj, update: .all)
                }
            }
            
            
            
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


extension HomeVC: SearchVCDelegate {
    func updateLastSearch(searchKey: String) {
//        let vc = SearchVC()
//        vc.delegate = self
        print("the searchc key is: \(searchKey)")
        homeView.lastSearch.text = searchKey
    }
    
 
    
    
    
    }
extension HomeVC : UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = viewModel.realmArray![indexPath.item]
    
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
}

extension HomeVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let vc = SearchVC()
        vc.delegate = self
//        present(vc, animated: true)
        self.navigationController?.pushViewController(vc , animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
