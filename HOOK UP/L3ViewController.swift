//
//  L3ViewController.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 4/10/21.
//

import UIKit

class L3ViewController: UIViewController {
    
    @IBOutlet var profileImageView: UIImageView!
    var tagOfProfileButton: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // assigning profile based on
        if let tag = tagOfProfileButton {
            profileImageView.image = UIImage(named: "hookUpL3_\(tag)")
        }
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        
    }
 
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if gestureRecognizer.isEqual(navigationController?.interactivePopGestureRecognizer) {
//            navigationController?.popViewController(animated: true)
//        }
//        return false
//    }
}
