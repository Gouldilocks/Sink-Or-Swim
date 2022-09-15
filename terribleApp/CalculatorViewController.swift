//
//  CalculatorViewController.swift
//  terribleApp
//
//  Created by Christian Gould on 9/15/22.
//

import UIKit

class CalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueOfSlider: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var switchy: UISwitch!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var answer: UILabel!
    var isNegative: Float!
    var pickerData = ["Multiply", "Divide", "Subtract", "Add"]
    var currentOperand = "Multiply"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer.text = "Answer: 100"
        switchy.isOn = false
        isNegative = 1
        stepper.maximumValue = 300
        stepper.minimumValue = 0
        stepper.value = 100
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.value = 10
        // Do any additional setup after loading the view.
        valueOfSlider.text = String(format: "%.01f", slider.value)
        
        stepperLabel.text = String(format: "%.01f", stepper.value)
        
        self.picker.delegate = self
        self.picker.dataSource = self
    }
    @IBAction func sliderAction(_ sender: Any) {
        valueOfSlider.text = String(format: "%.01f", slider.value * isNegative)
        updateCalculation()
    }
    
    
    @IBAction func stepperChanged(_ sender: Any) {
        stepperLabel.text = String(format: "%.01f", stepper.value)
        slider.maximumValue = Float(stepper.value)
    }
    
    @IBAction func flipSwitch(_ sender: Any) {
        isNegative = isNegative * -1
        valueOfSlider.text = String(format: "%.01f", slider.value * isNegative)
        updateCalculation()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        self.currentOperand = pickerData[row]
        updateCalculation()

    }
    
    func updateCalculation(){
        if(self.currentOperand == "Multiply"){
            answer.text = (String(format: "%.01f", (slider.value * isNegative * slider.value * isNegative)))
        }
        else if(self.currentOperand == "Divide"){
            answer.text = String(format: "%.01f", (slider.value * isNegative / slider.value * isNegative))
        }
        else if(self.currentOperand == "Add"){
            answer.text = String(format: "%.01f", (slider.value * isNegative + slider.value * isNegative))
        }
        else if(self.currentOperand == "Subtract"){
            answer.text = String(format: "%.01f", (slider.value * isNegative - slider.value * isNegative))
        }
    }
}

