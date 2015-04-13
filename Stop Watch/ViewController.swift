//
//  ViewController.swift
//  Stop Watch
//
//  Created by Francisco de la Pena on 2/13/15.
//  Copyright (c) 2015 ___QuixoteLabs___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timerLabel: UILabel!
    
    var myTimer = NSTimer()
    
    var hours = 0
    
    var minutes = 0
    
    var seconds = 0
    
    var decimas = 0
  
    func updateTimerLabel() {
        
        if (myTimer.valid) {
        
            decimas++
        
            if (decimas == 10) {
    
                decimas = 0
            
                seconds++
        
                if (seconds == 2) {
            
                    seconds = 0
                
                    minutes++
            
                    if (minutes == 2) {
                
                        minutes = 0
                    
                        hours++
                
                    }
            
                }
            
            }
        
            timerLabel.text = "\(hours):\(minutes):\(seconds).\(decimas)"
            
        }
    
    }
    
    @IBAction func playButtonPressed(sender: UIBarButtonItem) {
        
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimerLabel"), userInfo: nil, repeats: true)
    
    }
    
    @IBAction func pauseButtonPressed(sender: UIBarButtonItem) {
    
        myTimer.invalidate()
        
    }
    
    @IBAction func resetButtonPressed(sender: UIBarButtonItem) {
        
        myTimer.invalidate()
        
        hours = 0
        
        minutes = 0
        
        seconds = 0
        
        decimas = 0
        
        timerLabel.text = "\(hours):\(minutes):\(seconds).\(decimas)"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

