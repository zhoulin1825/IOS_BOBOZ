//
//  OverallView.swift
//  BoBoZ
//
//  Created by Zhou Lin on 15-8-12.
//  Copyright (c) 2015年 Zhou Lin. All rights reserved.
//

import UIKit

class OverallView: UIView {
    
    var lineWidth: CGFloat = 1.0 { didSet {setNeedsDisplay() } }
    
    var fullBlood: UIColor = UIColor.orangeColor()
    
    var emptyBlood: UIColor = UIColor.whiteColor()
    
    var BoxFram: UIColor = UIColor.grayColor()
    
    var numberOfBlood : Int = 3 { didSet {setNeedsDisplay() } }
    
    var numberOfEnergy : Int = 0 { didSet {setNeedsDisplay() } }
    
    
    private struct Scaling {
        static let BloodBoxTopLine: CGFloat = 7
        static let BloodBoxBottomLine: CGFloat = 7
        static let BloodBoxLeftLine: CGFloat = 15
        static let BloodBoxSpace: CGFloat = 5
    }
    
    private enum BloodBox { case first, second, third}
    
    private func bezierPathForBloodBox(whichBox: BloodBox)  -> UIBezierPath
    {
        let BoxCenterSeparation = bounds.size.width / 2 * 0.85
        
        var BloodBoxPosition = convertPoint(center, fromView: superview)
        BloodBoxPosition.y = 30

        switch whichBox {
        case .first: BloodBoxPosition.x -= BoxCenterSeparation
        case .second: BloodBoxPosition.x -= BoxCenterSeparation - 10
        case .third: BloodBoxPosition.x -= BoxCenterSeparation - 20

        }
        
        let path = UIBezierPath()
        path.moveToPoint(BloodBoxPosition)
        path.addLineToPoint(CGPoint(x: BloodBoxPosition.x + Scaling.BloodBoxTopLine ,y: BloodBoxPosition.y))
        path.addLineToPoint(CGPoint(x: BloodBoxPosition.x + Scaling.BloodBoxTopLine ,y: BloodBoxPosition.y + Scaling.BloodBoxLeftLine))
        path.addLineToPoint(CGPoint(x:BloodBoxPosition.x , y:BloodBoxPosition.y + Scaling.BloodBoxLeftLine))
        path.closePath()
        path.lineWidth = lineWidth
        return path
    }
    
    
    
    private enum EnergyBar { case first, second, third}
    private func bezierPathForEnergyBar(whichBox: EnergyBar)  -> UIBezierPath
    {
        let BarCenterSeparation = bounds.size.width / 2 * 0.85
        
        var EnergyBarPosition = convertPoint(center, fromView: superview)
        EnergyBarPosition.y = 50
        
        switch whichBox {
        case .first: EnergyBarPosition.x -= BarCenterSeparation
        case .second: EnergyBarPosition.x -= BarCenterSeparation - 10
        case .third: EnergyBarPosition.x -= BarCenterSeparation - 20
            
        }
        
        let path = UIBezierPath()
        path.moveToPoint(EnergyBarPosition)
        path.addLineToPoint(CGPoint(x: EnergyBarPosition.x + Scaling.BloodBoxTopLine ,y: EnergyBarPosition.y ))
        path.addLineToPoint(CGPoint(x: EnergyBarPosition.x + Scaling.BloodBoxTopLine ,y: EnergyBarPosition.y + Scaling.BloodBoxLeftLine))
        path.addLineToPoint(CGPoint(x:EnergyBarPosition.x , y:EnergyBarPosition.y + Scaling.BloodBoxLeftLine))
        path.closePath()
        path.lineWidth = lineWidth
        return path
    }
    
    

    override func drawRect(rect: CGRect) {
        drawBloodBox()
        drawEnergyBar ()
    }
    
    func drawEnergyBar (){
        if numberOfEnergy >= 1{
            UIColor.blueColor().setFill()
            bezierPathForEnergyBar(.first).fill()
            if numberOfEnergy >= 2{
                bezierPathForEnergyBar(.second).fill()
                if numberOfEnergy == 3{
                    bezierPathForEnergyBar(.third).fill()
                }
            }
        }
        BoxFram.setStroke()
        bezierPathForEnergyBar(.first).stroke()
        bezierPathForEnergyBar(.second).stroke()
        bezierPathForEnergyBar(.third).stroke()
    }
    
    
    
    func drawBloodBox () {
        if numberOfBlood >= 1{
            fullBlood.setFill()
            bezierPathForBloodBox(.first).fill()
            if numberOfBlood >= 2{
                bezierPathForBloodBox(.second).fill()
                    if numberOfBlood == 3{
                        bezierPathForBloodBox(.third).fill()
                    }
            }
        }
        BoxFram.setStroke()
        bezierPathForBloodBox(.first).stroke()
        bezierPathForBloodBox(.second).stroke()
        bezierPathForBloodBox(.third).stroke()
    }
    
    func setBlood (currentBlood: Int){
        if currentBlood>=0 && currentBlood<=3 {
            self.numberOfBlood = currentBlood
        }
    }

    func setEnergy (currentEnergy: Int){
        if currentEnergy>=0 && currentEnergy<=3 {
            self.numberOfEnergy = currentEnergy
        }
    }
}
