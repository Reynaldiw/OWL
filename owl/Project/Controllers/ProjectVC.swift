//
//  ProjectVC.swift
//  owl
//
//  Created by Reynaldi Wijaya on 03/06/20.
//  Copyright © 2020 Reynaldi Wijaya. All rights reserved.
//

import UIKit

class ProjectVC: UIViewController {
    
    @IBOutlet weak var imageIconTopic: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var contentView: UIView!
    
    var projectView: ProjectView { return self.view as! ProjectView }
    
    var syllabusView: SyllabusView?
    var pblView: PBLView?
    
    override func loadView() {
        self.view = ProjectView()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupNavigationItem()
        
        syllabusView = projectView.syllabusView
        pblView = projectView.pblView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topicLabel = projectView.topicLabel
        imageIconTopic = projectView.imageIcon
        segmentedControl = projectView.segmentedControl
        contentView = projectView.contentView
        
        segmentedControl.addTarget(self, action: #selector(handleSegmentedControlValueChanged(_:)), for: .valueChanged)
        
        topicLabel.text = "Swift".capitalized
        imageIconTopic.image = UIImage(named: "swift")
    }
    
    @objc fileprivate func handleSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pblView?.isHidden = false
            syllabusView?.isHidden = true
        case 1:
            pblView?.isHidden = true
            syllabusView?.isHidden = false
        default:
            pblView?.isHidden = false
            syllabusView?.isHidden = true
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Curriculum"
        label.font = .boldSystemFont(ofSize: 21)
        label.textColor = Colors.bluePrimaryColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    // Setup the profile button
    let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile"), for: .normal)
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func profileButtonTapped() {}
    
    private func setupNavigationItem() {
        let leftButtonItem = UIBarButtonItem(customView: titleLabel)
        leftButtonItem.isEnabled = false
        leftButtonItem.tintColor = Colors.bluePrimaryColor
        self.navigationItem.leftBarButtonItem = leftButtonItem
        
        let buttonItem = UIBarButtonItem(customView: profileButton)
        self.navigationItem.rightBarButtonItem = buttonItem
    }
}
