//
//  RouterProtocol.swift
//  Heroes
//
//  Created by Kirill Taraturin on 27.10.2023.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(hero: Hero?)
//    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainVC = assemblyBuilder?.createCharacterListModule(router: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }
    
    func showDetail(hero: Hero?) {
        if let navigationController = navigationController {
            guard let detailVC = assemblyBuilder?.createDetailModule(hero: hero, router: self) else { return }
            navigationController.pushViewController(detailVC, animated: true)
        }
    }
    
//    func popToRoot() {
//        if let navigationController = navigationController {
//            navigationController.popToRootViewController(animated: true)
//        }
//    }
}
