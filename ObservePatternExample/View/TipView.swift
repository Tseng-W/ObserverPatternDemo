//
//  TipView.swift
//

import UIKit

class TipView: UIView {
    private let searchTextLabel: UILabel = .init()

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TipView: Subscribable {
    func update(_ value: String) {
        searchTextLabel.text = value.isEmpty ? "" : "Searching with \(value)"
    }
}

// MARK: Private functions .
extension TipView {
    private func setupUI() {
        backgroundColor = .systemGray6

        searchTextLabel.textColor = .systemGray

        addSubview(searchTextLabel)

        searchTextLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        searchTextLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        searchTextLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            searchTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
