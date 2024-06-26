//
//  Constants.swift
//  PermissionScope
//
//  Created by Nick O'Neill on 8/21/15.
//  Copyright © 2015 That Thing in Swift. All rights reserved.
//

import UIKit

enum Constants {
    struct UI {
        static let contentWidth: CGFloat                 = 280.0
        static let dialogHeightSinglePermission: CGFloat = 260.0
        static let dialogHeightTwoPermissions: CGFloat   = 360.0
        static let dialogHeightThreePermissions: CGFloat = 460.0
    }
    
    struct NSUserDefaultsKeys {
        static let requestedNotifications        = "PS_requestedNotifications"
    }
    
    struct Strings {
        static let iAmGood: String = NSLocalizedString("No, I'm good", comment: "")
        static let gotoSettings: String = NSLocalizedString("Go to Settings", comment: "")
    }
}
