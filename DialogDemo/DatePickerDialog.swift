//
//  DatePickerDialog.swift
//  DialogDemo
//
//  Created by Bharat Jagtap on 30/06/16.
//  Copyright © 2016 Bitcode Technologies. All rights reserved.
//

import UIKit

class DatePickerDialog: BCDialogView {

    @IBOutlet weak var buttonUse: UIButton!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    static func dialog() -> DatePickerDialog? {
        
        let viewArr =  NSBundle.mainBundle().loadNibNamed("DatePickerDialog", owner: self, options: nil) as! [DatePickerDialog]
        if viewArr.count <= 0 {
            return nil
        }
        else {
            return viewArr[0]
        }
    }

        

    
}
