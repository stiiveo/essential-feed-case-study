//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by JasonOu on 2024/1/30.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
