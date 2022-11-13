//
//  ListView.swift
//

import UIKit

class ListView: UICollectionView {
    enum Section {
        case main
    }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, String>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Section, String>

    private var diffableDataSource: DataSource?
    private let data: [String] = [
        "Apple",
        "Banana",
        "Cat",
        "Dog",
        "Elephant",
        "Farm",
        "Garden",
        "Home",
        "Island",
        "Jess"
    ]

    init() {
        let layout = UICollectionViewCompositionalLayout.list(
            using: .init(appearance: .grouped)
        )
        super.init(frame: .zero, collectionViewLayout: layout)

        delegate = self
        configureDataSource()
        applySnapShot(data: data)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListView {
    private func configureDataSource() {
        let cellConfiguration = CellRegistration<UICollectionViewListCell, String> { cell, indexPath, itemIdentifier in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = itemIdentifier
            cell.contentConfiguration = configuration
        }

        diffableDataSource = .init(collectionView: self, cellProvider: { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellConfiguration, for: indexPath, item: itemIdentifier)
        })
    }

    private func applySnapShot(data: [String]) {
        var snapShot: SnapShot = .init()
        snapShot.appendSections([.main])
        snapShot.appendItems(data)

        diffableDataSource?.apply(snapShot)
    }
}

// MARK: UICollectionViewDelegate
extension ListView: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        shouldSelectItemAt indexPath: IndexPath
    ) -> Bool {
        false
    }
}
