import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    private init() { }
    
    static let sharedObject = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object: [String: Any]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"] as? String
        student.address = object["address"] as? String
        student.city = object["city"] as? String
        student.mobile = object["mobile"] as? String
        do {
            try context?.save()
        } catch {
            debugPrint("Data not saved")
        }
    }
    
    func getStudentData() -> [Student] {
        var student: [Student] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            student = try context?.fetch(fetchRequest) as? [Student] ?? []
        } catch {
            debugPrint("Not able to fetch student listing")
        }
        return student
    }
    
    func deleteStudentObject(index: Int) -> [Student] {
        var students: [Student] = getStudentData()
        if students.count > index {
            context?.delete(students[index])
            students.remove(at: index)
            do {
                try context?.save()
            } catch {
                debugPrint("Failed to delete object at: \(index)")
            }
            return students
        }
        return students
    }
}
