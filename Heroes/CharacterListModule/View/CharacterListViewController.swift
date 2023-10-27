//
//  ViewController.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

// MARK: - CharacterListProtocol
protocol CharacterListProtocol: AnyObject {
    func success()
    func failure(error: NetworkError)
}


class CharacterListViewController: UICollectionViewController {
    
    // MARK: - Presenter
    var presenter: CharacterListPresenter?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        registerCell()
        setupLayout()
        presenter?.getCharacters()
        setupNavigationBar()
    }
    
    // MARK: - Init
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupLayout() {
        let layout = UICollectionViewFlowLayout()
        
        let padding: CGFloat = 30 // Отступы слева и справа
        let spacing: CGFloat = 30 // Расстояние между ячейками
        
        let availableWidth = view.bounds.width - padding * 2 - spacing
        let itemWidth = availableWidth / 2
        
        
        layout.itemSize = CGSize(width: itemWidth, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 10, left: padding, bottom: 10, right: padding)
        
        layout.minimumLineSpacing = 10 // минимальное расстояние между строками
        layout.minimumInteritemSpacing = 15 // минимальное расстояние между элементами в строке
        collectionView.collectionViewLayout = layout
    }
    
    private func registerCell() {
        collectionView.register(
            CharacterCell.self,
            forCellWithReuseIdentifier: CharacterCell.reuseID
        )
    }
    
    private func setupNavigationBar() {
        title = "Heroes"

        let navBarAppearance = UINavigationBarAppearance()
        
        //устанавливаем цвет для navigationBar
        navBarAppearance.backgroundColor = UIColor.black
        
        // меняем цвет для текста
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font : UIFont.getFont(.nosifer, size: 24)  ?? UIFont.systemFont(ofSize: 24)
        ]
        
        // меняем цвет в статичном положении и в скролинге
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.heroes?.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CharacterCell.reuseID, for: indexPath) as? CharacterCell
        else {
            return UICollectionViewCell()
        }
        
        let character = presenter?.heroes?[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hero = presenter?.heroes?[indexPath.row]
        let detailVC = ModelBuilder.createDetailModule(hero: hero)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - CharacterListProtocol
extension CharacterListViewController: CharacterListProtocol {
    func success() {
        collectionView.reloadData()
    }
    
    func failure(error: NetworkError) {
        print(error)
    }
}
