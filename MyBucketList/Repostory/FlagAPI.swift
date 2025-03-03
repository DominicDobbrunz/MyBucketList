//
//  FlagAPI.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 28.02.25.
//

import Foundation

class FlagAPI {
    private let baseURL = "http://api.ipstack.com/"
    private let accessKey = "edad495f486726dc818e231108037cbf"
    
    func fetchFlag(for ip: String) async throws -> FlagResponse {
        let urlString = "\(baseURL)\(ip)?access_key=\(accessKey)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(FlagResponse.self, from: data)
    }
}
