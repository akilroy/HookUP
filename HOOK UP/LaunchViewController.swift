//
//  LaunchViewController.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 4/10/21.
//

import UIKit

class LaunchViewController: UIViewController {

    var alreadyTapped: Bool = false
    var firstRun: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // check if we want to do it autmatically
        if AppManager.shared.automaticallyLaunchBackIntoAppFromSplash {
            alreadyTapped = true

            var dTime = TimeInterval(AppManager.shared.splashPause)
            
            if firstRun {
                dTime = TimeInterval(0.0)
                firstRun = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + dTime) {
                self.performSegue(withIdentifier: "goToRoot", sender: nil)
                self.alreadyTapped = false
            }
        }
    }
    
    @IBAction func iconTapped(_ sender: Any) {
        if !alreadyTapped {
            alreadyTapped = true
            
            var dTime = TimeInterval(AppManager.shared.splashPause)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + dTime) {
                self.performSegue(withIdentifier: "goToRoot", sender: nil)
                self.alreadyTapped = false
            }
        }
    }
}
