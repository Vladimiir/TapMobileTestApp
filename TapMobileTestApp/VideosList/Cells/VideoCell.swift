//
//  VideoCell.swift
//  TapMobileTestApp
//
//  Created by Стасенко Владимир on 01.04.2022.
//

import UIKit
import WebKit

final class VideoCell: UICollectionViewCell {
    
    // MARK: - Private var
    
    // Subviews
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        l.textColor = .black
        l.textAlignment = .center
        return l
    }()
    
    lazy var wv: WKWebView = {
        var wv = WKWebView(frame: .zero)
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()
    
    // MARK: - Public var
    
    var url: URL? = nil {
        didSet {
            wv.load(URLRequest(url: url!))
        }
    }
    
    // MARK: - Public func
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(wv)
        
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            wv.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            wv.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            wv.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            wv.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
