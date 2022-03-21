//
//  StartViewController.swift
//  ColorSelectionApp
//
//  Created by Masaie on 18/3/22.
//

import UIKit

protocol SettingVCDelegate {
    func setColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else { return }
        settingVC.delegate = self
        settingVC.color = view.backgroundColor
    }
}

// MARK: - ColorDelegate
extension MainViewController: SettingVCDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
