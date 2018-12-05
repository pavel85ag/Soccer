//
//  SoccerFieldView.swift
//  SoccerField
//
//  Created by Pavlo Ratushnyi on 11/30/18.
//  Copyright © 2018 Pavlo Ratushnyi. All rights reserved.
//

import UIKit

class SoccerFieldView: UIView {

    
    
    // MARK: Field lines parameters
    var lineWidth = CGFloat(3.0)
    var centerCircleRadiusCoef = CGFloat(0.08)
    var cornerOffsetCoef = CGFloat(0.05)
    var cornerArcRadiusCoef = CGFloat(0.04)
    var penaltyZoneXCoef = CGFloat(0.55)
    var penaltyZoneYCoef = CGFloat(0.16)
    var goalkeeperZoneXCoef = CGFloat(0.2)
    var goalkeeperZoneYCoef = CGFloat(0.05)
    var penaltyPointYCoef = CGFloat(0.11)


    override func draw(_ rect: CGRect) {
        
        let fieldWidth = bounds.width
        let fieldHeight = bounds.height
        let fieldCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        let arcRadius = fieldWidth * cornerArcRadiusCoef
        let stAng = 0.5 * CGFloat.pi
        
        
        // MARK: Draw Field stripes
        
        UIColor.white.withAlphaComponent(0.15).setFill()
        
        for i in 1...5 {
            let stripe = UIBezierPath(rect: CGRect(x: 0, y: fieldHeight * 0.1 * CGFloat((i - 1)*2), width: fieldWidth, height: fieldHeight * 0.1))
            stripe.fill()
        }
        
        // MARK: Draw Lines
        
        UIColor.white.withAlphaComponent(0.4).setStroke()

        let centerCircle = UIBezierPath(arcCenter: fieldCenter, radius: centerCircleRadiusCoef * fieldHeight, startAngle: 0, endAngle: 4 * stAng, clockwise: false)
        centerCircle.lineWidth = lineWidth
        centerCircle.stroke()
        
        let centerLine = UIBezierPath()
        centerLine.move   (to: CGPoint(x: fieldWidth * cornerOffsetCoef,       y: fieldCenter.y ))
        centerLine.addLine(to: CGPoint(x: fieldWidth * (1 - cornerOffsetCoef), y: fieldCenter.y ))
        centerLine.lineWidth = lineWidth
        centerLine.stroke()
        

        let cornerTopLeft  = CGPoint(x: fieldWidth * cornerOffsetCoef,       y: fieldHeight * cornerOffsetCoef)
        let cornerTopRight = CGPoint(x: fieldWidth * (1 - cornerOffsetCoef), y: fieldHeight * cornerOffsetCoef)
        let cornerBotLeft  = CGPoint(x: fieldWidth * cornerOffsetCoef,       y: fieldHeight * (1 - cornerOffsetCoef))
        let cornerBotRight = CGPoint(x: fieldWidth * (1 - cornerOffsetCoef), y: fieldHeight * (1 - cornerOffsetCoef))


        let mainBouds = UIBezierPath()
        mainBouds.move   (to: cornerTopLeft)
        mainBouds.addLine(to: cornerTopRight)
        mainBouds.addLine(to: cornerBotRight)
        mainBouds.addLine(to: cornerBotLeft)
        mainBouds.addLine(to: cornerTopLeft)
        mainBouds.lineWidth = lineWidth
        mainBouds.stroke()
        
        
        let penaltyZone = UIBezierPath()
        penaltyZone.move   (to: CGPoint(x: fieldCenter.x - (0.5 * penaltyZoneXCoef) * fieldWidth, y: fieldHeight * cornerOffsetCoef))
        penaltyZone.addLine(to: CGPoint(x: fieldCenter.x - (0.5 * penaltyZoneXCoef) * fieldWidth, y: fieldHeight * (cornerOffsetCoef + penaltyZoneYCoef)))
        penaltyZone.addLine(to: CGPoint(x: fieldCenter.x + (0.5 * penaltyZoneXCoef) * fieldWidth, y: fieldHeight * (cornerOffsetCoef + penaltyZoneYCoef)))
        penaltyZone.addLine(to: CGPoint(x: fieldCenter.x + (0.5 * penaltyZoneXCoef) * fieldWidth, y: fieldHeight * cornerOffsetCoef))
        penaltyZone.move   (to: CGPoint(x: fieldCenter.x - (0.5 * penaltyZoneXCoef) * fieldWidth, y: fieldHeight * (1 - cornerOffsetCoef)))
        penaltyZone.addLine(to: CGPoint(x: fieldCenter.x - (0.5 * penaltyZoneXCoef) * fieldWidth, y: fieldHeight * (1 - cornerOffsetCoef - penaltyZoneYCoef)))
        penaltyZone.addLine(to: CGPoint(x: fieldCenter.x + (0.5 * penaltyZoneXCoef) * fieldWidth, y: fieldHeight * (1 - cornerOffsetCoef - penaltyZoneYCoef)))
        penaltyZone.addLine(to: CGPoint(x: fieldCenter.x + (0.5 * penaltyZoneXCoef) * fieldWidth, y: fieldHeight * (1 - cornerOffsetCoef)))
        penaltyZone.lineWidth = lineWidth
        penaltyZone.stroke()

        
        let goalkeeperZone = UIBezierPath()
        goalkeeperZone.move   (to: CGPoint(x: fieldCenter.x - (0.5 * goalkeeperZoneXCoef) * fieldWidth, y: fieldHeight * cornerOffsetCoef))
        goalkeeperZone.addLine(to: CGPoint(x: fieldCenter.x - (0.5 * goalkeeperZoneXCoef) * fieldWidth, y: fieldHeight * (cornerOffsetCoef + goalkeeperZoneYCoef)))
        goalkeeperZone.addLine(to: CGPoint(x: fieldCenter.x + (0.5 * goalkeeperZoneXCoef) * fieldWidth, y: fieldHeight * (cornerOffsetCoef + goalkeeperZoneYCoef)))
        goalkeeperZone.addLine(to: CGPoint(x: fieldCenter.x + (0.5 * goalkeeperZoneXCoef) * fieldWidth, y: fieldHeight * cornerOffsetCoef))
        goalkeeperZone.move   (to: CGPoint(x: fieldCenter.x - (0.5 * goalkeeperZoneXCoef) * fieldWidth, y: fieldHeight * (1 - cornerOffsetCoef)))
        goalkeeperZone.addLine(to: CGPoint(x: fieldCenter.x - (0.5 * goalkeeperZoneXCoef) * fieldWidth, y: fieldHeight * (1 - cornerOffsetCoef - goalkeeperZoneYCoef)))
        goalkeeperZone.addLine(to: CGPoint(x: fieldCenter.x + (0.5 * goalkeeperZoneXCoef) * fieldWidth, y: fieldHeight * (1 - cornerOffsetCoef - goalkeeperZoneYCoef)))
        goalkeeperZone.addLine(to: CGPoint(x: fieldCenter.x + (0.5 * goalkeeperZoneXCoef) * fieldWidth, y: fieldHeight * (1 - cornerOffsetCoef)))
        goalkeeperZone.lineWidth = lineWidth
        goalkeeperZone.stroke()
        

        let arcTopLeft  = UIBezierPath(arcCenter: cornerTopLeft,  radius: arcRadius, startAngle: 0 * stAng, endAngle: 1 * stAng, clockwise: true)
        let arcTopRight = UIBezierPath(arcCenter: cornerTopRight, radius: arcRadius, startAngle: 1 * stAng, endAngle: 2 * stAng, clockwise: true)
        let arcBotRigth = UIBezierPath(arcCenter: cornerBotRight, radius: arcRadius, startAngle: 2 * stAng, endAngle: 3 * stAng, clockwise: true)
        let arcBotLeft  = UIBezierPath(arcCenter: cornerBotLeft,  radius: arcRadius, startAngle: 3 * stAng, endAngle: 4 * stAng, clockwise: true)
        arcTopLeft.lineWidth  = lineWidth
        arcTopRight.lineWidth = lineWidth
        arcBotRigth.lineWidth = lineWidth
        arcBotLeft.lineWidth  = lineWidth
        arcTopLeft.stroke()
        arcTopRight.stroke()
        arcBotRigth.stroke()
        arcBotLeft.stroke()
        
        
        let topPenaltyPoint = UIBezierPath(arcCenter: CGPoint(x: fieldCenter.x, y: fieldHeight * (cornerOffsetCoef + penaltyPointYCoef)), radius: 1, startAngle: 0, endAngle: 4 * stAng, clockwise: true)
        let botPenaltyPoint = UIBezierPath(arcCenter: CGPoint(x: fieldCenter.x, y: fieldHeight * (1 - cornerOffsetCoef - penaltyPointYCoef)), radius: 1, startAngle: 0, endAngle: 4 * stAng, clockwise: true)
        topPenaltyPoint.lineWidth = lineWidth
        botPenaltyPoint.lineWidth = lineWidth
        topPenaltyPoint.stroke()
        botPenaltyPoint.stroke()
        
        let radius = centerCircleRadiusCoef
        let penaltyCircleAngle = acos((penaltyZoneYCoef - penaltyPointYCoef)/radius)
        let topArc = UIBezierPath(arcCenter: CGPoint(x: fieldCenter.x, y: fieldHeight * (1 - cornerOffsetCoef - penaltyPointYCoef)), radius: centerCircleRadiusCoef * fieldHeight, startAngle: 3 * stAng - penaltyCircleAngle, endAngle: 3 * stAng + penaltyCircleAngle, clockwise: true)
        let botArc = UIBezierPath(arcCenter: CGPoint(x: fieldCenter.x, y: fieldHeight * (cornerOffsetCoef + penaltyPointYCoef)), radius: centerCircleRadiusCoef * fieldHeight, startAngle: 1 * stAng - penaltyCircleAngle, endAngle: 1 * stAng + penaltyCircleAngle, clockwise: true)
        topArc.lineWidth = lineWidth
        botArc.lineWidth = lineWidth
        topArc.stroke()
        botArc.stroke()
        
    }


}



