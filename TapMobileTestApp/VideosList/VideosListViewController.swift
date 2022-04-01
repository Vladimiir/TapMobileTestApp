//
//  VideosListViewController.swift
//  TapMobileTestApp
//
//  Created by Стасенко Владимир on 01.04.2022.
//

import UIKit
import AVKit

class VideosListViewController: UIViewController {
    
    private enum Constants {
        static let cellIdentifier = "VideoCell"
    }
    
    private var videos: [URL] = []
    private var youtubeService = YoutubeService()
    
    private var collectionViewLayout: UICollectionViewFlowLayout = {
        let l = UICollectionViewFlowLayout()
        l.itemSize = .init(width: UIScreen.main.bounds.width - 40, height: 150)
        l.scrollDirection = .vertical
        l.minimumLineSpacing = 10
        return l
    }()
    
    // Subviews
    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar(frame: .zero)
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.delegate = self
        return sb
    }()
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videos = [
            URL(string: "https://www.youtube.com/embed/_Kqtj14rxes")!,
            URL(string: "https://www.youtube.com/embed/3dSouucdo0w")!,
            URL(string: "https://www.youtube.com/embed/-JeBXsK4hhw")!,
            URL(string: "https://www.youtube.com/embed/HfvKZUwh3Zg")!,
            URL(string: "https://www.youtube.com/embed/eGy-E8-cTjQ")!
        ]
        
        setupUI()
        setupLayout()
    }
    
    private func setupUI() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        view.backgroundColor = .white
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: Constants.cellIdentifier)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
        
        cell.url = video
        
        return cell
    }
}

extension VideosListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        youtubeService.searchVideos(with: text) { result in
            
        }
    }
}
