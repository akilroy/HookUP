//
//  fakeStatusBarView.swift
//  HOOK UP
//
//  Created by Andrew Kilroy on 5/8/21.
//

import UIKit

class fakeStatusBarView: UIView {

    @IBOutlet weak var batteryImage: UIImageView!
    @IBOutlet weak var signalImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet var barView: UIView!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("FakeStatusBar", owner: self, options: nil)
        addSubview(barView)
        barView.frame = self.bounds
        barView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
}
