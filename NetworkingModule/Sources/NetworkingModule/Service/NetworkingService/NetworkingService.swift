//
//  NetworkingService.swift
//  
//
//  Created by Nikola Savic on 2.8.24..
//

import Foundation
import Combine

public class NetworkingService {
    public static let shared = NetworkingService(baseURL: APIConstants.baseURL)

    private let logger = ConsoleLogger()

    let baseURL: String

    private init(baseURL: String) {
        self.baseURL = baseURL
    }

    public func send<T: Decodable>(_ request: URLRequest) async throws -> T {
        logger.log(request: request)
        let (data, response) = try await URLSession.shared.data(for: request)
        logger.log(response: response, data: data)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 else {
            throw APIError.notFound
        }

        if !data.isEmpty {
            return try await requestDecoder(data: data)
        } else {
            if data.isEmpty, let response = EmptyDTO() as? T {
                return response
            } else {
                throw APIError.notFound
            }
        }
    }
}

extension NetworkingService {
    func requestDecoder<T: Decodable> (data: Data) async throws -> T {
        let decoder = JSONDecoder()
        do {
            let decodedValue = try decoder.decode(T.self, from: data)
            return decodedValue
        }
        catch let error {
            throw APIError.decoding(error: error)
        }
    }
}
