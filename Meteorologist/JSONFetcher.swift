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
    
    init() {
        self.configuration = URLSessionConfiguration.default
    }
}
