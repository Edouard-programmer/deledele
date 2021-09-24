//
//  BIrthdayViewController.swift
//  Swift(UIKit_lesson5)_HomeWork
//
//  Created by Эдуард Потоки on 23.09.2021.
//

import UIKit
protocol BirthdayViewControllerProtocol: class {
    func update(name: String, age: String)
}

class BirthdayViewController: UIViewController, BirthdayViewControllerProtocol {
    var nameLabel = UILabel()
    var ageLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: -
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(pageBack))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(pageBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newHuman))
        navigationItem.title = "Birthday"
        //MARK: -Name
        nameLabel.text = "NAMssE"
        nameLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.font = UIFont.systemFont(ofSize: 30)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(nameLabel)
        view.addConstraints([NSLayoutConstraint(item: nameLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0),
                             NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 40),
                             NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 200)])
        //MARK: -Age
        ageLabel.text = "AGE"
        ageLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        ageLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ageLabel.font = UIFont.systemFont(ofSize: 30)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(ageLabel)
        view.addConstraints([NSLayoutConstraint(item: ageLabel, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0),  NSLayoutConstraint(item: ageLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 200),
                             NSLayoutConstraint(item: ageLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 400)])
    }

    
    func update(name: String, age: String) {
        nameLabel.text = name.capitalized
        ageLabel.text = age + "years"
        
        
        print("WORK")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? HumanViewController else { return }
        destination.delegate = self
    }

    //MARK: -
    @objc func newHuman() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let myViewController = storyboard.instantiateViewController(identifier: "HumanViewController")
        
//        present(myViewController, animated: true, completion: nil)
        let rootVC = HumanViewController()
        let myVC = UINavigationController(rootViewController: rootVC)
        present(myVC, animated: true, completion: nil)
    }
    @objc  func pageBack() {
        
        dismiss(animated: true)
    }

}
