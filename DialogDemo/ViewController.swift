//
//  ViewController.swift
//  DialogDemo
//
//  Created by Bharat Jagtap on 30/06/16.
//  Copyright © 2016 Bitcode Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController , ColorPickerDialogDelegate {

    @IBOutlet weak var buttonDate: UIButton!
    var dateDialog : DatePickerDialog!
    var colorDialog : ColorPickerDialog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateDialog = DatePickerDialog.create()
        //dateDialog.buttonUse.addTarget(self, action: #selector(useDateClicked(sender:)), for: .touchUpInside)
        dateDialog.buttonUse.addTarget(self, action: #selector(useDateClicked(sender:)), for: .touchUpInside)
        dateDialog.buttonCancel.addTarget(self, action: #selector(useDateClicked(sender:)), for: .touchUpInside)
        
        
        colorDialog = ColorPickerDialog.create()
        colorDialog.animation = BCDialogAnimation.SlideUp
        colorDialog.delegate = self
        
        
        
        
    }

    @objc func useDateClicked(sender : UIButton)  {
        
        let date = dateDialog.datePicker.date
        buttonDate.setTitle(date.description, for: .normal)
        dateDialog.dismiss()

    }
    
    func canceDateClicked(sender : UIButton)  {
    
        dateDialog.dismiss()
        
    }
    
    @IBAction func pickUpClicked(sender: AnyObject) {
        dateDialog.present()    
    }
    
    
    @IBAction func pickColorClicked(sender: AnyObject) {
        
        colorDialog.present()
        
    }
    
    func colorPickerDialogDidCancel() {
        
        colorDialog.dismiss()
    }
    
    func colorPickerDialog(didSelectColor color: UIColor) {
        
        view.backgroundColor = color
        colorDialog.dismiss()
        
    }
    
    


}

