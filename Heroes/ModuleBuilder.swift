//
//  ModuleBuilder.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

// MARK: - Builder
protocol Builder {
    static func createCharacterListModule() -> UIViewController
}

// MARK: - ModelBuilder
class ModelBuilder: Builder {
    static func createCharacterListModule() -> UIViewController {
        let view = CharacterListViewController()
        let networkService = NetworkManager()
        let presenter = CharacterListPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
