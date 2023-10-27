//
//  CharacterCell.swift
//  Heroes
//
//  Created by Kirill Taraturin on 26.10.2023.
//

import UIKit
import SnapKit

final class CharacterCell: UICollectionViewCell {
    
    // MARK: - Static Properties
    static let reuseID = String(describing: CharacterCell.self)
    
    // MARK: - Private UI Properties
    private lazy var characterImageView: UIImageView = {
        let charView = UIImageView()
        charView.layer.cornerRadius = 10
        charView.clipsToBounds = true
        return charView
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.getFont(.metal, size: 18)
        label.textColor = .systemRed
        return label
    }()
    
    private var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - Private Properties
    private var imageURL: URL? {
        didSet {
            characterImageView.image = nil
            updateImage()
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        activityIndicator = showSpinner(in: characterImageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with character: Hero?) {
        nameLabel.text = character?.name ?? "NO DATA"
        imageURL = URL(string: character?.images.lg ?? "")
        
    }
    
    // MARK: - Network Methods
    private func updateImage() {
        guard let imageURL = imageURL else { return }
        
        getImage(from: imageURL) { result in
            switch result {
                
            case .success(let image):
                if imageURL == self.imageURL {
                    self.characterImageView.image = image
                    self.activityIndicator?.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
        if let cachedImage = ImageCacheManager.shared.object(forKey: url.lastPathComponent as NSString) {
            completion(.success(cachedImage))
        }
        
        NetworkManager().fetchImage(from: url) { result in
            switch result {
                
            case .success(let imageData):
                guard let uiImage = UIImage(data: imageData) else { return }
                ImageCacheManager.shared.setObject(uiImage, forKey: url.lastPathComponent as NSString)
                completion(.success(uiImage))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Setup UI methods
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(characterImageView.snp.bottom)
        }
        
        characterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top)
        }
    }
    
    private func setViews() {
        contentView.addSubview(characterImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.color = .systemGray
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        return activityIndicator
    }
}

