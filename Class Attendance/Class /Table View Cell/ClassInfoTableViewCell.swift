//
//  ClassInfoTableViewCell.swift
//  Class Attendance
//
//  Created by Shivacharan Reddy on 26/08/23.
//

import UIKit

class ClassInfoTableViewCell: UITableViewCell {

    static let identifier = "ClassInfoTableViewCell"
    
    let label: [String] = ["Grade", "Section", "Students"]
    let valueLabel: [String] = ["6", "C", "90"]
    
    var delegate: ClassInfoDelegate?
    
    private let infoCollection: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ClassInfoCollectionViewCell.self, forCellWithReuseIdentifier: ClassInfoCollectionViewCell.identifier)
        view.isScrollEnabled = false
        view.contentInset = .init(top: 0, left: 16, bottom: 0, right: 10)
        return view
    }()
    
    private let button: UIButton = {
       
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(infoCollection)
        infoCollection.delegate = self
        infoCollection.dataSource = self
        
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = infoCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: contentView.bounds.width / 3 - 15, height: 130)
        
        infoCollection.frame = contentView.bounds
        button.frame = contentView.bounds
    }
    
    @objc func buttonPressed() {
        
        delegate?.goToDetailedScreen(grade: "6", section: "C")
    }
    
}

extension ClassInfoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClassInfoCollectionViewCell.identifier, for: indexPath) as? ClassInfoCollectionViewCell else { return UICollectionViewCell() }
        cell.backgroundColor = .cyan
        cell.layer.cornerRadius = 10
        cell.configure(label: label[indexPath.row], value: valueLabel[indexPath.row])
        return cell
    }
}
