//
//  ViewController.swift
//  Xylophone
//
//  Created by Jubeen Shah on 13/09/2018.
//  Copyright © 2018 Jubeen Shah. All rights reserved.
//

import UIKit
import AVFoundation //Step 1

//-----------------------------------------Step 2---v
class ViewController: UIViewController, AVAudioPlayerDelegate{
//-------------------------------------------------^
    var audioPlayer : AVAudioPlayer! //Step 3
    let soundArray : Array = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    var selectedSoundFileName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
      
        selectedSoundFileName = soundArray[(sender.tag - 1)]
        playSound(selectedSoundFileName : selectedSoundFileName)
        
    }
    
    func playSound(selectedSoundFileName : String) {
        
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        
            audioPlayer.play()
    
        
    }
  

}

