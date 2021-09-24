

import UIKit

class ViewController: UIViewController {
    let emailInput = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    let passwordInput = PasswordTextField(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
    let imageButton = UIButton()
    var imageEye = UIImage(named: "eye")
    let imageEyeClosed = UIImage(named: "closeEye")
    var click = false
    @objc func imageTapped(sender: AnyObject) {

        if click {
            imageButton.setImage(imageEye?.withTintColor(UIColor(rgb: 0x07006b)), for: .highlighted )
            imageButton.setImage(imageEye?.withTintColor(UIColor(rgb: 0x1100ff)), for: .normal )
            
            
        } else {
            imageButton.setImage(imageEyeClosed?.withTintColor(UIColor(rgb: 0x07006b)), for: .highlighted )
            imageButton.setImage(imageEyeClosed?.withTintColor(UIColor(rgb: 0x1100ff)), for: .normal)
            
        }
//       myImageEye.image = click ? imageEye : imageEyeClosed
        imageButton.isHighlighted = true
        passwordInput.isSecureTextEntry.toggle()
       click = !click
       print("Click")
   }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //MARK: - BirthDay Label
        let birthdayReminderLabel = UILabelPadding(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        birthdayReminderLabel.text = "Birthday Reminder"
        birthdayReminderLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        birthdayReminderLabel.layer.borderWidth = 2
        birthdayReminderLabel.textColor = .blue
        birthdayReminderLabel.adjustsFontSizeToFitWidth = true
        birthdayReminderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(birthdayReminderLabel)
        view.addConstraints([ NSLayoutConstraint(item: birthdayReminderLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
                              NSLayoutConstraint(item: birthdayReminderLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 120)])
        //MARK: - Sign In Label
        let signInLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        signInLabel.text = "Sign In"
        signInLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        signInLabel.adjustsFontSizeToFitWidth = true
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signInLabel)
        view.addConstraints([ NSLayoutConstraint(item: signInLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 250),
                              NSLayoutConstraint(item: signInLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 60)])
        //MARK: - Email
        let emailLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        emailLabel.text = "Email"
        emailLabel.textColor = .blue
        
        
        emailLabel.adjustsFontSizeToFitWidth = true
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(emailLabel)
        view.addConstraints([ NSLayoutConstraint(item: emailLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -130),
                              NSLayoutConstraint(item: emailLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 300)])
        //MARK: - UITextField Email
        emailInput.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailInput.placeholder = "Something"
        let bottomLine1 = CALayer()
        bottomLine1.frame = CGRect(x: 0, y: emailInput.frame.height - 70, width: emailInput.frame.width, height: 3)
        bottomLine1.backgroundColor = UIColor.brown.cgColor
        emailInput.layer.addSublayer(bottomLine1)
        
        emailInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailInput)
        emailInput.leadingAnchor.constraint(equalTo: emailLabel.safeAreaLayoutGuide.leadingAnchor).isActive = true

        view.addConstraints([
                              NSLayoutConstraint(item: emailInput, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 340)])
        //MARK: - Password Label
        let passwordLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        passwordLabel.text = "Password"
        passwordLabel.textColor = .blue
        passwordLabel.adjustsFontSizeToFitWidth = true
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordLabel)
        view.addConstraints([ NSLayoutConstraint(item: passwordLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: -110),
                              NSLayoutConstraint(item: passwordLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 410)])
        //MARK: - Visibility Password
        imageButton.setImage(imageEye?.withTintColor(UIColor(rgb: 0x1100ff), renderingMode: .alwaysTemplate), for: .normal)
        imageButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageButton.addTarget(self, action: #selector(imageTapped(sender:)), for: .touchUpInside)
        imageButton.tintColor = UIColor(rgb: 0x1100ff)
            view.addSubview(imageButton)
        //MARK: - UITextField Password
        passwordInput.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordInput.placeholder = "Password"
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0, y: passwordInput.frame.height - 70, width: passwordInput.frame.width, height: 3)
        bottomLine2.backgroundColor = UIColor.brown.cgColor
        passwordInput.layer.addSublayer(bottomLine2)
        passwordInput.rightViewMode = .always
        passwordInput.rightView = imageButton
        passwordInput.borderStyle = .none
        passwordInput.clearsOnBeginEditing = false
        passwordInput.clearsOnInsertion = false
        passwordInput.textContentType = .password
        passwordInput.autocapitalizationType = .none
        passwordInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordInput)
        passwordInput.leadingAnchor.constraint(equalTo: passwordLabel.safeAreaLayoutGuide.leadingAnchor).isActive = true

        view.addConstraints([
                              NSLayoutConstraint(item: passwordInput, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 450)])
        //MARK: - Entry Face Id Label
        let faceIdLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        faceIdLabel.text = "Entry Face ID"
        faceIdLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
//        faceIdLabel.adjustsFontSizeToFitWidth = true
        faceIdLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(faceIdLabel)
        view.addConstraints([
                             NSLayoutConstraint(item: faceIdLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 530),
                             NSLayoutConstraint(item: faceIdLabel, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 195)])

        //MARK: - Switch Face Id
         let faceIdSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        faceIdSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(faceIdSwitch)
        view.addConstraints([NSLayoutConstraint(item: faceIdSwitch, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 525),
                             NSLayoutConstraint(item: faceIdSwitch, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 310)])
        //MARK: - Button Open
        let buttonOpen = UIButton(type: .roundedRect)
        buttonOpen.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        buttonOpen.setTitle("Open", for: .normal)
        buttonOpen.backgroundColor = .blue
        buttonOpen.tintColor = .white
        buttonOpen.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        buttonOpen.layer.borderWidth = 1
        buttonOpen.layer.cornerRadius = 8
        buttonOpen.translatesAutoresizingMaskIntoConstraints = false
        buttonOpen.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonOpen.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonOpen.addTarget(self, action: #selector(openVC), for: .touchUpInside)
        view.addSubview(buttonOpen)
        view.addConstraints([NSLayoutConstraint(item: buttonOpen, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0), NSLayoutConstraint(item: buttonOpen, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 620)])
        //MARK: - Next View Controller
        
    }
    @objc func openVC() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
//        viewController.modalPresentationStyle = .fullScreen
//        present(viewController, animated: true, completion: nil)
        let rootVC = BirthdayViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: {
            self.passwordInput.text = ""
            self.emailInput.text = ""
            
        })
    }


}

class UILabelPadding: UILabel {

    let padding = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let height = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: height)
    }



}
