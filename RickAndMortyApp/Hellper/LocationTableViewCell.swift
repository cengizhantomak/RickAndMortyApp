//
//  LocationTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Cengizhan Tomak on 28.04.2023.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var genderImage1: UIImageView!
    @IBOutlet weak var genderImage2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
