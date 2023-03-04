//
//  SettingsViewController.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 5/8/21.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var titles: [String] = ["Automatic Splash Screen", "Splash Screen delay:", "Clock time"/*, "Highlight missing people"*/]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        
        
        
    }

    // MARK: - Actions
    
    @IBAction func closeButtonTapped() {
        self.dismiss(animated: true) {
            // reload things here
        }
    }
    
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsSwitchCell") as? SettingsSwitchCell {
                cell.theSwitch.tag = 100
                cell.delegate = self
                cell.label?.text = titles[indexPath.row]
                cell.theSwitch.isOn = AppManager.shared.automaticallyLaunchBackIntoAppFromSplash
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsSliderCell") as? SettingsSliderCell {
                let currentDelay = (AppManager.shared.splashPause * 100).rounded() / 100
                cell.label?.text = "Splash Screen delay: \(currentDelay)s"
                cell.slider.value = Float(AppManager.shared.splashPause)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTextFieldCell") as? SettingsTextFieldCell {
                
                if AppManager.shared.clockTimeString != nil {
                    cell.textField?.text = AppManager.shared.clockTimeString
                }
                cell.label?.text = titles[indexPath.row]
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsSwitchCell") as? SettingsSwitchCell {
                cell.theSwitch.tag = 101
                cell.delegate = self
                cell.label?.text = titles[indexPath.row]
                cell.theSwitch.isOn = AppManager.shared.highlightMissingPeople
                return cell
            }
        default:()
            let cell = UITableViewCell()
            cell.textLabel?.text = "Row \(indexPath.row)"
            return cell
        }
        
        let cell = UITableViewCell()
        return cell
    }
    
    @IBAction func stateChanged(switchState: UISwitch) {
        
        switch switchState.tag {
        case 100:
            AppManager.shared.automaticallyLaunchBackIntoAppFromSplash = switchState.isOn
        case 101:
            AppManager.shared.highlightMissingPeople = switchState.isOn
        default:()
        }
    }
}
