//
//  ImgurService.swift
//  MyBucketList
//
//  Created by Dominic Dobbrunz on 10.03.25.
//
import UIKit

struct ImgurService {
    private static let clientID = "8b076d06b1a0487"
    
    static func uploadImage(_ image: UIImage) async throws -> String {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            throw UploadError.invalidImageData
        }
        
        let base64Image = imageData.base64EncodedString()
        guard let url = URL(string: "https://api.imgur.com/3/image") else {
            throw UploadError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Client-ID \(clientID)", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let body = "image=\(base64Image.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? "")"
        request.httpBody = body.data(using: .utf8)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw UploadError.serverError
        }
        
        let result = try JSONDecoder().decode(ImgurResponse.self, from: data)
        guard let url = result.data.link else {
            throw UploadError.invalidResponse
        }
        
        return url
    }
    
    enum UploadError: Error {
        case invalidImageData
        case invalidURL
        case serverError
        case invalidResponse
    }
    
    struct ImgurResponse: Codable {
        let data: ImageData
        struct ImageData: Codable {
            let link: String?
        }
    }
}
