//
//  DetailsPresenter.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import Foundation

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol,router: RouterProtocol, hero: Hero?)
    func setHero()
//    func tap()
}

class DetailPresenter: DetailViewPresenterProtocol {

    // MARK: - Private Properties
    private unowned var view: DetailViewProtocol?
    private let networkService: NetworkServiceProtocol!
    private var hero: Hero?
    var router: RouterProtocol?
    
    // MARK: - init
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, hero: Hero?) {
        self.view = view
        self.networkService = networkService
        self.hero = hero
        self.router = router
    }
    
    // MARK: - Public Methods
//    func tap() {
//        router?.popToRoot()
//    }
    
    func setHero() {
        self.view?.setHero(hero)
    }
}
