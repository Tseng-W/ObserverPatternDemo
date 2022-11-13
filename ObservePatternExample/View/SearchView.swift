//
//  SearchView.swift
//

import UIKit

class SearchBarView: UISearchBar {

    init() {
        super.init(frame: .zero)
        delegate = self

        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchBarView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Text: ", searchText)
    }
}

extension SearchBarView {
    private func setupUI() {
//        backgroundImage = .init()
    }
}
