//
//  MainViewController.swift
//

import UIKit

class MainViewController: UIViewController {
    private var searchBar: SearchBarView = .init()
    private var listView: ListView = .init()
    private var tipView: TipView = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        bindView()
    }
}

extension MainViewController {
    private func setupUI() {
        view.backgroundColor = .white

        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 60)
        ])

        tipView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tipView)
        NSLayoutConstraint.activate([
            tipView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tipView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tipView.topAnchor.constraint(equalTo: searchBar.bottomAnchor)
        ])

        listView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listView)
        NSLayoutConstraint.activate([
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.topAnchor.constraint(equalTo: tipView.bottomAnchor),
            listView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func bindView() {
        searchBar.delegate = self
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tipView.updateSearchText(text: searchText)
        listView.filterWith(text: searchText)
    }
}
