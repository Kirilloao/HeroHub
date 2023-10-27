//
//  SceneDelegate.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
//        let mainVC = AssemblyModelBuilder().createCharacterListModule()
//        window?.rootViewController = UINavigationController(rootViewController: mainVC)
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyModelBuilder()
        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        router.initialViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

