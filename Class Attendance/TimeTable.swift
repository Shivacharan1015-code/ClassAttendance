//
//  TimeTable.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 27/08/23.
//

import Foundation


struct TimeTable {
    let monday: [Subject]
    let tuesday: [Subject]
    let wednesday: [Subject]
    let thursday: [Subject]
    let friday: [Subject]
    let saturday: [Subject] = []
    let sunday: [Subject] = []
    
    static let data = TimeTable(monday: mondaySubjects, tuesday: tuesdaySubjects, wednesday: wednesdaySubjects, thursday: thursdaySubjects, friday: fridaySubjects)
}

struct Subject {
    let name: String
    let time: String
}

let mondaySubjects: [Subject] = [Subject(name: "Math", time: "9:30 - 10:30"), Subject(name: "Science", time: "10:45 - 11:45"), Subject(name: "History", time: "1:30 - 2:30"), Subject(name: "Economics", time: "2:45 - 3:45")]

let tuesdaySubjects: [Subject] = [Subject(name: "History", time: "9:30 - 10:30"), Subject(name: "Economics", time: "10:45 - 11:45"), Subject(name: "Math", time: "1:30 - 2:30"), Subject(name: "Science", time: "2:45 - 3:45")]

let wednesdaySubjects: [Subject] = [Subject(name: "History", time: "9:30 - 10:30"), Subject(name: "Math", time: "10:45 - 11:45"), Subject(name: "Economics", time: "1:30 - 2:30"), Subject(name: "Science", time: "2:45 - 3:45")]

let thursdaySubjects: [Subject] = [Subject(name: "Math", time: "9:30 - 10:30"), Subject(name: "Science", time: "10:45 - 11:45"), Subject(name: "History", time: "1:30 - 2:30"), Subject(name: "Economics", time: "2:45 - 3:45")]

let fridaySubjects: [Subject] = [Subject(name: "History", time: "9:30 - 10:30"), Subject(name: "Math", time: "10:45 - 11:45"), Subject(name: "Economics", time: "1:30 - 2:30"), Subject(name: "Science", time: "2:45 - 3:45")]

