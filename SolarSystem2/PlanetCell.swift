//
//  PlanetCell.swift
//  SolarSystem2
//
//  Created by Ben on 5/8/17.
//  Copyright © 2017 Ben. All rights reserved.
//

import UIKit

class PlanetCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var planetImg: UIImageView!

    
    var planet: Planet!
    
    func configureCell(_ planet: Planet) {
        self.planet = planet
        
        nameLbl.text = self.planet.name.capitalized
        planetImg.image = UIImage(named: "\(self.planet.planetID)")
        
    }
    
}
