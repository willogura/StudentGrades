//
//  DataHandler.swift
//  StudentGrades
//
//  Created by William Ogura on 4/22/17.
//  Copyright © 2017 William Ogura. All rights reserved.
//

import Foundation
 import SQLite

class DataHandler {
    
    
    var db: Connection?
    
    
    

   
    
    
    
    let studentGrades = Table("studentGrades")
    
    let studentName = Expression<String>("studentName")
    
    let courseName = Expression<String>("courseName")
    
    let instructorName = Expression<String>("instructorName")
    
    let grade = Expression<Double>("grade")
    
  
    
    
    init() {
        
        
        //   let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        // .appendingPathComponent("ReminderList.sqlite")
        
        
        do {
            
            let databasePath = Bundle.main.path(forResource: "StudentGrades", ofType: "sqlite")!
            
            db = try Connection(databasePath)
            
            print("database connection successful")
            
        } catch {
            
            print("conection not working")
            
        }
        
        createTables()
        
        
    }
    
    
    
    func createTables() {
        
        
        do {
            
            
            try db!.run(studentGrades.create { t in
                
                t.column(studentName, primaryKey: true)
                
                t.column(courseName)
                
                t.column(instructorName)
                
                t.column(grade)
            })
            
            print("Student Grades Table successfully created")
            
        } catch {
            
            print("create student grades table failed")
            
            
        }
        
    }
    
    func printAllRecords() {
        
        
        do {
            
    
            for record in try db!.prepare(studentGrades) {
                print("student name: \(record[studentName]), course name: \(record[courseName]), instructor name: \(record[instructorName]), grade: \(record[grade])")
                
            }
        } catch {
            
            
            print("Cannot print all records")
        }
        
        
    }
    
    
    func saveRecord(studentRecord: StudentRecord) {
        
        let record = studentRecord
        
        let studentName = record.getStudentName()
        
        let courseName = record.getCourseName()
        
        let instructorName = record.getInstructorName()
        
        let grade = record.getGrade()
        
        do {
        let insert = studentGrades.insert(self.studentName <- studentName, self.courseName <- courseName, self.instructorName <- instructorName, self.grade <- grade)
        
         try db?.run(insert)
            
            print("new record saved")
    
        } catch {
            
            
            print("Can't save record")
        }
    }
    

    
    
}
