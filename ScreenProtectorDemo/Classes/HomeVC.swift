//
//  HomeVC.swift
//  ScreenProtectorDemo
//
//  Created by Nirzar Gandhi on 12/03/25.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var sensitiveContainer: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sampleBtn: UIButton!
    
    @IBOutlet weak var screenshotOverlay: UIView!
    @IBOutlet weak var screenshotSubOverlay: UIView!
    @IBOutlet weak var warningIcon: UIImageView!
    @IBOutlet weak var screenshotOverlayLabel: UILabel!
    
    @IBOutlet weak var sampleBtnBottom: NSLayoutConstraint!
    
    
    // MARK: - Properties
    var screenshotBlockerWindow: UIWindow?
    
    
    // MARK: -
    // MARK: - View init Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        self.setControlsProperty()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ScreenProtector.shared.protect(view: self.view, container: self.screenshotOverlay, isSecure: false)
        ScreenProtector.shared.protect(view: self.view, container: self.sensitiveContainer, isSecure: true)
        ScreenProtector.shared.protectFromScreenRecording()
        ScreenProtector.shared.isScreenProtected = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        ScreenProtector.shared.isScreenProtected = false
        ScreenProtector.shared.showHideContent(isHide: true)
        
        ScreenProtector.shared.recordingObservation?.invalidate()
        ScreenProtector.shared.recordingObservation = nil
    }
    
    fileprivate func setControlsProperty() {
        
        self.view.backgroundColor = .clear
        self.view.isOpaque = false
        
        // Sensitive Container
        self.sensitiveContainer.backgroundColor = .clear
        
        // Top View
        self.topView.backgroundColor = .black
        
        // Description Label
        self.descriptionLabel.backgroundColor = .clear
        self.descriptionLabel.textColor = .black
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.lineBreakMode = .byWordWrapping
        self.descriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
        
        // Sample Buttton
        self.sampleBtn.backgroundColor = .black
        self.sampleBtn.titleLabel?.backgroundColor = .black
        self.sampleBtn.setTitleColor(.white, for: .normal)
        self.sampleBtn.setTitle("Start Call", for: .normal)
        
        self.sampleBtnBottom.constant = UIDevice.current.hasNotch ? getBottomSafeAreaHeight() : 20
        
        // Screenshot Overlay
        self.screenshotOverlay.backgroundColor = .black
        self.screenshotOverlay.isHidden = true
        
        // Screenshot Sub Overlay
        self.screenshotSubOverlay.backgroundColor = .clear
        
        // Warning Icon
        self.warningIcon.backgroundColor = .clear
        self.warningIcon.image = UIImage(named: "WarningIcon")
        self.warningIcon.contentMode = .scaleAspectFit
        
        // Screenshot Overlay Label
        self.screenshotOverlayLabel.backgroundColor = .clear
        self.screenshotOverlayLabel.textColor = .white
        self.screenshotOverlayLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.screenshotOverlayLabel.numberOfLines = 0
        self.screenshotOverlayLabel.lineBreakMode = .byWordWrapping
        self.screenshotOverlayLabel.textAlignment = .center
        self.screenshotOverlayLabel.text = "Due to privacy reason screenshot is blocked"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.screenshotOverlay.isHidden = false
        }
    }
}
