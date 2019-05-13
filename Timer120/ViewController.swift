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
        displayLink.add(to: .current, forMode: .default)
    }

    @objc func updateTimer(displayLink: CADisplayLink){
        var fps = 1 / (displayLink.targetTimestamp - displayLink.timestamp)
        fps = Double(round(10000*fps)/10000)
        
        // This will be the current CPU time, which may have a large integer part
        // and far more digits than we need in the fractional part. Let's just keep
        // a max 999.123456 for display.
        let time = displayLink.timestamp
        
        // Pad with a couple zeros in case CPU time < 1000
        let timeStr = String("000\(time)")
        
        let timeAry = timeStr.split(separator: ".")
        let left = timeAry[0].suffix(3)
        let right = timeAry[1].prefix(6)
        let formattedTime = "\(left).\(right)"
        
        //log to console for debugging
//        print("\(time) - \(formattedTime)")
        
        timeLabel.text = "\(formattedTime)"
        fpsLabel.text = "FPS: \(fps)"
    }
}


