//
//  HumanViewController.swift
//  Swift(UIKit_lesson5)_HomeWork
//
//  Created by Эдуард Потоки on 20.09.2021.
//

import UIKit

class HumanViewController: UIViewController {
    weak var delegate: BirthdayViewControllerProtocol!
    let picker = UIPickerView()
    let nameInput = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    let dateInput = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    let ageInput = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    let sexInput = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    let instagramInput = UITextField()
    //
    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let sexPicker = UIPickerView()
    let sex = ["Male", "Female"]
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createDataPicker()
        createAgePicker()
        createSexPicker()
        //MARK: - NavBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(backPage))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addHuman))
//        let navigationBar = navigationController?.navigationBar
//        let navigationBarAppearence = UINavigationBarAppearance()
//        navigationBarAppearence.shadowColor = .clear
//        navigationBar?.scrollEdgeAppearance = navigationBarAppearence
        navigationController?.navigationBar.barTintColor = view.backgroundColor
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        //MARK: - Human image
        let humanImage = UIImageView()
        humanImage.image = UIImage(named: "human")
        humanImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        humanImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        humanImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(humanImage)
        view.addConstraints([NSLayoutConstraint(item: humanImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
                             NSLayoutConstraint(item: humanImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 33)])
        //MARK: - Human Image
        let humanAdd = UIButton()
        humanAdd.setTitle("Change image", for: .normal)
        humanAdd.setTitleColor(.blue, for: .normal)
//        humanAdd.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        humanAdd.heightAnchor.constraint(equalToConstant: 300).isActive = true
        humanAdd.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(humanAdd)
        view.addConstraints([NSLayoutConstraint(item: humanAdd, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
                             NSLayoutConstraint(item: humanAdd, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 200)])
        //MARK: - Name Label
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.text = "Name"
        nameLabel.textColor = .blue
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        view.addConstraints([ NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -140),
                              NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 260)])
        //MARK: - UITextField Name
        nameInput.placeholder = "Enter your name"
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0, y: nameInput.frame.height - 70, width: nameInput.frame.width, height: 3)
        bottomLine1.backgroundColor = UIColor.brown.cgColor
        nameInput.layer.addSublayer(bottomLine1)
        nameInput.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        nameInput.borderStyle = .none
//        nameInput.clearsOnBeginEditing = false
//        nameInput.clearsOnInsertion = false
        nameInput.textContentType = .password
//        nameInput.autocapitalizationType = .none
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameInput)
        nameInput.leadingAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.leadingAnchor).isActive = true

        view.addConstraints([
                              NSLayoutConstraint(item: nameInput, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 300)])
        //MARK: - Date Label
        let dateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        dateLabel.text = "Date"
        dateLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLabel.textColor = .blue
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateLabel)
        view.addConstraints([ NSLayoutConstraint(item: dateLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -140),
                              NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 370)])
        //MARK: - UITextField Date
        dateInput.placeholder = "Date"
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0, y: dateInput.frame.height - 70, width: dateInput.frame.width, height: 3)
        bottomLine2.backgroundColor = UIColor.brown.cgColor
        dateInput.layer.addSublayer(bottomLine2)
        dateInput.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        dateInput.borderStyle = .none
//        dateInput.clearsOnBeginEditing = false
//        dateInput.clearsOnInsertion = false
        dateInput.textContentType = .password
//        dateInput.autocapitalizationType = .none
        dateInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateInput)
        dateInput.leadingAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.leadingAnchor).isActive = true

        view.addConstraints([
                              NSLayoutConstraint(item: dateInput, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 410)])
        //MARK: - Age Label
        let ageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        ageLabel.text = "Age"
        ageLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ageLabel.textColor = .blue
        ageLabel.adjustsFontSizeToFitWidth = true
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageLabel)
        view.addConstraints([ NSLayoutConstraint(item: ageLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -140),
                              NSLayoutConstraint(item: ageLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 480)])
        //MARK: - UITextField Age
        ageInput.placeholder = "Age"
        let bottomLine3 = CALayer()
        bottomLine3.frame = CGRect(x: 0, y: ageInput.frame.height - 70, width: ageInput.frame.width, height: 3)
        bottomLine3.backgroundColor = UIColor.brown.cgColor
        ageInput.layer.addSublayer(bottomLine3)
        ageInput.widthAnchor.constraint(equalToConstant: 300).isActive = true

//        ageInput.borderStyle = .none
//        ageInput.clearsOnBeginEditing = false
//        ageInput.clearsOnInsertion = false
        ageInput.textContentType = .password
