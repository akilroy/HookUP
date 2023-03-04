//
//  L2ViewController.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 4/10/21.
//

import UIKit

class L2ViewController: UIViewController {
    
    var unUsedButtons = [UIButton]()
    
    @IBOutlet var pButt1: UIButton!
    @IBOutlet var pButt2: UIButton!
    @IBOutlet var pButt3: UIButton!
    @IBOutlet var pButt4: UIButton!
    @IBOutlet var pButt5: UIButton!
    @IBOutlet var pButt6: UIButton!
    @IBOutlet var pButt7: UIButton!
    @IBOutlet var pButt8: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        unUsedButtons = [pButt4, pButt5, pButt6, pButt8]

        
        pButt1.layer.cornerRadius = 3.0
        pButt2.layer.cornerRadius = 3.0
        pButt3.layer.cornerRadius = 3.0
        pButt4.layer.cornerRadius = 3.0
        pButt5.layer.cornerRadius = 3.0
        pButt6.layer.cornerRadius = 3.0
        pButt7.layer.cornerRadius = 3.0
        pButt8.layer.cornerRadius = 3.0
        
        pButt1.clipsToBounds = true
        pButt2.clipsToBounds = true
        pButt3.clipsToBounds = true
        pButt4.clipsToBounds = true
        pButt5.clipsToBounds = true
        pButt6.clipsToBounds = true
        pButt7.clipsToBounds = true
        pButt8.clipsToBounds = true
        
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func callOutUnusedButtons() {
        
        for button in unUsedButtons {
            
            let currentAlpha = (button.alpha * 100).rounded() / 100
            print("alpha 1: \(currentAlpha)")
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear) {
                // animation things
                button.backgroundColor = UIColor(cgColor: .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.35))
            } completion: { (completion) in
                let currentAlpha = (button.alpha * 100).rounded() / 100
                print("alpha 2: \(currentAlpha)")
                UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveLinear) {
                    // animation things
                    button.backgroundColor = UIColor(cgColor: .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0))
                }  completion: { (completion) in
                    // completion things
                    let currentAlpha = (button.alpha * 100).rounded() / 100
                    print("alpha 3: \(currentAlpha)")
                }
            }
        }
    }
    
    func darkenButton(sender: UIButton) {
        let currentAlpha: CGFloat = sender.alpha
        print("alpha 3: \(currentAlpha)")
        UIView.animate(withDuration: 0.5, delay: 3.0, options: .curveLinear) {
            // animation things
            sender.alpha = currentAlpha == 0.35 ? 0.75 : 0.35
        }  completion: { (completion) in
            // completion things
            let currentAlpha: CGFloat = sender.alpha
            print("alpha 4: \(currentAlpha)")
        }
    }
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        guard let asender = sender as? UIButton,
              asender.tag != 0 else {
            return
        }
        
        // they tapped one they shouldn't have. Punish them.
        if unUsedButtons.contains(asender) {
            if AppManager.shared.highlightMissingPeople {
                callOutUnusedButtons()
            }
            return
        }

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let profileVC = mainStoryboard.instantiateViewController(withIdentifier: "profileResultsViewC") as? L3ViewController {
            profileVC.tagOfProfileButton = asender.tag
    //        settingsVC.modalPresentationStyle = .fullScreen
    //        settingsVC.modalTransitionStyle = .coverVertical
    //        self.present(settingsVC, animated: true) {
    //            self.performSegue(withIdentifier: "startingUpTheApp", sender: nil)
    //        }
            navigationController?.pushViewController(profileVC, animated: true)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    //
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        if gestureRecognizer.isEqual(navigationController?.interactivePopGestureRecognizer) {
//            navigationController?.popViewController(animated: true)
//        }
//        return false
//    }
}
