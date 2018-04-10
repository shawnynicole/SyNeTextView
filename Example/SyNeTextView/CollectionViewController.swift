//
//  CollectionViewController.swift
//  MLTextField
//
//  Created by DeShawn Jackson on 4/7/18.
//  Copyright © 2018 Piive. All rights reserved.
//

import UIKit

public class CollectionViewController: UICollectionViewController {

    public let textDelegate = TextDelegate()

    // MARK: UICollectionViewDataSource
    
    public override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        if indexPath.item % 3 == 0 && indexPath.item != 0 && indexPath.item != 9 {
            cell.field.isEnabled = false
        }
        
        let text = "\(indexPath) \(cell.field.isEnabled ? "ENABLED" : "DISABLED")"
        
        if !cell.field.isEnabled || indexPath.item % 2 == 0 {
            cell.field.text = text
        }
        
        cell.field.placeholder = text
        cell.field.delegate = textDelegate
        
        return cell
    }
}
