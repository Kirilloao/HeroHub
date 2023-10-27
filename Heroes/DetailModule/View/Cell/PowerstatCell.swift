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
//    private lazy var mainView: UIView = {
//        var view = UIView()
//
//        view.backgroundColor = .black
//
//        return view
//    }()
    
    private lazy var intelligenceView: UIView = {
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
        var statLabel = UILabel()
        statLabel.textColor = .white
        statLabel.font = UIFont.getFont(.metal, size: 20)
        return statLabel
    }()

    private lazy var statValueLabel: UILabel = {
        var statValueLabel = UILabel()
        statValueLabel.textColor = .systemRed
        statValueLabel.font = UIFont.getFont(.metal, size: 20)
        statValueLabel.text = "59"
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
    func configure(with icon: String, text: String, value: String) {
        if let image = UIImage(named: icon) {
            iconImageView.image = image.withRenderingMode(.alwaysTemplate)
        }
        statLabel.text = text
        statValueLabel.text = value
    }
    
    
    // MARK: - Private Methods
    private func setViews() {
        addSubview(intelligenceView)
        intelligenceView.addSubview(iconImageView)
        addSubview(statLabel)

        addSubview(statValueLabel)

    }
    
    private func setupConstraints() {
        intelligenceView.snp.makeConstraints { make in
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
            make.centerY.equalTo(intelligenceView.snp.centerY)
            make.left.equalTo(intelligenceView.snp.right).offset(20)
        }
        
        statValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(statLabel.snp.centerY)
            make.right.equalToSuperview().offset(-20)
        }

    }
}
