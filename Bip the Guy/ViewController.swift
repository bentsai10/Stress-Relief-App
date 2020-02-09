//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Ben Tsai on 2/1/20.
//  Copyright © 2020 Ben Tsai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //MARK: PROPERTIES
    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: FUNCTIONS
    func animateImage(){
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        
        //shrink our imagetoPunch by 60 pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width-shrinkValue, height: self.imageToPunch.bounds.size.height-shrinkValue)
        
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToPunch.bounds = bounds}, completion: nil)
        
    }
    
    func playSound(name:String){
        if let sound = NSDataAsset(name: name){
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data )
                audioPlayer.play()
            }catch {
                print("😡ERROR: \(error.localizedDescription)Could not initialize AVAudioPlayer object")
            }
        }else{
            print("😡ERROR: Could not read data from file sound\(name)")
        }
    }
    
    //MARK: ACTIONS
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(name: "punchSound")
    }
    

}

