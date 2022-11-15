//
//  SearchView.swift
//

import UIKit

class SearchBarView: UISearchBar {

    init() {
        super.init(frame: .zero)
        searchTextField.autocapitalizationType = .none
        searchTextField.autocorrectionType = .no
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
