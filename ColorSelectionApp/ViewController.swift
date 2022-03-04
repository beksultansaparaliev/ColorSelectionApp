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
        setupColorsForSliderTracks()
    }

    @IBAction func adjustTheRedShade() {
        redIndicatorLabel.text = String(format:"%.2f", redSlider.value)
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    @IBAction func adjustTheGreenShade() {
        greenIndicatorLabel.text = String(format:"%.2f", greenSlider.value)
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    @IBAction func adjustTheBlueShade() {
        blueIndicatorLabel.text = String(format:"%.2f", blueSlider.value)
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setupColorsForSliderTracks() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
}
