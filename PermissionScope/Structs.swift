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
        case .notifications:    return "Notifications"
        case .microphone:       return "Microphone"
        case .camera:           return "Camera"
        case .photos:           return "Photos"
        }
    }
    
    static let allValues = [notifications, microphone, camera, photos]
}

/// Possible statuses for a permission.
@objc public enum PermissionStatus: Int, CustomStringConvertible {
    case authorized, unauthorized, unknown, disabled
    
    public var description: String {
        switch self {
        case .authorized:   return "Authorized"
        case .unauthorized: return "Unauthorized"
        case .unknown:      return "Unknown"
        case .disabled:     return "Disabled" // System-level
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
