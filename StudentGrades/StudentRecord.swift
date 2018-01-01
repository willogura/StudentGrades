//
//  studentRecord.swift
//  StudentGrades
//
//  Created by William Ogura on 4/22/17.
//  Copyright © 2017 William Ogura. All rights reserved.
//

import Foundation

class StudentRecord {
    
    var studentName: String
    
    var courseName: String
    
    var instructorName: String
    
    var grade: Double
    
    
    init(studentName: String, courseName: String, instructorName: String, grade: Double ) {
        
        
        self.studentName = studentName
        
        self.courseName = courseName
        
        self.instructorName = instructorName
        
        self.grade = grade
        
    }
    
    func getStudentName() -> String {
        
        return self.studentName
        
    }
    
    func getCourseName() -> String {
        
        
        return self.courseName
        
    }
    
    func getInstructorName() -> String {
        
        
        return self.instructorName
        
    }
    
    func getGrade() -> Double {
        
        
        return self.grade
    }
    
    
    
}
