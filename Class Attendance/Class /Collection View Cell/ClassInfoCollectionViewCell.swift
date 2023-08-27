//
//  ClassInfoCollectionViewCell.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 26/08/23.
//

import UIKit

class ClassInfoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ClassInfoCollectionViewCell"
    
    private let heading: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Grade"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.textAlignment = .center
        return label
    }()
    
    private let valueHeading: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 50)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.textColor = .label
        label.textAlignment = .center
        label.text = "38"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(heading)
        contentView.addSubview(valueHeading)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate(
            [
                heading.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                heading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                heading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                heading.heightAnchor.constraint(equalToConstant: 40),
                
                valueHeading.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 5),
                valueHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                valueHeading.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
                valueHeading.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            ]
        )
    }
    
    public func configure(label: String, value: String) {
        heading.text = label
        valueHeading.text = value
    }
    
}
