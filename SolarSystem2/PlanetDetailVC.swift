//
//  PlanetDetailVC.swift
//  SolarSystem2
//
//  Created by Ben on 5/8/17.
//  Copyright © 2017 Ben. All rights reserved.
//

import UIKit

class PlanetDetailVC: UIViewController {


    @IBOutlet weak var topBar: UIView!

    @IBOutlet weak var blurBg: UIImageView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var imageDescriptionLabel: UILabel!
    @IBOutlet weak var surfaceDescription: UILabel!
    @IBOutlet weak var geologyDescription: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBlur()
        
        nameLbl.text = planet.name
        
        if nameLbl.text! == "neptune" {
            label1.text = "Atmosphere"
            label2.text = "Interior"
        }
        
        // Adding Img1
        img1.image = UIImage(named: "\(planet.name)1")
        // Adding Img2
        img2.image = UIImage(named: "\(planet.name)2")
        // Adding Img3
        img3.image = UIImage(named: "\(planet.name)3")
        //Adding Img4
        img4.image = UIImage(named: "\(planet.name)4")
        
        // Adding Description Text
        
        descriptionLbl.text = planet.description.replacingOccurrences(of: "_", with: " ")
        
        descriptionLbl.text = descriptionLbl.text!.replacingOccurrences(of: "&", with: ", ")
        
        descriptionLbl.text = descriptionLbl.text!.replacingOccurrences(of: "Y", with: ",")
        
        // Adding Image Description text
        
        imageDescriptionLabel.text = planet.descriptionImageDetail.replacingOccurrences(of: "_", with: " ")
        imageDescriptionLabel.text = imageDescriptionLabel.text!.replacingOccurrences(of: "X", with: "°")
        imageDescriptionLabel.text = imageDescriptionLabel.text!.replacingOccurrences(of: "Y", with: ",")
        
        // Adding Surface Description text
        
        surfaceDescription.text = planet.surfaceDetail.replacingOccurrences(of: "_", with: " ")
        surfaceDescription.text = surfaceDescription.text!.replacingOccurrences(of: "X", with: "°")
        surfaceDescription.text = surfaceDescription.text!.replacingOccurrences(of: "Y", with: ",")
        
        // Adding Geology Description text
        
        geologyDescription.text = planet.geologyDetail.replacingOccurrences(of: "_", with: " ")
         geologyDescription.text =  geologyDescription.text!.replacingOccurrences(of: "Y", with: ",")
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func addBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blurBg.bounds
        blurBg.addSubview(blurEffectView)
        
    }
    


}
