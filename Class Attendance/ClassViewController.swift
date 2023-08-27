//
//  ViewController.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 26/08/23.
//

import UIKit

class ClassViewController: UIViewController {
    
    private let classesTableView: UITableView = {
       
        let view = UITableView(frame: .zero, style: .grouped)
        view.register(ClassInfoTableViewCell.self, forCellReuseIdentifier: ClassInfoTableViewCell.identifier)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Class"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always

        view.addSubview(classesTableView)
        classesTableView.backgroundColor = .systemBackground
        classesTableView.dataSource = self
        classesTableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        classesTableView.frame = view.bounds
    }


}

extension ClassViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ClassInfoTableViewCell.identifier, for: indexPath) as? ClassInfoTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ClassViewController: ClassInfoDelegate {
    
    func goToDetailedScreen(grade: String, section: String) {
        self.navigationController?.pushViewController(DetailedClassInfoViewController(grade: grade, section: section), animated: true)
    }
}

