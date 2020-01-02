//
//  JSONFetcher.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 3/2/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation

struct JSONFetcher: APIClient {

    var configuration: URLSessionConfiguration
    var session: URLSession
    
    init() {
        self.configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: self.configuration)
    }
    
    func getJSON(from urlString: String, with completion: @escaping (CurrentWeather, [DailyWeather]) -> ()) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            dataTask(with: request, endingWith: { (json, response, error) in
//                guard let json = json else {
//                    print("Data Task Error: ", error ?? "No error")
//                    return
//                }
//                let currentWeather = CurrentWeather(json: json)
//                let dailyData = ((json["daily"] as? JSON)?["data"] as? [JSON])
//                if let dailyWeather = dailyData?.map({ return DailyWeather(json: $0) }) {
//                    completion(currentWeather, dailyWeather)
//                }
                
            }).resume()
        }
    }
}
