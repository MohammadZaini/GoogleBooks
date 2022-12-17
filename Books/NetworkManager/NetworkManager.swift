//
//  NetworkManager.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func fetchData(title: String, completion: @escaping (_ fetchedData: Data) -> Void) {
        AF.request("https://www.googleapis.com/books/v1/volumes?q=\(title)&key=").response {(response) in
            
            if response.data != nil {
                completion(response.data!)
                
                
//                self.handleResponse(data: response.data!)
                
                
            }
            
        }
        
    }
    

    
    
    
    
}
