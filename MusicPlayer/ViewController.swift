//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Владислав Лымарь on 05.08.2022.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var morgLabel: UIButton!
    
    @IBOutlet weak var artistMorgLabel: UILabel!
    @IBOutlet weak var nameMorgLabel: UILabel!
    @IBOutlet weak var faceLabel: UILabel!
    
    @IBOutlet weak var artiatFaceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameMorgLabel.text = "12"
        artistMorgLabel.text = "Morgenstern"
        faceLabel.text = "Антидепрессант"
        artiatFaceLabel.text = "Face"
    }

    @IBAction func buttonMorg(_ sender: Any) {
        performSegue(withIdentifier: "musicSegue", sender: nil)
        print("0")
    }
    
    @IBAction func buttonFace(_ sender: Any) {
        performSegue(withIdentifier: "musicSegue", sender: nil)
        print("1")
    }
}

