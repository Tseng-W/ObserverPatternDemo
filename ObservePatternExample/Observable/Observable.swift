//
//  Publisher.swift
//

import Foundation

protocol Publisher {
    func notify(value: String)
    func subscribe(subscriber: Subscribable)
    func unSubscribe(subscriber: Subscribable)
}

protocol Subscribable {
    var identifier: UUID { get }
    func update(_ value: String)
}

extension Subscribable {
    var identifier: UUID { .init() }
}
