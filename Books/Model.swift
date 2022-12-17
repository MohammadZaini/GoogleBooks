//
//  Model.swift
//  Books
//
//  Created by Hello on 12/17/22.
//

import Foundation

struct Books: Codable {
    var kind : String
    var totalItems : Int
    var items : [Items]
    
}


struct Items: Codable {
    var id : String?
    var volumeInfo : VolumeInfo
    
}
struct VolumeInfo: Codable {
    var title : String
    var subtitle: String?
    var publisher : String?
    var publishedDate: String?
    var imageLinks : ImageLinks
    var language: String?
    
    
    
}
struct ImageLinks: Codable {
    var smallThumbnail: String
    var thumbnail : String
    
}
