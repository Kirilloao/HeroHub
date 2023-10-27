//
//  DetailsViewController.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func setHero(_ hero: Hero?)
}

final class DetailsViewController: UITableViewController {
    
    // MARK: - Public Properties
    var presenter: DetailViewPresenterProtocol!
    
    // MARK: - Private Properties
    private var hero: Hero?
    private var powerstats: [(String, Int)] {
        return hero?.powerstats.powerStatsArray ?? []
    }
    private let testDataArray = ["int", "str", "spe", "dur", "pow", "com"]
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupTableView()
        setupNavigationBar()
        presenter.setHero()
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .black
        
        tableView.register(
            ImageCell.self,
            forCellReuseIdentifier: ImageCell.reuseID
        )
        tableView.register(
            PowerstatCell.self,
            forCellReuseIdentifier: PowerstatCell.reuseID
        )
        tableView.register(
            StatsHeader.self,
            forHeaderFooterViewReuseIdentifier: StatsHeader.reuseID
        )
        tableView.register(
            NameHeader.self,
            forHeaderFooterViewReuseIdentifier: NameHeader.reuseID
        )
    }
    
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        
        //устанавливаем цвет для navigationBar
        navBarAppearance.backgroundColor = UIColor.black
        
        // меняем цвет для текста
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font : UIFont.getFont(.nosifer, size: 24)  ?? UIFont.systemFont(ofSize: 24)
        ]
        
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemRed,
            .font : UIFont.getFont(.nosifer, size: 24)  ?? UIFont.systemFont(ofSize: 24)
        ]
        
        // меняем цвет в статичном положении и в скролинге
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        navigationController?.navigationBar.tintColor = .systemRed
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0
        ? 1
        : hero?.powerstats.powerStatsArray.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseID, for: indexPath) as? ImageCell else { return UITableViewCell() }
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            cell.configure(with: hero?.images.lg ?? "")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PowerstatCell.reuseID, for: indexPath) as? PowerstatCell else { return UITableViewCell() }
            
            let icon = testDataArray[indexPath.row]
            let one = powerstats[indexPath.row]
            
            cell.backgroundColor = .black
            cell.selectionStyle = .none
            cell.configure(with: icon, text: one)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.section == 0 ? 300 : 50

    }
    
    // MARK: - HeaderView
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 1:
            guard
                let headerView = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: StatsHeader.reuseID)
                    as? StatsHeader
            else {
                return UITableViewHeaderFooterView()
            }
            headerView.configure(with: "Powerstats")
            return headerView
        case 0:
            guard
                let headerView = tableView.dequeueReusableHeaderFooterView(
                    withIdentifier: NameHeader.reuseID)
                    as? NameHeader
            else {
                return UITableViewHeaderFooterView()
            }
            
            
            if  let name = hero?.name  {
                headerView.configure(with: name)
            } else {
                headerView.configure(with: "NO DATA")
            }
            
            return headerView
        default:
            return UITableViewHeaderFooterView()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
}

// MARK: - DetailViewProtocol
extension DetailsViewController: DetailViewProtocol {
    func setHero(_ hero: Hero?) {
        self.hero = hero
    }
}
