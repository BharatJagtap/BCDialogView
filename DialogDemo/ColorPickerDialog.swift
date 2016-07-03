//
//  ColorPickerDialog.swift
//  DialogDemo
//
//  Created by Bharat Jagtap on 30/06/16.
//  Copyright © 2016 Bitcode Technologies. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ColorPickerDialogDelegate {
    
    optional func colorPickerDialog(didSelectColor color : UIColor) ;
    optional func colorPickerDialogDidCancel() ;
}


class ColorPickerDialog : BCDialogView  {
    
    weak var delegate : ColorPickerDialogDelegate?
    
    @IBAction func cancelClicked(sender: AnyObject) {
    
        dismiss(completion: {

            self.delegate?.colorPickerDialogDidCancel?()

        });
        
        
    }
    
    @IBAction func colorButtonTapped(sender: UIButton) {
    
        dismiss(completion: {
        
            self.delegate?.colorPickerDialog?(didSelectColor: sender.backgroundColor!)

        })
        
    }
    
}