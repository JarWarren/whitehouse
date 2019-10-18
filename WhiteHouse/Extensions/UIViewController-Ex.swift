//
//  ViewController-Ex.swift
//  WhiteHouse
//
//  Created by Jared Warren on 10/16/19.
//  Copyright © 2019 Warren. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alertForError(_ error: Error) {
        let alertVC = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
