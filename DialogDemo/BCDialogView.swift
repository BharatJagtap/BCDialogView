//
//  BCDialogView.swift
//  DialogDemo
//
//  Created by Bharat Jagtap on 30/06/16.
//  Copyright © 2016 Bitcode Technologies. All rights reserved.
//

import UIKit

enum BCDialogAnimation {
    case Zoom
    case Fade
    case SlideDown
    case SlideUp
}


class BCDialogView: UIView {

    @IBOutlet weak var contentView : UIView?
    var animation : BCDialogAnimation?
    
    func present()  {
     
        let selectedAnimation = animation ?? BCDialogAnimation.Zoom
        
        if selectedAnimation == .Fade {
            presentFade(nil)
        }else if selectedAnimation == .SlideDown {
          
          presentSlideDown(nil)
            
        }
        else if selectedAnimation == .SlideUp {
            presentSlideUp(nil)
        }
        else {
            presentZoom(nil)
        }
        
    }
    
    func present(viewController : UIViewController )  {
        
        let selectedAnimation = animation ?? BCDialogAnimation.Zoom
        
        if selectedAnimation == .Fade {
            presentFade(viewController)
        }else if selectedAnimation == .SlideDown {
            presentSlideDown(viewController)
        }
        else if selectedAnimation == .SlideUp {
            presentSlideUp(viewController)
        }
        else {
            presentZoom(viewController)
        }
        
    }
    
    func dismiss()  {
        
        dismiss(completion: {})
        
    }
    
    func dismiss(completion completion : ()->() ) {
        
        let selectedAnimation = animation ?? BCDialogAnimation.Zoom
        
        if selectedAnimation == .Fade {
            dismissFade(completion: completion)
            
        }else if selectedAnimation == .SlideDown {
            dismissSlideDown(completion: completion)
            
        }
        else if selectedAnimation == .SlideUp {
            dismissSlideUp(completion: completion)
        }
        else {
            dismissZoom(completion: completion)
        }
        
    }
    
   private func presentZoom(viewController : UIViewController? ) {
        
        
        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        let window = viewController?.view ?? UIApplication.sharedApplication().keyWindow
        self.frame = (window?.bounds)!
        self.alpha = 0.0
        window?.addSubview(self)
        self.transform = CGAffineTransformMakeScale(0.5, 0.5)
        
        UIView.animateWithDuration(0.3) {
            
            self.alpha = 1.0
            self.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
        }

    }
    
    private func dismissZoom(completion completion : ()->()) {
        
        UIView.animateWithDuration(0.3, animations: {
            
            self.transform = CGAffineTransformMakeScale(0.5, 0.5)
            self.alpha = 0.0
            
        }) { (status : Bool ) in
            
            
            completion()
            self.removeFromSuperview()
        }

    }
    
    
    
    
    private func presentFade(viewController : UIViewController? ) {
        
        
        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        let window = viewController?.view ?? UIApplication.sharedApplication().keyWindow
        self.frame = (window?.bounds)!
        self.alpha = 0.0
        window?.addSubview(self)
        
        UIView.animateWithDuration(0.3) {
            
            self.alpha = 1.0
            self.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
        }
        
    }
    
    private func dismissFade(completion completion : ()->()) {
        
        UIView.animateWithDuration(0.3, animations: {
            
            self.alpha = 0.0
            
        }) { (status : Bool ) in
            
            
            completion()
            self.removeFromSuperview()
        }
        
    }

    
    
    
    private func presentSlideDown(viewController : UIViewController? ) {
        
        
        self.backgroundColor = UIColor.clearColor()
        let window = viewController?.view ?? UIApplication.sharedApplication().keyWindow
        self.frame = (window?.bounds)!
        self.alpha = 0.0
        self.center.y -= ( self.frame.height / 2.0 )
        
        window?.addSubview(self)
        
        UIView.animateWithDuration(0.3) {
            
            self.alpha = 1.0
            self.center = (window?.center)!
            
        }
        
    }
    
    private func dismissSlideDown(completion completion : ()->()) {
        
        UIView.animateWithDuration(0.3, animations: {
            self.center.y -= ( self.frame.height / 2.0 )
            self.alpha = 0.0
            
        }) { (status : Bool ) in
            
            
            completion()
            self.removeFromSuperview()
        }
        
    }

    
    
    private func presentSlideUp(viewController : UIViewController? ) {
        
        
        self.backgroundColor = UIColor.clearColor()
        let window = viewController?.view ?? UIApplication.sharedApplication().keyWindow
        self.frame = (window?.bounds)!
        self.alpha = 0.0
        self.center.y += ( self.frame.height / 2.0 )
        
        window?.addSubview(self)
        
        UIView.animateWithDuration(0.3) {
            
            self.alpha = 1.0
            self.center = (window?.center)!
            
        }
        
    }
    
    private func dismissSlideUp(completion completion : ()->()) {
        
        UIView.animateWithDuration(0.3, animations: {
            self.center.y += ( self.frame.height / 2.0 )
            self.alpha = 0.0
            
        }) { (status : Bool ) in
            
            
            completion()
            self.removeFromSuperview()
        }
        
    }

    
    static func create <T : AnyObject >() -> T? {
        
        let fullName = NSStringFromClass(T.self)
        let range = fullName.rangeOfString(".", options: .BackwardsSearch)
        var nibName : String?
        
        if let range = range {
            nibName =  fullName.substringFromIndex(range.endIndex)
        } else {
            return nil ;
        }
        
        if let nibName = nibName {
            
            let viewArr =  NSBundle.mainBundle().loadNibNamed(nibName, owner: self, options: nil) as! [T]
            if viewArr.count <= 0 {
                return nil
            }
            else {
                return viewArr[0]
            }
        }
        
    }

    
    
    

}