//        ageInput.autocapitalizationType = .none
        ageInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageInput)
        ageInput.leadingAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.leadingAnchor).isActive = true

        view.addConstraints([
                              NSLayoutConstraint(item: ageInput, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 520)])
        //MARK: - Male/Female Label
        let maleFemaleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        maleFemaleLabel.text = "Sex"
        maleFemaleLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        maleFemaleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        maleFemaleLabel.textColor = .blue
        maleFemaleLabel.adjustsFontSizeToFitWidth = true
        maleFemaleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(maleFemaleLabel)
        view.addConstraints([ NSLayoutConstraint(item: maleFemaleLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -140),
                              NSLayoutConstraint(item: maleFemaleLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 590)])
        //MARK: - Male/Female
        sexInput.placeholder = "Sex"
        let bottomLine4 = CALayer()
        bottomLine4.frame = CGRect(x: 0, y: sexInput.frame.height - 70, width: sexInput.frame.width, height: 3)
        bottomLine4.backgroundColor = UIColor.brown.cgColor
        sexInput.layer.addSublayer(bottomLine4)
        sexInput.widthAnchor.constraint(equalToConstant: 300).isActive = true

//        sexInput.borderStyle = .none
//        sexInput.clearsOnBeginEditing = false
//        sexInput.clearsOnInsertion = false
        sexInput.textContentType = .password
//        sexInput.autocapitalizationType = .none
        sexInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sexInput)
        sexInput.leadingAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.leadingAnchor).isActive = true

        view.addConstraints([
                              NSLayoutConstraint(item: sexInput, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 630)])
        //MARK: - Instagram Label
        let instagramLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        instagramLabel.text = "Instagram"
        instagramLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        instagramLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        instagramLabel.textColor = .blue
        instagramLabel.adjustsFontSizeToFitWidth = true
        instagramLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instagramLabel)
        view.addConstraints([ NSLayoutConstraint(item: instagramLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -140),
                              NSLayoutConstraint(item: instagramLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 700)])
        //MARK: - Instagram
        
        instagramInput.placeholder = "Instagram"
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 30, width: 300, height: 3)
        bottomLine.backgroundColor = UIColor.brown.cgColor
        instagramInput.layer.addSublayer(bottomLine)
        instagramInput.widthAnchor.constraint(equalToConstant: 300).isActive = true

//        instagramInput.borderStyle = .none
//        instagramInput.clearsOnBeginEditing = false
//        instagramInput.clearsOnInsertion = false
        instagramInput.textContentType = .password
//        instagramInput.autocapitalizationType = .none
        instagramInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instagramInput)
        instagramInput.leadingAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.leadingAnchor).isActive = true

        view.addConstraints([
                              NSLayoutConstraint(item: instagramInput, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 740)])
        instagramInput.addTarget(nil, action: #selector(createInstagramAlert), for: .touchDown)
    }
    
    //MARK: - Date Actions
    func createDataPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let buttonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(clicked))
        toolbar.setItems([buttonItem], animated: true)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        dateInput.inputView = datePicker
        dateInput.inputAccessoryView = toolbar
        
    }
    @objc func backPage() {
        dismiss(animated: true, completion: nil)
    }
    @objc func clicked() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateInput.text = dateFormatter.string(from: datePicker.date)
        dateInput.textAlignment = .center
        view.endEditing(true)
    }
    //MARK: - Age Actions
    func createAgePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let buttonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(ageClicked))
        toolbar.setItems([buttonItem], animated: true)
        agePicker.dataSource = self
        agePicker.delegate = self
        agePicker.tag = 1
        ageInput.inputView = agePicker
        ageInput.inputAccessoryView = toolbar

    }
    @objc func ageClicked() {
        ageInput.textAlignment = .center
        view.endEditing(true)
    }
    //MARK: - Sex Actions
     func createSexPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        sexPicker.dataSource = self
        sexPicker.delegate = self
        let buttonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(sexClicked))
        toolbar.setItems([buttonItem], animated: true)
        sexInput.inputView = sexPicker
        sexInput.inputAccessoryView = toolbar
        
    }
    @objc func sexClicked() {
        sexInput.textAlignment = .center
        view.endEditing(true)
    }
    //MARK: - Instagram Actions
   @objc func createInstagramAlert() {
        let instagramAlert = UIAlertController(title: "Your user-name instagram", message: nil, preferredStyle: .alert)
    instagramAlert.addTextField(configurationHandler: { $0.placeholder = "example: yourNickName1991" })
        instagramAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        instagramAlert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {_ in
                                                let text = instagramAlert.textFields?.first
                                                self.instagramInput.text = text?.text
            self.instagramInput.textAlignment = .center
        }))
        present(instagramAlert, animated: true, completion: nil)

    }
    
    
    @objc func addHuman() {
//        delegate?.update(name: "Some", age: "Some")
//        delegate.ageLabel.text = ageInput.text
        delegate.update(name: self.nameInput.text ?? "Did not write", age: self.ageInput.text ?? "Did not write")
        print("name: \(nameInput.text) years: \(ageInput.text)")
        dismiss(animated: true, completion: nil)
        
    }

}

extension HumanViewController: UIPickerViewDelegate {
        
     func pickerView(_ pickerView: UIPickerView,  titleForRow row:  Int, forComponent component: Int) -> String? {
        print(row)
        if pickerView.tag == 1 {
            return "\(14 + row)"
        } else {
           return  sex[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            ageInput.text = "\(14 + row)"
        } else {
            sexInput.text = sex[row]
        }
        
    }
    
}
extension HumanViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return 120 - 13
        } else {
            return 2
        }
        
    }
}

