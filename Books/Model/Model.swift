//
//  Model.swift
//  Books
//
//  Created by Hello on 12/17/22.
//

import Foundation
import RealmSwift

struct Books: Codable {
    var kind : String?
    var totalItems : Int?
    var items : [Items]?
    
}

struct Items: Codable {
    var id : String = ""
    var volumeInfo : VolumeInfo = VolumeInfo()
    
}

struct VolumeInfo: Codable {
    var title : String = ""
    var subtitle: String?
    var description : String?
    var publisher : String?
    var publishedDate: String?
    var imageLinks : ImageLinks = ImageLinks()
    var language: String?

}
struct ImageLinks: Codable {
    var smallThumbnail: String = ""
    var thumbnail : String = ""
    
}

class RealmBooks: Object {
    
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var title: String = ""
    @Persisted var subtitle: String = ""
    @Persisted var publisher: String = ""
    @Persisted var publishedDate: String = ""
    @Persisted var smallThumbnail: String = ""
    @Persisted var thumbnail: String = ""
    
}

class LastSearchKey: Object {
    @Persisted var lastSearch: String = ""
    
}
