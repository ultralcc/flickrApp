//
//  UIViewControllerDismissKeyboard+Ext.swift
//  LanFar
//
//  Created by Ignacio on 2019/7/22.
//  Copyright © 2019 Great & Best Tech. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func showAlert(title: String, message: String, needCancel: Bool = false, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okAction)
        if needCancel{
            alertController.addAction(cancelAction)
        }
        present(alertController, animated: true, completion: nil)
    }
    
}
