//
//  ViewController.swift
//  BPM Finder
//
//  Created by Michael Handkins on 4/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BPMLabel: UILabel!
    
    var counter: Double = 0.0
    var timer = Timer()
    var array: [Double] = []
    var started = false
    var taps = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        if started == false {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            started = true
            BPMLabel.text = "Keep tapping..."
            taps += 1
        } else {
            if taps < 7 {
                taps += 1
                addToArray()
            } else {
                taps += 1
                addToArray()
                getBPM()
            }
            
        }
    }
    
    @objc func updateCounter() {
        counter = counter + 0.1
    }
    
    func addToArray() {
        array.append(counter)
        counter = 0.0
    }
    
    func getBPM() {
        var bpm = round(60.0 / (array.reduce(0.0, +) / Double(array.count)))
        BPMLabel.text = "\(Int(bpm)) BPM"
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        timer.invalidate()
        counter = 0.0
        taps = 0
        started = false
        array = []
        BPMLabel.text = "TAP TO BEGIN"
    }
}

