//
//  SelectViewController.swift
//  SoccerField
//
//  Created by Pavlo Ratushnyi on 12/4/18.
//  Copyright © 2018 Pavlo Ratushnyi. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var teamAPickerView: UIPickerView!
    @IBOutlet weak var teamBPickerView: UIPickerView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.teamAPickerView.delegate = self
        self.teamAPickerView.dataSource = self
        self.teamBPickerView.delegate = self
        self.teamBPickerView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for i in 0..<pickerData.count {
            teamAPickerView.selectRow(selectedA[i], inComponent: i, animated: true)
            teamBPickerView.selectRow(selectedB[i], inComponent: i, animated: true)
        }
    }
    
    
    //MARK: User interaction Methods
    
    @IBAction func switchToField(_ sender: UIButton) {
        
        var playersCountA = 0
        var playersCountB = 0
        
        teamAscheme.removeAll()
        teamBscheme.removeAll()
        
        for i in 0..<pickerData.count {
            teamAscheme.append(pickerData[i][teamAPickerView.selectedRow(inComponent: i)])
            teamBscheme.append(pickerData[i][teamBPickerView.selectedRow(inComponent: i)])
            
            selectedA[i] = teamAPickerView.selectedRow(inComponent: i)
            selectedB[i] = teamBPickerView.selectedRow(inComponent: i)
            
            playersCountA += teamAscheme[i].intValue
            playersCountB += teamBscheme[i].intValue
        }
        
        if (playersCountA == 11) && (playersCountB == 11) {
            performSegue(withIdentifier: "switchToField", sender: nil)
        } else {
            let alertController = UIAlertController(title: "Enter correct number of players", message: "It should be 11", preferredStyle: UIAlertControllerStyle.alert)
            let oklAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action : UIAlertAction!) -> Void in })
            alertController.addAction(oklAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    //MARK: PickerView methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[0].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row].stringValue
    }
    
    

}
