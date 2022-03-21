//
//  StartViewController.swift
//  ColorSelectionApp
//
//  Created by Masaie on 18/3/22.
//

import UIKit

protocol SettingVCDelegate {
    func setColor(color: UIColor)
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else { return }
        settingVC.color = view.backgroundColor
        settingVC.delegate = self
    }
}

//MARK: - Delegate Method for return data
extension MainViewController: SettingVCDelegate {
    
    func setColor(color: UIColor) {
        view.backgroundColor = color
    }
    
//    func setColor(color: UIColor) {
//        var red: CGFloat = 0
//        var green: CGFloat = 0
//        var blue: CGFloat = 0
//        var alpha: CGFloat = 0
//
//        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//
//        view.backgroundColor = UIColor(
//            red: CGFloat(red),
//            green: CGFloat(green),
//            blue: CGFloat(blue),
//            alpha: 1
//        )
//    }
}
