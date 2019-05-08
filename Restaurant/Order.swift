//
//  Order.swift
//  Restaurant
//
//  Created by student17 on 4/23/19.
//  Copyright © 2019 student17. All rights reserved.
//

import Foundation

struct Order : Codable
{
    var menuItems : [MenuItem]
    
    init(menuItems : [MenuItem] = [])
    {
        self.menuItems = menuItems
    } // end of init(menuItems)
} // end of struct Order
