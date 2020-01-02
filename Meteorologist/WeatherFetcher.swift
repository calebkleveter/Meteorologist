//
//  WeatherUpdater.swift
//  Meteorologist
//
//  Created by Caleb Kleveter on 1/1/20.
//  Copyright © 2020 Caleb Kleveter. All rights reserved.
//

import AsyncHTTPClient
import CoreLocation
import Foundation
import NIOHTTP1
import Combine

final class WeatherFetcher {
    private var subscribers: [AnySubscriber<Output, Failure>]
    private var location: CLLocation

    private let decoder: JSONDecoder
    private let client: HTTPClient

    init() {
        self.subscribers = []
        self.location = CLLocation(latitude: 37.33182, longitude: -122.03118)

        self.decoder = JSONDecoder()
        self.client = HTTPClient(eventLoopGroupProvider: .createNew)
    }

    func run() {
        let url = URL.construct(from: self.location)
        self.client.get(url: url).flatMapThrowing { response throws -> Weather in
            guard (200...299).contains(response.status.code) else {
                throw APIError.badStatus(response.status)
            }

            guard let buffer = response.body else {
                throw APIError.emptyResponse
            }

            return try self.decoder.decode(Weather.self, from: buffer)
        }.whenComplete { result in
            self.subscribers.forEach { subscriber in
                
            }
        }
    }
}

extension WeatherFetcher {
    enum APIError: Error {
        case badStatus(HTTPResponseStatus)
        case emptyResponse
    }
}

extension WeatherFetcher: Publisher {
    typealias Output = Weather
    typealias Failure = Error

    func receive<S>(subscriber: S) where S : Subscriber, S.Failure == Failure, S.Input == Output {
        self.subscribers.append(.init(subscriber))
    }
}

extension WeatherFetcher: LocationManagerDelegate {
    func locationDidUpdate(with location: CLLocation) {
        self.location = location
    }
}
