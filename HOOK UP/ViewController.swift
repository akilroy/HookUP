//
//  ViewController.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 4/10/21.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        AppManager.shared.barView = fakeStatusBarView(frame: CGRect(x: 0.0, y: 0.0, width: 414, height: 35.0))
        
//        let barView : fakeStatusBarView = fakeStatusBarView(frame: CGRect(x: 0.0, y: 0.0, width: 414, height: 35.0))
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubview(AppManager.shared.barView)
        
        if AppManager.shared.clockTimeString != nil {
            AppManager.shared.barView.timeLabel.text = AppManager.shared.clockTimeString
        }
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func secretButtonTapped(_ sender: Any) {
        
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        if let settingsVC = mainStoryboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController {
//            
//            settingsVC.modalPresentationStyle = .fullScreen
//            settingsVC.modalTransitionStyle = .coverVertical
//            self.present(settingsVC, animated: true) {
//                
//            }
//            
//        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer.isEqual(navigationController?.interactivePopGestureRecognizer) {
            navigationController?.popViewController(animated: true)
        }
        return false
    }
}

