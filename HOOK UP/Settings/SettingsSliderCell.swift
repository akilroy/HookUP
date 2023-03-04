//
//  SettingsSliderCell.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 5/8/21.
//

import UIKit

class SettingsSliderCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.isContinuous = true
        
        slider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        
        slider.addTarget(self, action: #selector(self.sliderDoneTouching(_:)), for: .touchUpInside)
    }

    @objc func sliderDoneTouching(_ sender:UISlider!)
    {
        AppManager.shared.splashPause = Float(sender.value)
        print("Slider step value \(Int(sender.value))")
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        let currentDelay = (sender.value * 100).rounded() / 100
        label?.text = "Splash Screen delay: \(currentDelay)s"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
