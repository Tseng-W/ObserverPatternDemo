//
//  MainViewController.swift
//

import UIKit

class MainViewController: UIViewController {
    private var searchBar: SearchBarView = .init()
    private var dataList: ListView = .init()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
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

        dataList.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dataList)
        NSLayoutConstraint.activate([
            dataList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dataList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dataList.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            dataList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
