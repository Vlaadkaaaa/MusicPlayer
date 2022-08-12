//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by Владислав Лымарь on 05.08.2022.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    var c = 0
    @IBOutlet weak var volumeOutlet: UISlider!
    @IBOutlet weak var playOutlet: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var timeStartLabel: UILabel!
    
    @IBOutlet weak var timeAndLabel: UILabel!
    
    @IBOutlet weak var sliderSong: UISlider!
    
    
    var arraySounds = ["morg12", "face"]
    
    
    var player = AVAudioPlayer()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.sliderSong.minimumValue = 0.0
        timeStartLabel.text = timePoint()
        
        self.sliderSong.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        do{
            if let audioPath = Bundle.main.path(forResource: arraySounds[0], ofType: "mp3"){
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            }
            
        }   catch{
            print("Error sounds")
        }
        
        imageView.image = .init(named: "morg12")
        player.play()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateSongInfo()
    }
    
    func updateSongInfo(){
        sliderSong.maximumValue = Float(player.duration)
        sliderSong.value = Float(player.currentTime)
        timeStartLabel.text = timePoint()
        
    }
    
    @objc func changeSlider(sender: UISlider){
       if sender == sliderSong{
           player.currentTime = TimeInterval(sender.value)
       }
   }
    
    func taskAudio(){
        sliderSong.value = Float(player.currentTime)
        timeStartLabel.text = timePoint()
        
    }
    
    func timePoint() -> String{
        let temp = Int(player.currentTime + 0.5)
        let mins = temp / 60
        let secs = temp % 60
        return String(format: "%02d:%02d", mins, secs)
    }
    
    @IBAction func playButton(_ sender: Any) {
         c += 1
        if c % 2 == 0{
           self.player.play()
            playOutlet.setImage(UIImage(named: "pause"), for: .normal)
        } else{
          self.player.pause()
            playOutlet.setImage(UIImage(named: "play"), for: .normal)
        }
    }
    
    
    
    
    @IBAction func volumeAction(_ sender: Any) {
        self.player.volume = self.volumeOutlet.value
    }
}
