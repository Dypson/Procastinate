//
//  ViewController.swift
//  Procastination Killer
//
//  Created by Deepson on 5/13/19.
//  Copyright © 2019 Deepson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var num = 30
    var timer=Timer();
    let interval = 1.0
    @IBOutlet weak var lblSlider: UISlider!
    @IBOutlet weak var lblDisplay: UILabel!
    @IBOutlet weak var lblStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
      lblDisplay.text=String(num)+" Seconds"
        
    }
    @objc func updateTime(){
        if num>=0{
        lblDisplay.text=String(num)+" Seconds"
       num-=1
        }
    }
    func RunTimer(){
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector:#selector(updateTime) , userInfo: nil, repeats:true)

    }
    @IBAction func adjuster(_ sender: UIStepper) {
        lblDisplay.text=String(num)+" Seconds"
        sender.maximumValue=30
        sender.minimumValue=0
        num=Int(sender.value)
        timer.invalidate()
    }
    @IBAction func hSlider(_ sender: UISlider) {
        num=Int(sender.value)
        lblDisplay.text=String(num)+" Seconds"
        timer.invalidate()
    }
    
    @IBAction func btnStart(_ sender: Any) {
        RunTimer()
       // timer.invalidate()
    }
    @IBAction func btnStop(_ sender: Any) {
        num=0
         lblDisplay.text=String(num)+" Seconds"
        timer.invalidate()
    }
}
