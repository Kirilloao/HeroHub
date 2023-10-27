//
//  DetailsViewController.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

final class DetailsViewController: UITableViewController {
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupNavigationBar()
    }
    
    // MARK: - Private Methods
    private func registerCells() {
        tableView.register(
            ImageCell.self,
            forCellReuseIdentifier: ImageCell.reuseID
        )
        tableView.register(
            DetailsHeader.self,
            forHeaderFooterViewReuseIdentifier: DetailsHeader.reuseID
        )
    }
    
    private func setupNavigationBar() {
        
        title = "Current Hero"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseID, for: indexPath) as? ImageCell else { return UITableViewCell() }
            return cell
        }
        
        return UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220
        } else {
            return 20
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
