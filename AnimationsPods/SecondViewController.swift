//
//  SecondViewController.swift
//  AnimationsPods
//
//  Created by Superdigital on 25/02/19.
//  Copyright © 2019 Superdigital. All rights reserved.
//

import UIKit
import Spring
import EmptyDataSet_Swift

class SecondViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var popButton: SpringButton!
    
    var listOfWhatever: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.emptyDataSetSource = self
        collectionView.emptyDataSetDelegate = self
        configureEmptySet()
    }
    
    private func configureEmptySet() {
        collectionView.emptyDataSetView { view in
            view.titleLabelString(NSAttributedString(string: "Oops..."))
                .detailLabelString(NSAttributedString(string: "There's nothing here yet"))
                .image(#imageLiteral(resourceName: "empty-box"))
                .buttonTitle(NSAttributedString(string: "Touch to retry"), for: .normal)
                .didTapDataButton {
                    self.reloadData()
            }
        }
    }
    
    private func reloadData() {
        listOfWhatever = ["Gama", "Helix", "Iota"]
        collectionView.reloadData()
    }
    
    @IBAction func touchPopButton(_ sender: Any) {
        popButton.animate()
        dismiss(animated: true, completion: nil)
    }
}

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate, EmptyDataSetSource, EmptyDataSetDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfWhatever?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "whatever", for: indexPath) as! CollectionViewCell
        cell.label.text = listOfWhatever?[indexPath.item]
        return cell
    }
}
