//
//  AttendanceViewController.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 27/08/23.
//

import UIKit

class AttendanceViewController: UIViewController {
    
    let students: [Student]
    
    init(students: [Student]) {
        self.students = students
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let studentsTable: UITableView = {
       
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let markAttendanceButton: UIButton = {
       
        let button = UIButton()
        button.setTitle("Submit Attendance", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        view.addSubview(studentsTable)
        studentsTable.delegate = self
        studentsTable.dataSource = self
        studentsTable.backgroundColor = .systemBackground
        
        view.addSubview(markAttendanceButton)
        markAttendanceButton.addTarget(self, action: #selector(submitAttendace), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        studentsTable.frame = view.bounds
        
        NSLayoutConstraint.activate(
            [
                markAttendanceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                markAttendanceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                markAttendanceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                markAttendanceButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
    @objc func submitAttendace() {
        self.dismiss(animated: true)
    }
}

extension AttendanceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row].name
        cell.backgroundColor = UIColor(named: "present")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Students"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.backgroundColor == UIColor(named: "absent") {
            cell?.backgroundColor = UIColor(named: "present")
        } else {
            cell?.backgroundColor = UIColor(named: "absent")
        }
    }
}
