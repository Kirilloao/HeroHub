//
//  ImageCell.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit

final class ImageCell: UITableViewCell {
    
    // MARK: - Static Properties
    static let reuseID = String(describing: ImageCell.self)
    
    // MARK: - Private UI Properties
    private lazy var mainImageView: UIImageView = {
        var mainImageView = UIImageView()
        mainImageView.backgroundColor = .yellow
        mainImageView.layer.cornerRadius = 10
        mainImageView.clipsToBounds = true
        
        return mainImageView
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
    func configure(with image: String) {
        guard let url = URL(string: image) else { return }
        NetworkManager().fetchImage(from: url) { result in
            switch result {
            case .success(let data):
                self.mainImageView.image = UIImage(data: data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Private Methods
    private func setViews() {
        addSubview(mainImageView)
    }
    
    private func setupConstraints() {
        mainImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(100)
            make.right.equalToSuperview().offset(-100)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
