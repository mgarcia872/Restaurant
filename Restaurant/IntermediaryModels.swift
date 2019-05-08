//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by student17 on 4/23/19.
//  Copyright © 2019 student17. All rights reserved.
//

import Foundation

struct Categories : Codable
{
    let categories : [String]
} // end of struct Categories

struct PreparationTime : Codable
{
    let prepTime : Int
    
    enum CodingKeys : String, CodingKey
    {
        case prepTime = "preparation_time"
    }
} // end of struct PreparationTime
