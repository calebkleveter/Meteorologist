//
//  APIClient.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 2/13/17.
//  Copyright © 2017 Caleb Kleveter. All rights reserved.
//

import Foundation

let baseURL = "https://api.darksky.net/forecast/"
var latitude = 0.0
var longtitude = 0.0

public let CKNetworkingErrorDomain = "com.caleb-kleveter.Meteorologist.NetworkingError"
public let MissingHTTPResponseError: Int = 0

typealias JSON = [String: AnyObject]
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

protocol APIClient {
    var configuration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func dataTask(with request: URLRequest, endingWith completion: @escaping FetchCompletion) -> URLSessionDataTask
}

extension APIClient {
    func dataTask(with request: URLRequest, endingWith completion: @escaping FetchCompletion) -> URLSessionDataTask {
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let resp = response as? HTTPURLResponse else {
                let userInfo = [
                    NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")
                ]
                
                let error = NSError(domain: CKNetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                completion(nil, nil, DataTaskError.cannotCastToHTTPURLResponse(error))
                return
            }
            
            if resp.statusCode >= 200 && resp.statusCode < 300 {
                if error == nil {
                    if data != nil {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? JSON
                            if let json = json {
                                completion(json, resp, nil)
                            } else {
                                completion(nil, nil, .noJson)
                                return
                            }
                        } catch let error {
                            completion(nil, nil, .jsonSerializationError(error))
                            return
                        }
                        return
                    } else {
                        completion(nil, nil, .noData)
                        return
                    }
                } else {
                    completion(nil, nil, .dataTaskError(error!))
                    return
                }
            } else {
                completion(nil, nil, .badStatusCode(resp.statusCode))
                return
            }
        }
        return task
    }
}
