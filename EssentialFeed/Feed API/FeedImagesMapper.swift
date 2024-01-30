//
//  FeedImagesMapper.swift
//  EssentialFeed
//
//  Created by JasonOu on 2024/1/30.
//

import Foundation

final class FeedImagesMapper {
    private init() {}
    
    private struct Root: Decodable {
        let items: [Item]
    }
    
    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var feedImage: FeedImage {
            FeedImage(
                id: id,
                description: description,
                location: location,
                url: image)
        }
    }
    
    private static var OK_200: Int { 200 }
    
    static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [FeedImage] {
        guard response.statusCode == OK_200 else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        let root = try JSONDecoder().decode(Root.self, from: data)
        return root.items.map { $0.feedImage }
    }
}
