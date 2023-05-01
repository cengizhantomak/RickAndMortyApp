//
//  LocationCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Cengizhan Tomak on 27.04.2023.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    override var isSelected: Bool {
            didSet {
                self.locationView.backgroundColor = isSelected ? .systemGray4 : .clear
            }
        }
}
