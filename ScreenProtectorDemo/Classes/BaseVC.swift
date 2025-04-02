//
//  BaseVC.swift
//  ScreenProtectorDemo
//
//  Created by Nirzar Gandhi on 12/03/25.
//

import UIKit

class BaseVC: UIViewController, UIGestureRecognizerDelegate {
    
    // MARK: - Properties
    
    
    // MARK: - View init Methods
    override func viewDidLoad() {
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        self.navBarConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        self.hideNavigationBottomShadow()
        
        APPDELEOBJ.navController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
    }
}


// MARK: - Call Back
extension BaseVC {
    
    func navBarConfig() {
        
        // Navigation Bar configuration
        if #available(iOS 13, *) {
            
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.black]
            
            appearance.backgroundColor = .clear
            appearance.shadowColor = .clear
            
            self.navigationItem.standardAppearance = appearance
            self.navigationItem.scrollEdgeAppearance = appearance
            self.navigationItem.compactAppearance = appearance
            
        } else {
            
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.black]
            UINavigationBar.appearance().tintColor = .black
            
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        }
        
        self.navigationController?.navigationBar.tintColor = .clear
        self.navigationItem.rightBarButtonItem?.tintColor = .clear
    }
}


// MARK: - Button Touch & Action
extension BaseVC {
    
    // Left Bar Buttons
    @objc func back(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }
}

