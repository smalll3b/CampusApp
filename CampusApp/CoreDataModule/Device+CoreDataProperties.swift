//
//  Device+CoreDataProperties.swift
//  CampusApp
//
//  Created by smalll3b on 6/1/2026.
//
//

import Foundation
import CoreData


extension Device {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device> {
        return NSFetchRequest<Device>(entityName: "Device")
    }

    @NSManaged public var company: String?
    @NSManaged public var name: String?
    @NSManaged public var version: String?
    @NSManaged public var timestamp: Date?

}

extension Device : Identifiable {

}

