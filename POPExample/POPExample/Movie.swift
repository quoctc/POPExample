//
//  Movie.swift
//  POPExample
//
//  Created by Quoc Tran on 9/25/17.
//  Copyright © 2017 Quoc Tran. All rights reserved.
//

import UIKit

struct Movie {
    var id: Int
    var title: String
    var description: String
    
    init(id: Int, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
    
    //init with json string format:
    /*
     {
     "kind": "books#bookshelf",
     "id": integer,
     "selfLink": string,
     "title": string,
     "description": string,
     "access": string,
     "updated": datetime,
     "created": datetime,
     "volumeCount": integer,
     "volumesLastUpdated": datetime
     }
    */
    /*
    init(jsonString: String) {
        
    }
    */
}
