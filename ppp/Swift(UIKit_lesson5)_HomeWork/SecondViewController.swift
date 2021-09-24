//
//  SecondViewController.swift
//  Swift(UIKit_lesson5)_HomeWork
//
//  Created by Эдуард Потоки on 19.09.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let plusImage = UIImage(named: "plus")?.withRenderingMode(.alwaysTemplate)
        //        let plusButton = UIButton(type: .custom)
        //        plusButton.backgroundColor = .black
        //        plusButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //        plusButton.addTarget(self, action: #selector(newHuman), for: .touchUpInside)
        //        plusButton.translatesAutoresizingMaskIntoConstraints = false
        //        plusButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //        plusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //        plusButton.setBackgroundImage(plusImage?.withTintColor(.black), for: .normal)
        //        let barButton = UIBarButtonItem(customView: plusButton)
        //        navigationItem.rightBarButtonItem = barButton
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(pageBack))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(pageBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newHuman))
        navigationItem.title = "Birthday"
        
        
    }

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
