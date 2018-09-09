//
//  ViewController.swift
//  03-Dicee
//
//  Created by Jubeen shah on 9/9/18.
//  Copyright © 2018 Jubeen shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDiceFaces ()
    }

   
    @IBAction func rollButton(_ sender: UIButton) {
        
        updateDiceFaces ()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceFaces()
    }
    
    func updateDiceFaces () {
        randomDiceIndex1 = Int.random(in: 1 ... 6)
        randomDiceIndex2 = Int.random(in: 1 ... 6)
        
        print("1: \(randomDiceIndex1) \t2: \(randomDiceIndex2) ")
        
        
        diceImageView1.image  = UIImage(named: "dice\(randomDiceIndex1)")
        diceImageView2.image  = UIImage(named: "dice\(randomDiceIndex2)")
    }
    
}

