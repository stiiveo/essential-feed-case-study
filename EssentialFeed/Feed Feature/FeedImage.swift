//
//  FeedImage.swift
//  EssentialFeed
//
//  Created by JasonOu on 2024/1/25.
//

import Foundation

public struct FeedImage: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let url: URL
}
