//
//  Students.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 27/08/23.
//

import Foundation

struct Students {
    let students: [Student]
    
    static let data = Students(students: [Student(name: "Aman"), Student(name: "Pavan"), Student(name: "Naveed"), Student(name: "Shivacharan"), Student(name: "Adarsh"), Student(name: "Abhi"), Student(name: "Ankit")])
}

struct Student {
    let name: String
}
