//
//  DetailsHeader.swift
//  Heroes
//
//  Created by Kirill Taraturin on 27.10.2023.
//

import UIKit

final class DetailsHeader: UITableViewHeaderFooterView {
    
    // MARK: - Static Properties
    static let reuseID = String(describing: DetailsHeader.self)
    
    // MARK: - Private UI Properties
    private lazy var titleLabel: UILabel = {
        var title = UILabel()
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textColor = .systemRed
        title.font = UIFont.getFont(.metal, size: 24)
        return title
    }()
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    // MARK: - Private Methods
    private func setViews() {
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
    }
    
}
