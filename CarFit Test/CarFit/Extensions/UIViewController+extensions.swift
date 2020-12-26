//
//  UIViewController+extensions.swift
//  CarFit
//
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import UIKit

extension UIViewController{
    static var spinner  = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    // Show alert with option message and title
    func showAlert(message:String? = nil ,title:String? = nil, isCancel:Bool = false, okHandler:((UIAlertAction) -> Void)? = nil){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: okHandler))
            if isCancel{
                alert.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil))
            }
            self.hideProgressIndicator()
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    /* Show Progress Indicator */
    func showProgressIndicator(){
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = false
            
            // Create and add the view to the screen.
            let progressIndicator = ProgressIndicator(text: "Loading ...")
            progressIndicator.tag = 10
            self.view.addSubview(progressIndicator)
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.view.isUserInteractionEnabled = true
                var view = self.view.viewWithTag(10)
                           view?.removeFromSuperview()
                           view = nil
            }
        }
        
        
    }
    
    /* Hide progress Indicator */
    func hideProgressIndicator(){
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = true
            var view = self.view.viewWithTag(10)
            view?.removeFromSuperview()
            view = nil
        }
    }
}
