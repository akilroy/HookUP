//
//  SettingsTextFieldCell.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 5/8/21.
//

import UIKit

class SettingsTextFieldCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SettingsTextFieldCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if let text = textField.text,
           !text.isEmpty {
            // save that
            AppManager.shared.clockTimeString = textField.text
            DispatchQueue.main.async {
                AppManager.shared.barView.timeLabel.text = AppManager.shared.clockTimeString
            }
        }
        return true
    }
}
