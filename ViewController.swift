//
//  ViewController.swift
//  The ArithMETic App
//
//  Created by student on 2/13/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    let activity = ["Bicycling","Jumping rope","Running - slow","Running - ast","Tennis","Swimming"]
    
    
     var activity1:String? = "Bicycling"
   
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activity[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activity.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activity1 = activity[row]
    }

    

    
    @IBOutlet weak var weightTF: UITextField!
    
    
    @IBOutlet weak var ExerciseTF: UITextField!
    
    
    @IBOutlet weak var EnergyConsumedLB: UILabel!
    
    @IBOutlet weak var TimeTOLose: UILabel!

    
    @IBAction func calculat(_ sender: Any) {
        
        let weight = Double(weightTF.text!)
        let excercise = Double(ExerciseTF.text!)
        
        if weight == nil || excercise == nil || activity1 == nil{
            
        }else{
            let energyConsumed = ExerciseCoach.energyConsumed(during: activity1!, weight: weight!, time: Int(excercise!))
            let timeToLose1Pound = ExerciseCoach.timeToLose1Pound(during:activity1!,weight:weight!)
            EnergyConsumedLB.text = "\(energyConsumed) cal"
            TimeTOLose.text = "\(timeToLose1Pound) minutes"
        
        
    }
}
    
    @IBAction func clear(_ sender: Any) {
        weightTF.text = ""
        ExerciseTF.text = ""
        activity1 = "Bicycling"
        EnergyConsumedLB.text = "0 cal"
        TimeTOLose.text = "0 minutes"
        pickerView.selectRow(0, inComponent: 0, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
}
