//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by JasonOu on 2024/1/25.
//

import Foundation

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedImage])
    case failure(Error)
}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
