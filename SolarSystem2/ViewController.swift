//
//  ViewController.swift
//  SolarSystem2
//
//  Created by Ben on 5/8/17.
//  Copyright © 2017 Ben. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var planet = [Planet]()
    var musicPLayer: AVAudioPlayer!
    var x: CGFloat!
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        initAudio()
        animate()
        parsePlanetCSV()
    }
    override func viewDidAppear(_ animated: Bool) {
        animate()
    }
    
    func animate() {
        //UIView.animate(withDuration: 20, animations: {self.view.layer.position.x = -4500})
        let anim = CABasicAnimation(keyPath: "position.x")
        anim.fromValue = 2300
        anim.toValue = -2100
        anim.duration = 240
        anim.repeatCount = Float.infinity
        anim.autoreverses = true
 
        bgView.layer.add(anim, forKey: nil)
        let bgX: CGRect = bgView.frame
        
        x = bgX.origin.x
        
        
    }
    
    func initAudio() {
        let path = Bundle.main.path(forResource: "Interstellar", ofType: "mp3")!
        
        do {
            musicPLayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPLayer.prepareToPlay()
            musicPLayer.numberOfLoops = -1
            musicPLayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        if musicPLayer.isPlaying {
            musicPLayer.stop()
            sender.alpha = 0.5
        } else {
            musicPLayer.play()
            sender.alpha = 1.0
        }
    }
    
    func parsePlanetCSV() {
        let path = Bundle.main.path(forResource: "planet", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print("ROWS: \(rows)")
            
            for row in rows {
                let planettID = Int(row["id"]!)
                let name = row["name"]!
                let descriptions = row["description"]
                let imageDescription = row["surfaceImgDescrip"]
                let surfaceDescription = row["surface"]
                let geologyDescription = row["geology"]
                let planett = Planet(name: name, planetID: planettID!, description: descriptions!, descriotionImageDetail: imageDescription!, surfaceDetail: surfaceDescription!, geologyDetail: geologyDescription!)
                planet.append(planett)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCell {
            
            let planett = planet[indexPath.row]
            cell.configureCell(planett)
            return cell
            
        } else {
            
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var planett: Planet!
        planett = planet[indexPath.row]
        print("SOMETHING SELECTED")
        print("X: \(x!)")
        performSegue(withIdentifier: "PlanetDetailVCSegue", sender: planett)

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 375, height: 667)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlanetDetailVCSegue" {
            if let detailsVC = segue.destination as? PlanetDetailVC {
                if let planett = sender as? Planet {
                    detailsVC.planet = planett
                    
                }
            }
        }
    }
}

