//
//  AmiiboCell.swift
//  CollectionViewAPI
//
//  Created by Sean Kang on 2020/10/29.
//

import UIKit


class AmiiboCell: UITableViewCell {
    var safeArea: UILayoutGuide!
    let imageIV = CustomImageView()
    let nameLabel = UILabel()
    let gameSeriesLabel = UILabel()
    let owningCountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        safeArea = layoutMarginsGuide
        setupOwningCountLabel()
        setupImageView()
        setupNameLabel()
        setupGameSeriesLable()
        
    }
    
    func setupOwningCountLabel() {
        addSubview(owningCountLabel)
        owningCountLabel.translatesAutoresizingMaskIntoConstraints = false
        owningCountLabel.leadingAnchor.constraint(equalTo: owningCountLabel.trailingAnchor).isActive = true
        owningCountLabel.centerYAnchor.constraint(lessThanOrEqualTo: centerYAnchor).isActive = true
        
    }
    
    func setupImageView() {
        addSubview(imageIV)
        
        imageIV.contentMode = .scaleAspectFit
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
       // imageIV.backgroundColor = .gray
        
        
    }
    func setupNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor,constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    
    func setupGameSeriesLable() {
        addSubview(gameSeriesLabel)
        
        gameSeriesLabel.translatesAutoresizingMaskIntoConstraints = false
        gameSeriesLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        gameSeriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        gameSeriesLabel.font = UIFont(name: "Verdana", size: 14)
    }
}
