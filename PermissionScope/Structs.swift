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
    case contacts, locationAlways, locationInUse, notifications, microphone, camera, photos, reminders, events, bluetooth, motion
    
    public var prettyDescription: String {
        switch self {
        case .locationAlways, .locationInUse:
            return "Location"
        default:
            return "\(self)"
        }
    }
    
    public var selector: Selector {
        switch self {
        case .contacts:         return #selector(PermissionScope.requestContacts)
        case .events:           return #selector(PermissionScope.requestEvents)
        case .locationAlways:   return #selector(PermissionScope.requestLocationAlways)
        case .locationInUse:    return #selector(PermissionScope.requestLocationInUse)
        case .notifications:    return #selector(PermissionScope.requestNotifications)
        case .microphone:       return #selector(PermissionScope.requestMicrophone)
        case .camera:           return #selector(PermissionScope.requestCamera)
        case .photos:           return #selector(PermissionScope.requestPhotos)
        case .reminders:        return #selector(PermissionScope.requestReminders)
        case .bluetooth:        return #selector(PermissionScope.requestBluetooth)
        case .motion:           return #selector(PermissionScope.requestMotion)
        }
    }
    
    public var description: String {
        switch self {
        case .contacts:         return "Contacts"
        case .events:           return "Events"
        case .locationAlways:   return "LocationAlways"
        case .locationInUse:    return "LocationInUse"
        case .notifications:    return "Notifications"
        case .microphone:       return "Microphone"
        case .camera:           return "Camera"
        case .photos:           return "Photos"
        case .reminders:        return "Reminders"
        case .bluetooth:        return "Bluetooth"
        case .motion:           return "Motion"
        }
    }
    
    static let allValues = [contacts, locationAlways, locationInUse, notifications, microphone, camera, photos, reminders, events, bluetooth, motion]
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
