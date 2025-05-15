//
//  ScreenProtectorManager.swift
//  ScreenProtectorDemo
//
//  Created by Nirzar Gandhi on 11/03/25.
//

import Foundation
import UIKit

public class ScreenProtector {
    
    // MARK: - Properties
    public static let shared = ScreenProtector()
    
    fileprivate lazy var hiddenView = UIView()
    public var recordingObservation: NSKeyValueObservation?
    
    private var blockingScreenMessage: String = "Screen recording not allowed"
    
    public var isScreenProtected: Bool = false {
        didSet {
            (self.isScreenProtected && self.isRecordingCaptured) ? self.showHideContent(isHide: true) : self.showHideContent(isHide: false)
        }
    }
    
    fileprivate var isRecordingCaptured: Bool = false {
        didSet {
            (self.isScreenProtected && self.isRecordingCaptured) ? self.showHideContent(isHide: true) : self.showHideContent(isHide: false)
        }
    }
}


// MARK: - Call Back
extension ScreenProtector {
    
    public func protect(window: UIWindow, container: UIView, isSecure: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            //window.setScreenCaptureProtection(containerView: container, isSecure: isSecure)
        })
    }
    
    public func protect(view: UIView, container: UIView, isSecure: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.setScreenCaptureProtection(view: view, containerView: container, isSecure: isSecure)
        })
    }
    
    public func protectFromScreenRecording(_ blockingScreenMessage: String? = nil) {
        
        self.isRecordingCaptured = UIScreen.main.isCaptured
        
        self.recordingObservation =  UIScreen.main.observe(\UIScreen.isCaptured, options: [.new]) { [weak self] screen, change in
            
            if let errMessage = blockingScreenMessage {
                self?.blockingScreenMessage = errMessage
            }
            
            let isRecording = change.newValue ?? false
            self?.isRecordingCaptured = isRecording
        }
    }
    
    public func setScreenCaptureProtection(view: UIView, containerView: UIView, isSecure: Bool) {
        
        let textField = UITextField()
        textField.isSecureTextEntry = isSecure
        textField.isUserInteractionEnabled = false
        
        guard let viewTF = textField.layer.sublayers?.first?.delegate as? UIView else {
            return
        }
        
        self.hiddenView = viewTF
        self.hiddenView.subviews.forEach { $0.removeFromSuperview() }
        self.hiddenView.translatesAutoresizingMaskIntoConstraints = false
        self.hiddenView.backgroundColor = .white
        
        view.addSubview(self.hiddenView)
        
        NSLayoutConstraint.activate([
            self.hiddenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.hiddenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.hiddenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.hiddenView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        self.hiddenView.addSubview(containerView)
    }
    
    public func showHideContent(isHide: Bool) {
        self.hiddenView.isHidden = isHide
    }
}
