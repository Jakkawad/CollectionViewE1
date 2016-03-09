//
//  CustomTableViewCell.swift
//  CollectionViewE1
//
//  Created by Jakkawad Chaiplee on 3/9/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col1 = collectionView.dequeueReusableCellWithReuseIdentifier("collectCell1", forIndexPath: indexPath) as? CustomCollectionViewCell
        
        return col1!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
