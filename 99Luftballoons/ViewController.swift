//
//  ViewController.swift
//  99Luftballoons
//
//  Created by Todd McCready on 1/2/15.
//  Copyright (c) 2015 Todd McCready. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myImageLabel: UILabel!
    
    var myBalloons:[Balloon] = []
    var currentIndex = 0
    let balloonImages = ["RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toolbarNextButtonPressed(sender: UIBarButtonItem) {
        var randomIndex: Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myBalloons.count)))
        } while self.currentIndex == randomIndex
        self.currentIndex = randomIndex
        
        let balloon = self.myBalloons[randomIndex]
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = balloon.image
            if balloon.number != 1 {
                self.myImageLabel.text = "\(balloon.number) Red Balloons"
            } else {
                self.myImageLabel.text = "\(balloon.number) Red Balloon"
            }
            self.myImageLabel.hidden = false
            
            if balloon.image == UIImage(named: self.balloonImages[1]) {
                self.myImageLabel.textColor = UIColor.blackColor()
            } else {
                self.myImageLabel.textColor = UIColor.whiteColor()
            }

            }, completion: {
                (finished: Bool) -> () in
        })
    }
    
    func createBalloons () {
        for var x = 1; x < 100; x++ {
            //create 99 instances of struct balloon, then populate the array myBalloons
            var balloon = Balloon()
            balloon.number = x
            
            //sets balloon images randomly (supposed to use a switch, but this works too)
            var randomNumber = 0
            randomNumber = Int(arc4random_uniform(UInt32(self.balloonImages.count)))
            balloon.image = UIImage(named: self.balloonImages[randomNumber])
            
            //append each balloon instance to the array myBalloons
            self.myBalloons += [balloon]
        }
    }

}

