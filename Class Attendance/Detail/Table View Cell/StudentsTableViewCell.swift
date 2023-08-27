//
//  StudentsTableViewCell.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 27/08/23.
//

import UIKit

class StudentsTableViewCell: UITableViewCell {

    static let identifier = "StudentsTableViewCell"
    
    private let nameLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Student Name"
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let studentImage: UIImageView = {
       
        let image = UIImageView()
        image.backgroundColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.tintColor = .label
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(studentImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                studentImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                studentImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                studentImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                studentImage.widthAnchor.constraint(equalToConstant: 100),
                
                nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                nameLabel.leadingAnchor.constraint(equalTo: studentImage.trailingAnchor, constant: 5),
                nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
                
            ]
        )
    }
    
    func configure(data: Student) {
        nameLabel.text = data.name
    }
    
}
