//
//  Restaurant.swift
//  Food Pin
//
//  Created by George on 2/28/19.
//  Copyright © 2019 GeorgeMagdy. All rights reserved.
//

import Foundation
class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var isVisited = false
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
