//
//  ViewController.swift
//  ColorSelectionApp
//
//  Created by Masaie on 4/3/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redIndicatorLabel: UILabel!
    @IBOutlet weak var greenIndicatorLabel: UILabel!
    @IBOutlet weak var blueIndicatorLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setLabels(from: redIndicatorLabel, greenIndicatorLabel, blueIndicatorLabel)
        adjustViewsShade()
        colorView.layer.cornerRadius = 10
    }

    @IBAction func rgbSlider(_ sender: UISlider) {
        adjustViewsShade()
        switch sender {
        case redSlider:
            redIndicatorLabel.text = string(from: redSlider)
        case greenSlider:
            greenIndicatorLabel.text = string(from: greenSlider)
        default:
            blueIndicatorLabel.text = string(from: blueSlider)
        }
    }
    
    private func adjustViewsShade() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format:"%.2f", slider.value)
    }
    
    private func setLabels (from labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redIndicatorLabel:
                redIndicatorLabel.text = string(from: redSlider)
            case greenIndicatorLabel:
                greenIndicatorLabel.text = string(from: greenSlider)
            default:
                blueIndicatorLabel.text = string(from: blueSlider)
            }
        }
    }
}
