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
        } else if selectedAnimation == .SlideDown {
          presentSlideDown(nil)
        }
        else if selectedAnimation == .SlideUp {
            presentSlideUp(nil)
        }
        else {
            presentZoom(nil)
        }
        
    }
    
    func present(_ viewController : UIViewController )  {
        
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
    

    func dismiss(_ completion : @escaping ()->() = { } ) {
        
        let selectedAnimation = animation ?? BCDialogAnimation.Zoom
        
        if selectedAnimation == .Fade {
            dismissFade(completion: completion)
            
        }else if selectedAnimation == .SlideDown {
            dismissSlideDown(completion)
            
        }
        else if selectedAnimation == .SlideUp {
            dismissSlideUp(completion: completion)
        }
        else {
            dismissZoom(completion: completion)
        }
        
    }
    
   private func presentZoom(_ viewController : UIViewController? ) {
        
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        let window = viewController?.view ?? UIApplication.shared.keyWindow
        self.frame = (window?.bounds)!
        self.alpha = 0.0
        window?.addSubview(self)
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
    UIView.animate(withDuration: 0.3) {
            
            self.alpha = 1.0
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        }

    }
    
    private func dismissZoom(completion : @escaping ()->()) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform(scaleX: 0.5, y : 0.5)
            self.alpha = 0.0

        }) { (status) in
            completion()
            self.removeFromSuperview()
        }
    }
    
    private func presentFade(_ viewController : UIViewController? ) {
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        let window = viewController?.view ?? UIApplication.shared.keyWindow
        self.frame = (window?.bounds)!
        self.alpha = 0.0
        window?.addSubview(self)
        
        UIView.animate( withDuration :0.3) {
            
            self.alpha = 1.0
            self.transform = CGAffineTransform(scaleX: 1.0,y: 1.0)
        }
    }
    
    private func dismissFade( completion : @escaping ()->()) {
        
        UIView.animate(withDuration : 0.3, animations: {
            self.alpha = 0.0
        }) { (status : Bool ) in
            completion()
            self.removeFromSuperview()
        }
        
    }

    private func presentSlideDown(_ viewController : UIViewController? ) {
        
        self.backgroundColor = UIColor.clear
        let window = viewController?.view ?? UIApplication.shared.keyWindow
        self.frame = (window?.bounds)!
        self.alpha = 0.0
        self.center.y -= ( self.frame.height / 2.0 )
        
        window?.addSubview(self)
        
        UIView.animate(withDuration : 0.3) {
            
            self.alpha = 1.0
            self.center = (window?.center)!
            
        }
        
    }
    
    private func dismissSlideDown(_ completion : @escaping ()->() = {} ) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.center.y -= ( self.frame.height / 2.0 )
            self.alpha = 0.0
            
        }) { (status : Bool ) in
            
            completion()
            self.removeFromSuperview()
        }
        
    }

    
    
    private func presentSlideUp(_ viewController : UIViewController? ) {
        
        self.backgroundColor = UIColor.clear
        let window = viewController?.view ?? UIApplication.shared.keyWindow
        self.frame = (window?.bounds)!
        self.alpha = 0.0
        self.center.y += ( self.frame.height / 2.0 )
        
        window?.addSubview(self)
        
        UIView.animate(withDuration: 0.3) {
            
            self.alpha = 1.0
            self.center = (window?.center)!
            
        }
        
    }
    
    private func dismissSlideUp(completion : @escaping ()->()) {
        
        UIView.animate(withDuration : 0.3, animations: {
            self.center.y += ( self.frame.height / 2.0 )
            self.alpha = 0.0
            
        }) { (status : Bool ) in
            
            completion()
            self.removeFromSuperview()
        }
        
    }

    
    static func create <T : AnyObject >() -> T? {
        
        var nibName = NSStringFromClass(T.self)
        nibName = nibName.components(separatedBy: ".").last ?? ""
        let viewArr =  Bundle.main.loadNibNamed(nibName, owner: self, options: nil) as! [T]
        
        if viewArr.count <= 0 {
            return nil
        } else {
            return viewArr[0]
        }
    }

}
