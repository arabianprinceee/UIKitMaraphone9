//
//  ViewController.swift
//  UIKitMaraphone9
//
//  Created by Anas Ben mustafa on 2/26/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSizeMake(UIScreen.main.bounds.width - 32, 400)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
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
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if (scrollView == self.collectionView) {
//                CGPoint currentCellOffset = self.collectionView.contentOffset;
//                currentCellOffset.x += self.collectionView.frame.size.width / 2;
//                NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:currentCellOffset];
//                [self.collectionView scrollToItemAtIndexPath:indexPath
//                                            atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
//                                                    animated:YES];
//            }
//    }

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

