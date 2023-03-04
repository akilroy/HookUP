//
//  SettingsSwitchCell.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 5/8/21.
//

import UIKit

class SettingsSwitchCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var theSwitch: UISwitch!
    var indexTag: Int?
    weak var delegate: SettingsViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        guard let theSwitch = sender as? UISwitch else {
            return
        }
        delegate?.stateChanged(switchState: theSwitch)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
