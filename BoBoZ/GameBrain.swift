//
//  GameBrain.swift
//  BoBoZ
//
//  Created by Zhou Lin on 15/8/17.
//  Copyright (c) 2015年 Zhou Lin. All rights reserved.
//

import Foundation

class GameBrain
{
    var numberOfBlood: Int = 3
    var numberOfEnergy: Int = 0
    
    var computernumberOfBlood: Int = 3
    var computernumberOfEnergy: Int = 0
    
    var userActionIsValid: Bool = false
    var computerAction: Int = 4
    
    func getUserAction (userAction: Int) -> String {
        var outputText:String
        switch userAction {
        case 1://波
            if numberOfEnergy>=1 {
                userActionIsValid = true
                numberOfEnergy--
                outputText = "波!"
            } else {
                outputText = "Invalid Action!"
            }
        case 2:
            numberOfEnergy++   //攒
            userActionIsValid = true
            outputText = "攒!"
        case 3:
            userActionIsValid = true
            outputText = "防!"   //防
        default:
            outputText = "Invalid Action! Try Again."
        }
        if userActionIsValid == true {
            competeWithComputer(userAction)
        }
        return outputText
    }

    func competeWithComputer(userAction: Int) {
        userActionIsValid = false
        if computernumberOfEnergy==0 && numberOfEnergy==0{
            computerAction = 0
        } else if computernumberOfEnergy==0{
            computerAction = Int(arc4random_uniform(2))
        } else {
            computerAction = Int(arc4random_uniform(3))
        }
        
        
        
        if computerAction == 0 {//赞
            computernumberOfEnergy++
        } else if computerAction == 1 {//防
            
        } else {//波
            computernumberOfEnergy--
        }
        
        if computerAction == 0 && userAction == 1 {
            if computernumberOfBlood>0 {
                computernumberOfBlood--
            }
        }
        if userAction == 2 && computerAction == 2 {
            if numberOfBlood>0 {
                numberOfBlood--
            }
        }
        if userAction == 1 && computerAction == 2 {
            if computernumberOfBlood>0 {
                computernumberOfBlood--
            }
            if numberOfBlood>0 {
                numberOfBlood--
            }
        }
        
    }
    
    func getComputerAction () -> String
    {
        switch computerAction {
        case 0://波
            return "攒！"
        case 1:
            return "防!"
        case 2:
            return  "波!"   //防
        default:
            return  ""
        }
    }

    func getBlood () ->Int {
        return numberOfBlood
    }
    
    func getEnergy () ->Int {
        return numberOfEnergy
    }
    
    func getComputerBlood () ->Int {
        return computernumberOfBlood
    }
    
    func getComputerEnergy () ->Int {
        return computernumberOfEnergy
    }
    
    
    func addOneBlood (){
        if numberOfBlood <= 3 {
            numberOfBlood++
        }
    }
    
    func loseOneBlood (){
        if numberOfBlood>0 {
            numberOfBlood--
        }
    }
    
}
