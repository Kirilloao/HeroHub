//
//  DetailsViewController.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

final class DetailsViewController: UITableViewController {
    
    let testDataArray = ["int", "str", "spe", "dur", "pow", "com"]
    let testArray = ["intelligence", "strength", "speed", "durability", "power", "combat"]
    let testInt = ["58", "100", "84", "44","90","77"]
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupNavigationBar()
        view.backgroundColor = .black
    }
    
    
    
    // MARK: - Private Methods
    private func registerCells() {
        tableView.register(
            ImageCell.self,
            forCellReuseIdentifier: ImageCell.reuseID
        )
        tableView.register(
            PowerstatCell.self,
            forCellReuseIdentifier: PowerstatCell.reuseID
        )
        tableView.register(
            DetailsHeader.self,
            forHeaderFooterViewReuseIdentifier: DetailsHeader.reuseID
        )
    }
    
    private func setupNavigationBar() {
        
        title = "Current Hero"
        navigationController?.navigationBar.prefersLargeTitles = true



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
            
        
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return testDataArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseID, for: indexPath) as? ImageCell else { return UITableViewCell() }
            cell.backgroundColor = .black
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PowerstatCell.reuseID, for: indexPath) as? PowerstatCell else { return UITableViewCell() }
            
            let icon = testDataArray[indexPath.row]
            let text = testArray[indexPath.row]
            let int = testInt[indexPath.row]
            cell.backgroundColor = .black
            cell.configure(with: icon, text: text, value: int)
            return cell
        default:
            return UITableViewCell()
        }
        
//        if indexPath.section == 0 {
//
//        } else if indexPath.section == 1 {
//
//        }
//
//        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220
        } else {
            return 50
            
        }
    }
    
    // MARK: - HeaderView
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let headerView = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: DetailsHeader.reuseID)
                as? DetailsHeader
        else {
            return UITableViewHeaderFooterView()
        }
        
        if section == 1 {
            headerView.configure(with: "Powerstats")
        }
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 30
        default:
            return 0
        }
    }
    
}
