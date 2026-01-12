//
//  Device+CoreDataProperties.swift
//  CampusApp
//
//  Created by smalll3b on 6/1/2026.
//
//

public import Foundation
public import CoreData


public typealias DeviceCoreDataPropertiesSet = NSSet

extension Device {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device> {
        return NSFetchRequest<Device>(entityName: "Device")
    }

    @NSManaged public var company: String?
    @NSManaged public var name: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var version: String?

}

extension Device : Identifiable {

}
