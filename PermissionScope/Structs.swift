//
//  Structs.swift
//  PermissionScope
//
//  Created by Nick O'Neill on 8/21/15.
//  Copyright © 2015 That Thing in Swift. All rights reserved.
//

import Foundation

/// Permissions currently supportes by PermissionScope
@objc public enum PermissionType: Int, CustomStringConvertible {
    case notifications, microphone, camera, photos
    
    public var prettyDescription: String {
        return "\(self)"
    }
    
    public var selector: Selector {
        switch self {
        case .notifications:    return #selector(PermissionScope.requestNotifications)
        case .microphone:       return #selector(PermissionScope.requestMicrophone)
        case .camera:           return #selector(PermissionScope.requestCamera)
        case .photos:           return #selector(PermissionScope.requestPhotos)
        }
    }
    
    public var description: String {
        switch self {
        case .notifications:    return "Notifications".localized
        case .microphone:       return "Microphone".localized
        case .camera:           return "Camera".localized
        case .photos:           return "Photos".localized
        }
    }
    
    static let allValues = [notifications, microphone, camera, photos]
}

/// Possible statuses for a permission.
@objc public enum PermissionStatus: Int, CustomStringConvertible {
    case authorized, unauthorized, unknown, disabled
    
    public var description: String {
        switch self {
        case .authorized:   return "Authorized".localized
        case .unauthorized: return "Unauthorized".localized
        case .unknown:      return "Unknown".localized
        case .disabled:     return "Disabled".localized // System-level
        }
    }
}

/// Result for a permission status request.
@objc public class PermissionResult: NSObject {
    @objc public let type: PermissionType
    @objc public let status: PermissionStatus
    
    internal init(type:PermissionType, status:PermissionStatus) {
        self.type   = type
        self.status = status
    }
    
    override public var description: String {
        return "\(type) \(status)"
    }
}
