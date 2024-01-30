//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by JasonOu on 2024/1/25.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
