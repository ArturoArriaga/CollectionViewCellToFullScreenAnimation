//
//  FullScreenViewController.swift
//  CollectionViewCellToFullScreenAnimation
//
//  Created by Art Arriaga on 1/27/20.
//  Copyright © 2020 ArturoArriaga.Demos. All rights reserved.
//

import UIKit


class FullScreenController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }
}

extension FullScreenController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let topCell = TopCell()
            return topCell
        }
        let cell = BottomCell()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 350
        }
        return 500
    }
}

class TopCell: UITableViewCell {
    lazy var topImageView: UIImageView = {
        let imv = UIImageView(image: UIImage(named: "fruit.banana")!)
        imv.contentMode = .scaleAspectFill
        imv.layer.cornerRadius = 8
        imv.clipsToBounds = true
        imv.translatesAutoresizingMaskIntoConstraints = false
        imv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imv.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return imv
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(topImageView)
        self.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        topImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BottomCell: UITableViewCell {
    
    let v: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        v.translatesAutoresizingMaskIntoConstraints = false
//        v.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        v.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return v
    }()
    
    let v2: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        v.translatesAutoresizingMaskIntoConstraints = false
//        v.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        v.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return v
    }()
    
    let v3: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        v.translatesAutoresizingMaskIntoConstraints = false
//        v.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        v.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return v
    }()
    
    let v4: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
//        v.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        v.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return v
    }()

        lazy var stackView: UIStackView = {
            let sv = UIStackView(arrangedSubviews: [v, v2, v3, v4])
            sv.distribution = .fillEqually
            sv.spacing = 12
            sv.translatesAutoresizingMaskIntoConstraints = false
            sv.heightAnchor.constraint(equalToConstant: 400).isActive = true
            sv.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
            return sv
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
