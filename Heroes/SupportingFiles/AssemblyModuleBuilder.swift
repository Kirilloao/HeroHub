//
//  ModuleBuilder.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

// MARK: - Builder
protocol AssemblyBuilderProtocol {
    func createCharacterListModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(hero: Hero?, router: RouterProtocol) -> UIViewController
}

// MARK: - ModelBuilder
class AssemblyModelBuilder: AssemblyBuilderProtocol {
    func createCharacterListModule(router: RouterProtocol) -> UIViewController {
        let view = CharacterListViewController()
        let networkService = NetworkManager()
        let presenter = CharacterListPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(hero: Hero?, router: RouterProtocol) -> UIViewController {
        let view = DetailsViewController()
        let networkService = NetworkManager()
        let presenter = DetailPresenter(view: view, networkService: networkService, router: router,  hero: hero)
        view.presenter = presenter
        return view
    }
    

}
