//
//  AppManager.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 5/7/21.
//

import Foundation
import UIKit

class AppManager {
    
    static let shared = AppManager()
    
    var barView : fakeStatusBarView!// = fakeStatusBarView(frame: CGRect(x: 0.0, y: 0.0, width: 414, height: 35.0))
    
    var hasBeenSetup: Bool {
        get {
            let defaults = UserDefaults.standard
            let autoIn = defaults.bool(forKey: "hasBeenSetup")
            return autoIn
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "hasBeenSetup")
        }
    }
    
    var clockTimeString : String? {
        get {
            let defaults = UserDefaults.standard
            if let user = defaults.string(forKey: "clockTimeString") {
                return user
            }
            return nil
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "clockTimeString")
        }
    }
    
    var splashPause: Float {
        get {
            let defaults = UserDefaults.standard
            let useTouchID = defaults.float(forKey: "splashPause")
            return Float(useTouchID)
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "splashPause")
        }
    }
    
    var automaticallyLaunchBackIntoAppFromSplash: Bool {
        get {
            let defaults = UserDefaults.standard
            let autoIn = defaults.bool(forKey: "automaticallyLaunchBackIntoAppFromSplash")
            return autoIn
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "automaticallyLaunchBackIntoAppFromSplash")
        }
    }
    
    var highlightMissingPeople: Bool {
        get {
            let defaults = UserDefaults.standard
            let autoIn = defaults.bool(forKey: "highlightMissingPeople")
            return autoIn
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "highlightMissingPeople")
        }
    }
    
    func setStandardSettings() {
        let defaults = UserDefaults.standard
        if UserDefaults.standard.object(forKey: "automaticallyLaunchBackIntoAppFromSplash") == nil {
            self.automaticallyLaunchBackIntoAppFromSplash = true
        }
        if UserDefaults.standard.object(forKey: "hasBeenSetup") == nil {
            self.hasBeenSetup = true
        }
        if UserDefaults.standard.object(forKey: "splashPause") == nil {
            self.splashPause = 0.75
        }
        if UserDefaults.standard.object(forKey: "clockTimeString") == nil {
            self.clockTimeString = "8:26"
        }
        if UserDefaults.standard.object(forKey: "highlightMissingPeople") == nil {
            self.hasBeenSetup = false
        }
    }
}
