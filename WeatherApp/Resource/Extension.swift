//
//  Extension.swift
//  WeatherApp
//
//  Created by bùi thành công on 06/08/2022.
//

import Foundation
import UIKit
import MBProgressHUD
import ObjectMapper

extension UIViewController {
    func showLoading(text: String?){
        DispatchQueue.main.async {
            let progressHub = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHub.label.text = text ?? ""
            progressHub.contentColor = .darkGray
        }
    }
    func hiddenLoading(){
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
func cornerAndBorder(view:[UIView],corner:CGFloat,border:Bool,borderWith:CGFloat?,borderColor:CGColor?){
    for view in view {
        view.clipsToBounds = true
        view.layer.cornerRadius = corner
        if border == true {
            view.layer.borderWidth = borderWith ?? 0
            view.layer.borderColor = borderColor
        }
    }
}
