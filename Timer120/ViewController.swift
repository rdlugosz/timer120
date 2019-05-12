//
//  ViewController.swift
//  Timer120
//
//  Created by Ryan Dlugosz on 5/10/19.
//  Copyright © 2019 Back Cove Software, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fpsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let displayLink = CADisplayLink(target: self, selector: #selector(updateTimer))
     
        displayLink.add(to: .current,
                        forMode: .default)
        
    }

    @objc func updateTimer(displayLink: CADisplayLink){

        var fps = 1 / (displayLink.targetTimestamp - displayLink.timestamp)
        fps = Double(round(10000*fps)/10000)
        
        var time = displayLink.timestamp
        time = Double(round(10000000*time)/10000000)
        
        print("\(time) - \(fps)")
        timeLabel.text = "\(time)"
        fpsLabel.text = "FPS: \(fps)"
    }
}


