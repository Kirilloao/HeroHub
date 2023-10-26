//
//  DetailsPresenter.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func setHero(_ hero: Hero?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, hero: Hero?)
    func setHero()
}

class DetailPresenter: DetailViewPresenterProtocol {
    private unowned var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var hero: Hero?
    
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, hero: Hero?) {
        self.view = view
        self.networkService = networkService
        self.hero = hero
    }
    
    func setHero() {
        self.view?.setHero(hero)
    }

}
