//
//  extensions.swift
//  SwiftUIKit(Switch)
//
//  Created by Эдуард Потоки on 07.09.2021.
//

import Foundation
import UIKit
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
           )
   }
}
extension UITextField {
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(named: "eye"), for: .normal)
        }else{
            button.setImage(UIImage(named: "closeEye"), for: .normal)

        }
    }
}

class PasswordTextField: UITextField {

    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }

    override func becomeFirstResponder() -> Bool {
        
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            insertText("\(text)+")
            deleteBackward()
        }
        return success
        
    }

}
