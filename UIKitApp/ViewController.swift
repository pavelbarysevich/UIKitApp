//
//  ViewController.swift
//  UIKitApp
//
//  Created by Павел Борисевич on 3/15/20.
//  Copyright © 2020 Павел Борисевич. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    @IBOutlet var offOnSwitch: UISwitch!
    @IBOutlet var LabeSwitch: UITextField!
    
    @IBOutlet var dataPicer: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setub mail Label
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Setup Segmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Setuo slider
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .blue
        slider.thumbTintColor = .white
        
        mainLabel.text = String(slider.value)
        
        // Setup Date Picer
        dataPicer.locale = Locale(identifier: "ru-Ru")
        
        offOnSwitch.onTintColor = .red
        LabeSwitch.text = "Скрыть все элементы"
        
    }

    @IBAction func actionSegmentControl(){
           
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .brown
        default:
            break
        }
        
    }
   
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        
    }
    
    @IBAction func actionButton() {
        
        guard let imputText = textField.text, !imputText.isEmpty else { return }
        
        if let _ = Double(imputText){
            showAlert(tite: "Wrong format", message: "Please enter your name")
            print("Wrong format")
        } else{
            mainLabel.text = imputText
            textField.text = nil
            
        }
        
    }
    
    @IBAction func actionDataPicer() {
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .medium
        dataFormatter.locale = Locale(identifier: "ru-Ru")
        
        
        let dateValue = dataFormatter.string(from: dataPicer.date)
        mainLabel.text = dateValue
    }
    @IBAction func actionSwitch() {
        
        segmentedControl.isHidden.toggle()
        mainLabel.isHidden.toggle()
        slider.isHidden.toggle()
        textField.isHidden.toggle()
        button.isHidden.toggle()
        dataPicer.isHidden.toggle()
        
        LabeSwitch.text = offOnSwitch.isOn ? "Скрыть все элементы" : "Отоброзить все элементы"
        
        
    }
    
    @IBAction func Tap(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
        
    }
    
}


extension ViewController {
    private func showAlert(tite: String, message: String){
        
        let alert = UIAlertController(title: tite, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.textField.text = ""})
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

