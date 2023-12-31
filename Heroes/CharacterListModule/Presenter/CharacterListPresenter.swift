//
//  CharacterListPresenter.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import Foundation

protocol CharacterListPresenterProtcol: AnyObject {
    init(view: CharacterListProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getCharacters()
    var heroes: [Hero]? { get set }
    func tapOnTheHero(hero: Hero?)
}

class CharacterListPresenter: CharacterListPresenterProtcol {

    // MARK: - Private Properties
    private unowned var view: CharacterListProtocol?
    private let networkService: NetworkServiceProtocol!
    var router: RouterProtocol?
    // MARK: - Public Properties
    var heroes: [Hero]?
    
    // MARK: - init
    required init(view: CharacterListProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getCharacters()
    }
    
    // MARK: - Public Methods
    func tapOnTheHero(hero: Hero?) {
        router?.showDetail(hero: hero)
    }
    
    func getCharacters() {
        networkService.fetchCharacters(with: Links.api.rawValue) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                    
                case .success(let heroes):
                    self.heroes = heroes
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
