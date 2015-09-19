//
//  BoBoZViewController.swift
//  BoBoZ
//
//  Created by Zhou Lin on 15-8-12.
//  Copyright (c) 2015年 Zhou Lin. All rights reserved.
//

import UIKit

class BoBoZViewController: UIViewController {

    @IBOutlet var BloodBox: OverallView!
    @IBOutlet var computer: OverallView!
    var brain = GameBrain()
    
    var number: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var outputText: UILabel!
    
    @IBOutlet var computerAction: UILabel!

    @IBAction func zan() {
        outputText.text = brain.getUserAction(2)
        computerAction.text = brain.getComputerAction()
        BloodBox.setBlood(brain.getBlood())
        BloodBox.setEnergy(brain.getEnergy())
        computer.setBlood(brain.getComputerBlood())
        computer.setEnergy(brain.getComputerEnergy())
    }
    
    @IBAction func bo() {
        outputText.text = brain.getUserAction(1)
        computerAction.text = brain.getComputerAction()
        BloodBox.setBlood(brain.getBlood())
        BloodBox.setEnergy(brain.getEnergy())
        computer.setBlood(brain.getComputerBlood())
        computer.setEnergy(brain.getComputerEnergy())
    }

    @IBAction func fang() {
        outputText.text = brain.getUserAction(3)
        computerAction.text = brain.getComputerAction()
        BloodBox.setBlood(brain.getBlood())
        BloodBox.setEnergy(brain.getEnergy())
        computer.setBlood(brain.getComputerBlood())
        computer.setEnergy(brain.getComputerEnergy())
    }
    
    @IBAction func AddBlood() {
        brain.addOneBlood()
        BloodBox.setBlood(brain.getBlood())
    }
    @IBAction func LoseBlood() {
        brain.loseOneBlood()
        BloodBox.setBlood(brain.getBlood())
    }

}
