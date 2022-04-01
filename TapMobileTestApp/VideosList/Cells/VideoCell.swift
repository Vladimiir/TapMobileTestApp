//
//  VideoCell.swift
//  TapMobileTestApp
//
//  Created by Стасенко Владимир on 01.04.2022.
//

import UIKit

final class VideoCell: UICollectionViewCell {
    
    // MARK: - Public var
    
    // Subviews
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        l.textColor = .black
        l.textAlignment = .center
        return l
    }()
    
    // MARK: - Public func
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(titleLabel)
        
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
