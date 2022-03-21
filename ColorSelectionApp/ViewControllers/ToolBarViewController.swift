//
//  ThirdViewController.swift
//  ColorSelectionApp
//
//  Created by Masaie on 20/3/22.
//

import UIKit

class ToolBarViewController: UIViewController {
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToolbar()
    }
    
    @objc private func tapDone() {
        view.endEditing(true)
    }
    
    private func setToolbar() {
        firstTextField.addInputAccessoryView(
            title: "Done",
            target: self,
            selector: #selector(tapDone)
        )
        secondTextField.addInputAccessoryView(
            title: "Done",
            target: self,
            selector: #selector(tapDone)
        )
    }
}

//MARK: - Set Toolbar
extension UITextField {
    func addInputAccessoryView(title: String, target: Any, selector: Selector) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
//        Toolbar custom size
//        let toolbar = UIToolbar(frame: CGRect(x: 0.0,
//                                              y: 0.0,
//                                              width: UIScreen.main.bounds.size.width,
//                                              height: 44.0
//                                             )
//        )
        let flexible = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let toolbarItem = UIBarButtonItem(
            title: title,
            style: .plain,
            target: target,
            action: selector
        )
        toolbar.setItems([flexible,toolbarItem], animated: false)
        inputAccessoryView = toolbar
    }
}
