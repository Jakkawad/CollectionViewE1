//
//  CustomTableViewCell.swift
//  CollectionViewE1
//
//  Created by Jakkawad Chaiplee on 3/9/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire
import MapleBacon

class CustomTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var mainCollectView: UICollectionView!
    
    var mainDataArray = NSArray()
    
    func feedData() {
        let params = ["api":"productall","productall":"100"]
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: params, encoding: .URL, headers: nil).responseJSON { (request, response, result) -> Void in
            self.mainDataArray = result.value as! NSArray
            //print(self.mainDataArray.description)
            self.mainCollectView.reloadData()
        }   //print(result.value!)
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 4
        return self.mainDataArray.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col1 = collectionView.dequeueReusableCellWithReuseIdentifier("collectCell1", forIndexPath: indexPath) as? CustomCollectionViewCell
        
        let item = self.mainDataArray[indexPath.row] as! NSDictionary
        
        let imageUrl = item.objectForKey("ProductShowImage") as? String
        var wwwURL = "https://www.all2sale.com/store/"
        wwwURL += imageUrl!
        let imageURL2 = NSURL(string: wwwURL)!
        
        col1?.imageViewProduct.setImageWithURL(imageURL2)
        col1?.lblName.text = item.objectForKey("ProductName") as? String
        col1?.lblPrice.text = item.objectForKey("StoreSid") as? String

        return col1!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        feedData()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
