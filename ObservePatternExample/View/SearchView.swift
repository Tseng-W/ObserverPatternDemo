//
//  SearchView.swift
//

import UIKit

class SearchBarView: UISearchBar {
    private var subscribers: [Subscribable] = []

    init() {
        super.init(frame: .zero)
        delegate = self
        searchTextField.autocapitalizationType = .none
        searchTextField.autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchBarView: Publisher {
    func notify(value: String) {
        subscribers.forEach({ $0.update(value) })
    }

    func subscribe(subscriber: Subscribable) {
        guard subscribers.contains(where: { $0.identifier == subscriber.identifier }) == false else { return }
        subscribers.append(subscriber)
    }

    func unSubscribe(subscriber: Subscribable) {
        subscribers.removeAll(where: { $0.identifier == subscriber.identifier })
    }
}

extension SearchBarView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        notify(value: searchText)
    }
}
