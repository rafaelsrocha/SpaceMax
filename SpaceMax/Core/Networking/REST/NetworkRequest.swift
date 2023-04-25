//
//  NetworkRequest.swift
//  SpaceMax
//
//  Created by Rafael Rocha on 25.04.23.
//

import Foundation

protocol NetworkResource {
    associatedtype Model: Decodable
    var url: URL { get }
}

protocol NetworkRequestProtocol {
    func fetch<T>(resource: T) async throws -> T.Model? where T: NetworkResource, T.Model: Decodable
}

struct NetworkRequest: NetworkRequestProtocol {
    static let `default`: NetworkRequest = NetworkRequest()

    private init() {}

    /// Performs a REST call based on a NetworkResource and decodes the request's response data into this NetworkResource's associated model.
    ///
    /// For example:
    ///
    ///     let resource: WeatherResource = WeatherResource(latitude: 28.49834, longitude: -80.57366)
    ///     return try await NetworkRequest.default.fetch(resource: resource)
    ///
    /// - Parameters:
    ///   - resource: The resource object implementing the NetworkResource protocol.
    ///
    /// - Returns: The NetworkResource's associated decoded model.
    func fetch<T>(resource: T) async throws -> T.Model? where T: NetworkResource, T.Model: Decodable {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<T.Model, Error>) -> Void in
            let task = URLSession.shared.dataTask(with: resource.url) { data, response, error -> Void in
                // Handle error
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }

                // Handle status code
                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    let dataError: NSError = NSError(
                        domain: "NetworkRequest#load: Expected (200 ..< 300), got \(httpResponse.statusCode)",
                        code: httpResponse.statusCode
                    )
                    continuation.resume(throwing: dataError)
                    return
                }

                // Check data integrity
                guard let data = data else {
                    let dataError: NSError = NSError(
                        domain: "NetworkRequest#load: Something went wrong with data on dataTask",
                        code: -1
                    )
                    continuation.resume(throwing: dataError)
                    return
                }

                // Safely decode the data
                guard let decoded = try? JSONDecoder().decode(T.Model.self, from: data) else {
                    let decodeError: NSError = NSError(
                        domain: "NetworkRequest#load: Something went wrong while decoding the data on dataTask",
                        code: -1,
                        userInfo: ["data": data]
                    )
                    continuation.resume(throwing: decodeError)
                    return
                }

                continuation.resume(returning: decoded)
            }
            task.resume()
        }
    }
}
