//
//  NetworkManager.swift
//  Books
//
//  Created by Hello on 12/16/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func fetchData() {
        AF.request("https://www.googleapis.com/books/v1/volumes?q=title&key=").response {(response) in
            
            if response.data != nil {
                
                self.handleResponse(data: response.data!)
            }
            
            print(response)
            
        }
        
    }
    
    func handleResponse(data: Data) {
        do {
            let response = try JSONDecoder().decode(Books.self, from: data)
            print(response)
        } catch {
            
            print("Error while parsing")
        }
    }

    
    
    
    
}
