//
//  MenuController.swift
//  Restaurant
//
//  Created by student17 on 4/23/19.
//  Copyright © 2019 student17. All rights reserved.
//

import Foundation

class MenuController
{
    let baseURL = URL(string: "http://localhost:8090/")!
    
    func fetchCategories(completion: @escaping ([String]?) -> Void)
    {
        let categoryURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryURL)
        { (data, response, error) in
            if let data = data,
            let jsonDictionary = try?
                JSONSerialization.jsonObject(with: data) as?
                [String: Any],
                let categories = jsonDictionary["categories"] as? // book had originially a question mark after jsonDictionary but it's failing to compile
                [String] {
                completion(categories)
            } else {
                completion(nil)
            } // end of if-else
        } // end of dataTask completionHandler closure
        task.resume()
    } // end of fetchCategories (GET request)
    
    func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?) -> Void)
    {
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        let task = URLSession.shared.dataTask(with: menuURL)
        { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
            let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data)
            {
                completion(menuItems.items)
            } else {
                completion(nil)
            }// end of if-else
        } // end of dataTask completionHandler closure
        task.resume()
    } // end of fetchMenuItems (GET request)
    
    func submitOrder(forMenuIDs menuIDs: [Int], completion: @escaping (Int?) -> Void)
    {
        let orderURL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data: [String: [Int]] = ["menuIDs": menuIDs]
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request)
        { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
            let preparationTime = try?
                jsonDecoder.decode(PreparationTime.self, from: data){
                completion(preparationTime.prepTime)
            } else {
                completion(nil)
            } // end of if-else
        } // end of dataTask completionHandler closure
        task.resume()
    } // end of submitOrder
    
    
}
