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
}
