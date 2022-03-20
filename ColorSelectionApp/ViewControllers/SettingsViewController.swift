//
//  SettingsViewController.swift
//  ColorSelectionApp
//
//  Created by Masaie on 4/3/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet var toolbar: UIToolbar!
    
    var color: UIColor!
    var delegate: SettingVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setColorAfterSegue()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func toolbarItem(_ sender: UIBarButtonItem) {
        view.endEditing(true)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setColor(color: colorView.backgroundColor ?? .black)
        dismiss(animated: true)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValueForLabel (from labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider)
            case greenLabel:
                greenLabel.text = string(from: greenSlider)
            default:
                blueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValueForTF (from textFields: UITextField...) {
        textFields.forEach {textField in
            switch textField {
            case redTextField:
                redTextField.text = string(from: redSlider)
            case greenTextField:
                greenTextField.text = string(from: greenSlider)
            default:
                blueTextField.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format:"%.2f", slider.value)
    }
    
    private func setColorAfterSegue() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        setColor()
        setValueForLabel(from: redLabel, greenLabel, blueLabel)
        setValueForTF(from: redTextField, greenTextField, blueTextField)
    }
}

//MARK: - TextFieldDelegate Methods
extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = toolbar
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else {
            showAlert(for: textField)
            return
        }
        
        if textField == redTextField {
            redSlider.setValue(Float(numberValue), animated: true)
            redLabel.text = string(from: redSlider)
        } else if textField == greenTextField {
            greenSlider.setValue(Float(numberValue), animated: true)
            greenLabel.text = string(from: greenSlider)
        } else {
            blueSlider.setValue(Float(numberValue), animated: true)
            blueLabel.text = string(from: blueSlider)
        }
        
        setColor()
    }
}

//MARK: - Set Alert Controller Method
extension SettingsViewController {
    private func showAlert(for textField: UITextField) {
        let alert = UIAlertController(title: "Ошибка", message: "Введите числовое значение", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
