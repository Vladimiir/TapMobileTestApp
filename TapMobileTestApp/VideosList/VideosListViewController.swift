//
//  VideosListViewController.swift
//  TapMobileTestApp
//
//  Created by Стасенко Владимир on 01.04.2022.
//

import UIKit
import AVKit
import WebKit

class VideosListViewController: UIViewController {
    
    private enum Constants {
        static let cellIdentifier = "VideoCell"
    }
    
    private var videos: [URL] = []
    
    private var collectionViewLayout: UICollectionViewFlowLayout = {
        let l = UICollectionViewFlowLayout()
        l.itemSize = .init(width: UIScreen.main.bounds.width - 40, height: 150)
        l.scrollDirection = .vertical
        l.minimumLineSpacing = 10
        return l
    }()
    
    // Subviews
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
//        cv.contentInset = .init(top: 40, left: 0, bottom: 40, right: 0)
        cv.backgroundColor = .clear
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.youtube.com/embed/_Kqtj14rxes")!
        videos.append(url)
        collectionView.reloadData()
        
        setupUI()
        setupLayout()
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        
        view.backgroundColor = .white
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func playVideo(with url: URL) {
        let wv = WKWebView(frame: .zero)
        wv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wv)
        wv.load(URLRequest(url: url))
        
        NSLayoutConstraint.activate([
            wv.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wv.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            wv.widthAnchor.constraint(equalToConstant: 400),
            wv.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension VideosListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let video = videos[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                      for: indexPath) as! VideoCell
        
        cell.titleLabel.text = video.absoluteString
        
        return cell
    }
}

extension VideosListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let video = videos[indexPath.row]
        playVideo(with: video)
    }
}
