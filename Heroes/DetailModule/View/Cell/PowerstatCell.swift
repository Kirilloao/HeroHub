//
//  PowerstatCell.swift
//  Heroes
//
//  Created by Kirill Taraturin on 27.10.2023.
//

import UIKit

final class PowerstatCell: UITableViewCell {
    // MARK: - Statis Properties
    static var reuseID = String(describing: PowerstatCell.self)
    
    // MARK: - Private UI Properties
    private lazy var iconView: UIView = {
        var intView = UIView()
        intView.layer.cornerRadius = 5
        intView.layer.borderColor = UIColor.systemRed.cgColor
        intView.layer.borderWidth = 1
        return intView
    }()
    
    private lazy var iconImageView: UIImageView = {
        var icon = UIImageView()
        icon.tintColor = .white
        return icon
    }()
    
    private lazy var statLabel: UILabel = {
        var statLabel = createLabel(with: .white)
        return statLabel
    }()
    
    private lazy var statValueLabel: UILabel = {
        var statValueLabel = createLabel(with: .systemRed)
        return statValueLabel
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with icon: String, text: (String, Int)) {
        if let image = UIImage(named: icon) {
            iconImageView.image = image.withRenderingMode(.alwaysTemplate)
        }
        statLabel.text = text.0
        statValueLabel.text = text.1.formatted()
    }
    
    // MARK: - Private Methods
    private func setViews() {
        addSubview(iconView)
        iconView.addSubview(iconImageView)
        addSubview(statLabel)
        addSubview(statValueLabel)
    }
    
    private func setupConstraints() {
        iconView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(30)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.right.equalToSuperview().offset(-5)
        }
        
        statLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconView.snp.centerY)
            make.left.equalTo(iconView.snp.right).offset(20)
        }
        
        statValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(statLabel.snp.centerY)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    private func createLabel(with color: UIColor) -> UILabel{
        let customLabel = UILabel()
        customLabel.textColor = .systemRed
        customLabel.font = UIFont.getFont(.metal, size: 20)
        return customLabel
    }
}
