//
//  AlertViewHelper.swift
//  iDeliver
//
//  Created by Hakan Tekir on 31.03.2023.
//

import Foundation
import UIKit


class AlertViewHelper {
    static func showAlert(title: String = "Error", message: String, style: UIAlertController.Style = .alert) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let close = UIAlertAction(title: "Close", style: .cancel, handler: nil)
        alert.addAction(close)
        return alert
    }
}
