//
//  VideosListViewController.swift
//  TapMobileTestApp
//
//  Created by Стасенко Владимир on 01.04.2022.
//

import UIKit

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
        // Do any additional setup after loading the view.
    }
}

extension VideosListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let video = videos[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellIdentifier,
                                                      for: indexPath) as! VideoCell
        
//        cell.titleLabel.text = video.title
        
        return cell
    }
}

extension VideosListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
    }
}
