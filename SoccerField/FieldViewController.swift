//
//  FieldViewController.swift
//  SoccerField
//
//  Created by Pavlo Ratushnyi on 12/4/18.
//  Copyright © 2018 Pavlo Ratushnyi. All rights reserved.
//

import UIKit

class FieldViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var teamAPlayerView = TeamAPlayerView()
    
    @IBOutlet weak var soccerFieldView: SoccerFieldView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(switchToScheme))
        swipe.delegate = self
        swipe.direction = .right
        view.addGestureRecognizer(swipe)
        
    }
    
    @objc func switchToScheme () {
        performSegue(withIdentifier: "segueToScheme", sender: nil)
    }
    
    
    override func viewWillLayoutSubviews() {
        
        self.view.subviews.forEach({ if type(of: $0) != SoccerFieldView.self { $0.removeFromSuperview() }})
        
        let playerMarkerSize = self.view.bounds.height * 0.05
        
        var stretchCoefA = CGFloat(1.0)
        var stretchCoefB = CGFloat(1.0)
        if teamAscheme[4].intValue == 0 {
            stretchCoefA = 1.2
        }
        if teamBscheme[4].intValue == 0 {
            stretchCoefB = 1.2
        }
        
        for row in 0..<teamAscheme.count {
            
            let numberInRowA = teamAscheme[row].intValue
            let playersDistanceA = self.view.bounds.width / CGFloat(numberInRowA + 1 )
            if numberInRowA != 0 {
                for player in 1...numberInRowA {
                    let teamAPlayerView = TeamAPlayerView()
                    teamAPlayerView.frame = CGRect.init(x: 0, y: 0, width: playerMarkerSize, height: playerMarkerSize)
                    teamAPlayerView.center = CGPoint(x: playersDistanceA * CGFloat(player), y: self.view.bounds.height * 0.085 * stretchCoefA * CGFloat(row+1))
                    self.view.addSubview(teamAPlayerView)
                    
                }
            }
            
            let numberInRowB = teamBscheme[row].intValue
            let playersDistanceB = self.view.bounds.width / CGFloat(numberInRowB + 1 )
            if numberInRowB != 0 {
                for player in 1...numberInRowB {
                    let teamBPlayerView = TeamBPlayerView()
                    teamBPlayerView.frame = CGRect.init(x: 0, y: 0, width: playerMarkerSize, height: playerMarkerSize)
                    teamBPlayerView.center = CGPoint(x: playersDistanceB * CGFloat(player), y: self.view.bounds.height * ( 1 - 0.085 * stretchCoefB * CGFloat(row+1)))
                    self.view.addSubview(teamBPlayerView)
                    
                }
            }
            
        }
        
    }
}
