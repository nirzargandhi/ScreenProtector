//
//  Common.swift
//  ScreenProtectorDemo
//
//  Created by Nirzar Gandhi on 12/03/25.
//

import Foundation
import UIKit

// MARK: - UI / Device Related Functions
func GetStoryBoard(identifier: String, storyBoardName: String) -> UIViewController {
    return UIStoryboard(name: storyBoardName, bundle: nil).instantiateViewController(withIdentifier: identifier)
}

func getBottomSafeAreaHeight() -> CGFloat {
    return (UIDevice.current.hasNotch == true) ? (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0) : 0
}
