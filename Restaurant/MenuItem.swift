//
//  MenuItem.swift
//  Restaurant
//
//  Created by student17 on 4/23/19.
//  Copyright © 2019 student17. All rights reserved.
//
import Foundation
import UIKit

struct MenuItem: Codable
{
    var id: Int
    var name: String
    var detailText: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey
    {
        case id
        case name
        case detailText = "description"
        case price
        case category
        case imageURL = "image_url"
    } // end of enum CodingKeys
    
} // end of struct MenuItem

struct MenuItems: Codable
{
    let items: [MenuItem]
} // end of MenuItems

