//
//  ViewController.swift
//  UIKitMaraphone9
//
//  Created by Anas Ben mustafa on 2/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    private static let itemSize: CGSize = .init(width: 300, height: 400)
    private static let itemSpacing: CGFloat = 16

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = Self.itemSize
        layout.minimumLineSpacing = Self.itemSpacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        layout.sectionInset.left = collectionView.layoutMargins.left
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        title = "Collection"

        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let itemWidth = Self.itemSize.width + Self.itemSpacing
        let contentOffset = targetContentOffset.pointee.x + Self.itemSpacing
        let itemToScroll = round(contentOffset / itemWidth)
        
        targetContentOffset.pointee = CGPoint(x: itemToScroll * itemWidth - scrollView.contentInset.left,
                                              y: scrollView.contentInset.top)
    }

}

extension ViewController: UICollectionViewDelegate {}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }

}

