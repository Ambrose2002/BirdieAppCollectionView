//
//  BirdCollectionViewCell.swift
//  lec5
//
//  Created by Vin Bui on 6/10/23.
//

import UIKit

// NOTE: `UICollectionViewCell` instead of `UITableViewCell`
class BirdCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    
    private let birdImage = UIImageView()
    private let birdNameLabel = UILabel()
    private let starIcon = UIImageView()
    
    static let reuse = "BirdCollectionViewCellReuse"
    
    // MARK: - init
    
    // NOTE: Compare init with a `UITableViewCell`
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBirdImage()
        setupNameLabel()
        setupStarIcon()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    
    func configure(bird: Bird) {
        // Don't make private!
        birdImage.image = UIImage(named: bird.image)
        birdNameLabel.text = bird.name
    }
    
    // MARK: - Set Up Views
    
    private func setupBirdImage() {
        birdImage.contentMode = .scaleAspectFit
        
        // NOTE: we are using `contentView` here
        contentView.addSubview(birdImage)
        birdImage.translatesAutoresizingMaskIntoConstraints = false
                        
        // NOTE: we do not need to use `safeAreaLayoutGuide`
        NSLayoutConstraint.activate([
            birdImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            birdImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            birdImage.heightAnchor.constraint(equalToConstant: 128),
            birdImage.widthAnchor.constraint(equalToConstant: 128)
        ])
    }
    
    private func setupNameLabel() {
        birdNameLabel.textColor = .label
        birdNameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        
        contentView.addSubview(birdNameLabel)
        birdNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            birdNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            birdNameLabel.topAnchor.constraint(equalTo: birdImage.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupStarIcon() {
        contentView.addSubview(starIcon)
        starIcon.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            starIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            starIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            starIcon.widthAnchor.constraint(equalToConstant: 24),
            starIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
}
