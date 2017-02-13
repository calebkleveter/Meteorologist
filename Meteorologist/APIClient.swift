//
//  APIClient.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 2/13/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation

public let CKNetworkingErrorDomain = "com.caleb-kleveter.Meteorologist.NetworkingError"
public let MissingHTTPResponseError: Int = 0

typealias JSON = [String: AnyObject?]
typealias FetchCompletion = (JSON?, HTTPURLResponse?, DataTaskError?) -> Void

enum DataTaskError: Error {
    case badStatusCode(Int)
    case cannotCastToHTTPURLResponse(NSError)
    case dataTaskError(Error)
    case noData
    case jsonSerializationError(Error)
    case noJson
}

protocol JSONInitable {
    init(json: JSON)
}
