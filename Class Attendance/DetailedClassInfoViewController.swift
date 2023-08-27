//
//  DetailedClassInfoViewController.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 27/08/23.
//

import UIKit

class DetailedClassInfoViewController: UIViewController {
    
    let grade: String
    let section: String
    
    let dateFormatter = DateFormatter()
    
    var day = "Today"
    
    var subjects = TimeTable.data.monday
    var students = Students.data.students
    
    init(grade: String, section: String) {
        self.grade = grade
        self.section = section
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let choseMode: UISegmentedControl = {
       
        let control = UISegmentedControl(items: ["Mark Attendance", "Students List"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.selectedSegmentIndex = 0
        return control
    }()
    
    private let markAttendanceView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    private let dateSelector: UIDatePicker = {
       
        let view = UIDatePicker()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.preferredDatePickerStyle = .compact
        view.datePickerMode = .date
        view.maximumDate = Date()
        view.date = Date()
        view.minimumDate = Calendar.current.date(byAdding: DateComponents.init(day: -7), to: Date())
        return view
    }()
    
    private let subjectTableView: UITableView = {
       
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(SubjectsTableViewCell.self, forCellReuseIdentifier: SubjectsTableViewCell.identifier)
        return view
    }()
    
    private let studentsTableView: UITableView = {
        
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(StudentsTableViewCell.self, forCellReuseIdentifier: StudentsTableViewCell.identifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateFormat = "EEEE"
        dateChanged(dateSelector)
        
        title = "Grade \(grade)\(section)"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.navigationItem.largeTitleDisplayMode = .al
        view.backgroundColor = .systemBackground
        
        view.addSubview(choseMode)
        choseMode.addTarget(self, action: #selector(modeChnaged(_:)), for: .valueChanged)
        
        view.addSubview(markAttendanceView)
        
        markAttendanceView.addSubview(dateSelector)
        dateSelector.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        markAttendanceView.addSubview(subjectTableView)
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
        subjectTableView.layoutMargins = .zero
        subjectTableView.separatorInset = .zero
        
        view.addSubview(studentsTableView)
        studentsTableView.delegate = self
        studentsTableView.dataSource = self
        studentsTableView.layoutMargins = .zero
        studentsTableView.separatorInset = .zero
        
        markAttendanceView.isHidden = false
        studentsTableView.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                choseMode.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                choseMode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                choseMode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                
                markAttendanceView.topAnchor.constraint(equalTo: choseMode.bottomAnchor, constant: 5),
                markAttendanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                markAttendanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                markAttendanceView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
                
                dateSelector.topAnchor.constraint(equalTo: markAttendanceView.topAnchor, constant: 5),
                dateSelector.leadingAnchor.constraint(equalTo: markAttendanceView.leadingAnchor),
                
                subjectTableView.topAnchor.constraint(equalTo: dateSelector.bottomAnchor, constant: 10),
                subjectTableView.leadingAnchor.constraint(equalTo: markAttendanceView.leadingAnchor),
                subjectTableView.trailingAnchor.constraint(equalTo: markAttendanceView.trailingAnchor),
                subjectTableView.bottomAnchor.constraint(equalTo: markAttendanceView.bottomAnchor),
                
                studentsTableView.topAnchor.constraint(equalTo: choseMode.bottomAnchor, constant: 10),
                studentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                studentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                studentsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
            ]
        )
    }
    
    @objc func modeChnaged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            markAttendanceView.isHidden = false
            studentsTableView.isHidden = true
        } else {
            markAttendanceView.isHidden = true
            studentsTableView.isHidden = false
        }
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        day = dateFormatter.string(from: sender.date)
        
        if day == "Monday" {
            subjects = TimeTable.data.monday
        } else if day == "Tuesday" {
            subjects = TimeTable.data.tuesday
        } else if day == "Wednesday" {
            subjects = TimeTable.data.wednesday
        } else if day == "Thursday" {
            subjects = TimeTable.data.thursday
        } else if day == "Friday" {
            subjects = TimeTable.data.friday
        } else {
            subjects = TimeTable.data.saturday
        }
        
        self.subjectTableView.reloadData()
    }

}

extension DetailedClassInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == subjectTableView {
            return subjects.count
        } else {
            return students.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == subjectTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SubjectsTableViewCell.identifier, for: indexPath) as? SubjectsTableViewCell else { return UITableViewCell() }
            cell.layoutMargins = .zero
            cell.configure(data: subjects[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StudentsTableViewCell.identifier, for: indexPath) as? StudentsTableViewCell else { return UITableViewCell() }
            cell.layoutMargins = .zero
            cell.configure(data: students[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if tableView == subjectTableView {
            return day
        } else {
            return "Students"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == subjectTableView {
            return 100
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView == subjectTableView {
            self.navigationController?.present(AttendanceViewController(students: students), animated: true)
        } else {
            self.navigationController?.present(StudentDetailsViewController(), animated: true)
        }
    }
}
