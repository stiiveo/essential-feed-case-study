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
        
        var feed: [FeedImage] {
            items.map { $0.feedImage }
        }
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
    
    static func map(_ data: Data, from response: HTTPURLResponse) -> LoadFeedResult {
        guard
            response.statusCode == OK_200,
            let root = try? JSONDecoder().decode(Root.self, from: data)
        else {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }
        
        return .success(root.feed)
    }
}
