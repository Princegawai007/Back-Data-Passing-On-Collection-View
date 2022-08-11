//
//  CustomCollectionViewCell.swift
//  BackDataPassingCollectionView
//
//  Created by Prince's Mac on 06/07/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
