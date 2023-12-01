//
//  AlertManager.swift
//  CollaborationTeamOne
//
//  Created by Davit Natenadze on 01.12.23.
//

import UIKit

class AlertManager {
    
    static func showAlert(title: String, message: String, controller: UIViewController, completion: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alertController.addAction(okAction)
        controller.present(alertController, animated: true, completion: nil)
    }
    
}
