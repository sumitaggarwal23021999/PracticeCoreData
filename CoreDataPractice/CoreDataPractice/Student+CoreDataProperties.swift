//
//  Student+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Mayank Sharma  on 02/10/22.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobile: String?

}

extension Student : Identifiable {

}
