//
//  AlertHelper.swift
//  CleanCode
//
//  Created by Jose Martins on 22/03/21.
//

import UIKit
import RKDropdownAlert

class AlertHelper {
    static func showAlert(message: String, type: MessageType) {
        var backgroundColor: UIColor?
        var textColor: UIColor?
        
        switch type {
        
            case .success:
                backgroundColor = UIColor(red: 0.44, green: 0.76, blue: 0.38, alpha: 1.00)
                textColor = UIColor(red:0.94, green:0.95, blue:0.96, alpha:1.0)
                break
            
            case .warning:
                backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.00, alpha: 1.00)
                textColor = UIColor(red:0.36, green:0.14, blue:0.08, alpha:1.0)
                break
            
            case .error:
                backgroundColor = UIColor(red: 0.80, green: 0.34, blue: 0.34, alpha: 1.00)
                textColor = UIColor(red:0.94, green:0.95, blue:0.96, alpha:1.0)
                break
        }
        
        RKDropdownAlert.title("" , message: message, backgroundColor: backgroundColor, textColor: textColor)
    }
}
