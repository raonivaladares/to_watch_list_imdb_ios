

import Foundation
import UIKit

class HelperAlert {
    
    struct Static {
        static let instance = HelperAlert()
    }
    
    class var sharedInstance: HelperAlert {
        return Static.instance
    }
    
    func message(viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Atention", message: "\(message)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "ok", style: .Default) { _ in })
        viewController.presentViewController(alert, animated: true){}
    }

}
