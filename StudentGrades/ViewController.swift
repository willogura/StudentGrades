//
//  ViewController.swift
//  StudentGrades
//
//  Created by William Ogura on 4/22/17.
//  Copyright © 2017 William Ogura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var studentRecord: StudentRecord?
    
    var dataHandler: DataHandler?
    
    @IBOutlet weak var studentName: UITextField!
    
    @IBOutlet weak var courseName: UITextField!
    
    @IBOutlet weak var instructorName: UITextField!
    
    @IBOutlet weak var grade: UITextField!
    
    
    @IBAction func insertPressed(_ sender: Any) {
        
        
        var grade = Double(self.grade.text!)
        
       
        studentRecord = StudentRecord(studentName: studentName.text!, courseName: courseName.text!, instructorName: instructorName.text!, grade: grade!)
        
      
        dataHandler?.saveRecord(studentRecord: studentRecord!)
        
        dataHandler?.printAllRecords()
    
        
    }
    

    override func viewDidLoad() {
        
         dataHandler = DataHandler()
        
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

