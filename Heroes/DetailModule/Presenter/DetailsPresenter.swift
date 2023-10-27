//
//  DetailsPresenter.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import Foundation

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, hero: Hero?)
    func setHero()
}

class DetailPresenter: DetailViewPresenterProtocol {
    // MARK: - Private Properties
    private unowned var view: DetailViewProtocol?
    private let networkService: NetworkServiceProtocol!
    private var hero: Hero?
    
    // MARK: - init
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, hero: Hero?) {
        self.view = view
        self.networkService = networkService
        self.hero = hero
    }
    
    // MARK: - Public Methods
    func setHero() {
        self.view?.setHero(hero)
    }
}
