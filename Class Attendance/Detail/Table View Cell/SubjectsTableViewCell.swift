//
//  SubjectsTableViewCell.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 27/08/23.
//

import UIKit

class SubjectsTableViewCell: UITableViewCell {

    static let identifier = "SubjectsTableViewCell"
    
    private let baseView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
//        view.backgroundColor = .systemBlue
        return view
    }()
    
    private let subjectTitle: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Math"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let timeLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "9:30 - 11:30"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let attendaceMarked: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Attendance: Not Marked"
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(baseView)
        
        baseView.addSubview(subjectTitle)
        baseView.addSubview(timeLabel)
        baseView.addSubview(attendaceMarked)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                baseView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                baseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                baseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                baseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                
                subjectTitle.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 10),
                subjectTitle.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 5),
                subjectTitle.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -5),
                
                timeLabel.topAnchor.constraint(equalTo: subjectTitle.bottomAnchor, constant: 5),
                timeLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 5),
                timeLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -5),
                
                attendaceMarked.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
                attendaceMarked.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 5),
                attendaceMarked.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -5)
            ]
        )
    }
    
    func configure(data: Subject) {
        subjectTitle.text = data.name
        timeLabel.text = data.time
    }
    
}
