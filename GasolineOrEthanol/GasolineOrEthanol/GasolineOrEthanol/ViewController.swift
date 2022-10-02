//
//  ViewController.swift
//  GasolineOrEthanol
//
//  Created by Anderson Sales on 25/09/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var gasolineNameLabel: UILabel!
    @IBOutlet weak var gasolinePriceTextField: UITextField!
    @IBOutlet weak var ethanolNameLabel: UILabel!
    @IBOutlet weak var ethanolPriceTextField: UITextField!
    @IBOutlet weak var calculationButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var analysisResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel()
        configTextField()
        configButton()
        configBackground()
    }
    
    @IBAction func calculateBestOption(_ sender: Any) {
        if checkFieldValueAreNotEmpty() && checkInputAreNumbers() {
            let gasolinePrice = Double(gasolinePriceTextField.text ?? "0") ?? 0
            let ethanolPrice = Double(ethanolPriceTextField.text ?? "0") ?? 0
            if  gasolinePrice * 0.70 <= ethanolPrice {
                analysisResultLabel.text = "With the litter of gasoline at R$\(String(format:"%.2f",gasolinePrice)) and the ethanol at R$\(String(format:"%.2f",ethanolPrice)), you'd better go with Gasoline!"
                view.backgroundColor = .yellow
            } else {
                analysisResultLabel.text = "With the litter of gasoline at R$\(String(format:"%.2f",gasolinePrice)) and the ethanol at R$\(String(format:"%.2f",ethanolPrice)), you'd better go with Ethanol!"
                view.backgroundColor = .green
            }
        } else {
            analysisResultLabel.text = "Please check your input data. Make sure both prices are numbers in a valid format!"
            view.backgroundColor = .red
        }
    }
    
    func configBackground(){
        view.backgroundColor = .cyan
    }
    
    func configLabel(){
        appNameLabel.text = "Gasoline or Ethanol?"
        gasolineNameLabel.text = "Gasoline"
        ethanolNameLabel.text = "Ethanol"
        resultLabel.text = "Analysis Result"
        analysisResultLabel.text = "Gasoline and Ethanol prices will be compared and the best fuel option will apper here..."
        analysisResultLabel.numberOfLines = 0
    }
    
    func configTextField(){
        gasolinePriceTextField.placeholder = "Gasoline price..."
        ethanolPriceTextField.placeholder = "Ethanol price..."
        gasolinePriceTextField.delegate = self
        ethanolPriceTextField.delegate = self
    }
    
    func configButton(){
        calculationButton.setTitle("Calculate", for: .normal)
        calculationButton.backgroundColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 0.5)
        calculationButton.isEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = CGColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1)
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true || textField.text?.hasPrefix(" ") ?? true {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = CGColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        }else{
            textField.layer.borderWidth = 1
            textField.layer.borderColor = CGColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        }
        
        if checkFieldValueAreNotEmpty(){
            calculationButton.isEnabled = true
            calculationButton.backgroundColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1)
            calculationButton.tintColor = .white
        } else {
            calculationButton.isEnabled = false
            calculationButton.backgroundColor = UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 0.5)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func checkFieldValueAreNotEmpty() -> Bool {
        return !(gasolinePriceTextField.text?.isEmpty ?? false) && !(gasolinePriceTextField.text?.hasPrefix(" ") ?? false) && !(ethanolPriceTextField.text?.isEmpty ?? false) && !(ethanolPriceTextField.text?.hasPrefix(" ") ?? false)
    }
    
    func checkInputAreNumbers() -> Bool {
        if Double(gasolinePriceTextField.text ?? "Nah") != nil && Double(ethanolPriceTextField.text ?? "Nah") != nil{
            return true
        }
        return false
    }
    
}

