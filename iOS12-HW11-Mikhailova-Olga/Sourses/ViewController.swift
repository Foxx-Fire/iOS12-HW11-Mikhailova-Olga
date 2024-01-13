//
//  ViewController.swift
//  iOS12-HW11-Mikhailova-Olga
//
//  Created by mbpro2.0/16/512 on 11.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Constants
    // не поняла что все же сюда выносить - вынесла и не работает ничего
//    private enum Constants {
//        static let background = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 0))
//    }
    //MARK: - Outlets
    
    //MARK: - ViewBackground
    private lazy var background: UIView = {
        let background = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 0))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.systemPink.cgColor, UIColor.white.cgColor]

        background.layer.insertSublayer(gradient, at: 0)
        
        background.contentMode = .scaleAspectFit
        background.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    
    //MARK: - Login
    private lazy var login: UILabel = {
        let login = UILabel()
        login.text = "Login"
        login.textAlignment = .center
        login.textColor = .white
        login.font = UIFont(name: "Avenir-Next", size: 31)
        login.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        //login.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()
    
    //MARK: - LoginTextField
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        //loginTextField.borderStyle = .bezel
        loginTextField.layer.cornerRadius = 18
        loginTextField.placeholder = "keanureeves01"
        loginTextField.textAlignment = .left
        loginTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        loginTextField.textColor = UIColor.systemGray3
        loginTextField.setLeftIcon(image: UIImage(systemName: "person") ?? UIImage(), color: UIColor.gray)
        loginTextField.setRightIcon(image: UIImage(systemName: "checkmark.circle.fill") ?? UIImage(), color: UIColor.green)
        loginTextField.backgroundColor = .white
        //loginTextField.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    
    //MARK: - Password
    private lazy var passwordTextField:  UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.layer.cornerRadius = 18
        passwordTextField.placeholder = "Password"
        passwordTextField.textAlignment = .left
        passwordTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordTextField.textColor = UIColor.systemGray3
        passwordTextField.setLeftIcon(image: UIImage(systemName: "lock") ?? UIImage(), color: UIColor.gray)
        passwordTextField.backgroundColor = .white
        //passwordTextField.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    
    //MARK: - LoginButton
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.backgroundColor = .systemIndigo
        loginButton.layer.cornerRadius = 18
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Avenir-Next", size: 12)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOpacity = 0.3
        loginButton.layer.shadowOffset = .zero
        loginButton.layer.shadowRadius = 10
        loginButton.layer.shouldRasterize = true
        loginButton.layer.rasterizationScale = UIScreen.main.scale
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
       // loginButton.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    //MARK: - RemindTextButton
    private lazy var remindTextButton: UIButton = {
        let remindTextButton = UIButton(type: .system)
        remindTextButton.setTitle("Forgot your password?", for: .normal)
        remindTextButton.setTitleColor(UIColor.white, for: .normal)
        remindTextButton.titleLabel?.font = UIFont(name: "Avenir-Next", size: 12)
        remindTextButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        //remindTextButton.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        remindTextButton.translatesAutoresizingMaskIntoConstraints = false
        return remindTextButton
    }()
    
    //MARK: - Connect
    private lazy var connectTextField: UITextField = {
        let connectTextField = UITextField()
        connectTextField.text = "or connect with"
        connectTextField.textAlignment = .center
        connectTextField.textColor = UIColor.gray
        connectTextField.backgroundColor = .white
        connectTextField.font = UIFont(name: "Avenir-Next", size: 10)
        connectTextField.font = UIFont.systemFont(ofSize: 10, weight: .light)
        connectTextField.layer.cornerRadius = 20
        //connectTextField.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        connectTextField.translatesAutoresizingMaskIntoConstraints = false
        return connectTextField
    }()
    
    //MARK: - Line
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.systemGray5
        //line.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //MARK: - FB button
    private lazy var faceBookButton: UIButton = {
        let faceBookButton = UIButton()
        faceBookButton.backgroundColor = .systemIndigo
        faceBookButton.setTitleColor(UIColor.white, for: .normal)
        faceBookButton.setTitle("Facebook", for: .normal)
        faceBookButton.setImage(UIImage(named: "facebook")?.withRenderingMode(.alwaysTemplate), for: .normal)
        faceBookButton.titleLabel?.font = UIFont(name: "Avenir-Next", size: 12)
        faceBookButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        faceBookButton.imageView?.contentMode = .scaleAspectFit
        faceBookButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 100)
        faceBookButton.tintColor = UIColor.white
        faceBookButton.layer.cornerRadius = 18
        faceBookButton.layer.shadowColor = UIColor.black.cgColor
        faceBookButton.layer.shadowOpacity = 0.3
        faceBookButton.layer.shadowOffset = .zero
        faceBookButton.layer.shadowRadius = 10
        faceBookButton.layer.shouldRasterize = true
        faceBookButton.layer.rasterizationScale = UIScreen.main.scale
        faceBookButton.addTarget(self, action: #selector(fbTapped), for: .touchUpInside)
        //faceBookButton.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        faceBookButton.translatesAutoresizingMaskIntoConstraints = false
        return faceBookButton
    }()
    
    //MARK: Twitter  button
    private lazy var twitterButton: UIButton = {
        let twitterButton = UIButton()
        twitterButton.backgroundColor = .systemBlue
        twitterButton.layer.cornerRadius = 18
        twitterButton.setTitle("Twitter", for: .normal)
        twitterButton.setTitleColor(UIColor.white, for: .normal)
        twitterButton.titleLabel?.font = UIFont(name: "Avenir-Next", size: 12)
        twitterButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        twitterButton.imageView?.contentMode = .scaleAspectFit
        twitterButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 100)
        twitterButton.setImage( UIImage(named: "twitter")?.withRenderingMode(.alwaysTemplate), for: .normal)
        twitterButton.tintColor = UIColor.white
        twitterButton.layer.shadowColor = UIColor.black.cgColor
        twitterButton.layer.shadowOpacity = 0.3
        twitterButton.layer.shadowOffset = .zero
        twitterButton.layer.shadowRadius = 10
        twitterButton.layer.shouldRasterize = true
        twitterButton.layer.rasterizationScale = UIScreen.main.scale
       // twitterButton.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        return twitterButton
    }()
    
    //MARK: account
    private lazy var accountTextField: UITextField = {
        let accountTextField = UITextField()
        accountTextField.text = "Don't have account?"
        accountTextField.textColor = UIColor.gray
        accountTextField.font = UIFont(name: "Avenir-Next", size: 14)
        accountTextField.font = UIFont.systemFont(ofSize: 10, weight: .light)
        //accountTextField.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        accountTextField.translatesAutoresizingMaskIntoConstraints = false
        return accountTextField
    }()
    
    //MARK: signUp
    private lazy var signUpTextView: UITextField = {
        let signUpTextView = UITextField()
        signUpTextView.text = "Sign up"
        signUpTextView.font = UIFont(name: "Avenir-Next", size: 14)
        signUpTextView.font = UIFont.systemFont(ofSize: 10, weight: .light)
        signUpTextView.attributedText(string: signUpTextView.text ?? "" )
        //signUpTextView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        signUpTextView.translatesAutoresizingMaskIntoConstraints = false
        return signUpTextView
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
        
    }
    
    //MARK: - Setups
    
    private func setupView(){
       // view.backgroundColor = .blue
    }
    
    private func setupHierarchy() {
        view.addSubview(background)
        view.addSubview(login)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(remindTextButton)
        view.addSubview(line)
        view.addSubview(connectTextField)
        view.addSubview(faceBookButton)
        view.addSubview(twitterButton)
        view.addSubview(accountTextField)
        view.addSubview(signUpTextView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250),
            
            loginTextField.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 20),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            loginTextField.heightAnchor.constraint(equalToConstant: 34),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45),
            loginButton.heightAnchor.constraint(equalToConstant: 34),
            //
            remindTextButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 25),
            remindTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            line.topAnchor.constraint(equalTo: remindTextButton.bottomAnchor, constant: 160),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 50),
            line.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            connectTextField.topAnchor.constraint(equalTo: remindTextButton.bottomAnchor, constant: 155),
            connectTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            connectTextField.heightAnchor.constraint(equalToConstant: 10),
            connectTextField.widthAnchor.constraint(equalToConstant: 100),
            
            faceBookButton.topAnchor.constraint(equalTo: connectTextField.bottomAnchor, constant: 30),
            faceBookButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35),
            faceBookButton.heightAnchor.constraint(equalToConstant: 34),
            faceBookButton.widthAnchor.constraint(equalToConstant: 150),
            
            twitterButton.topAnchor.constraint(equalTo: connectTextField.bottomAnchor, constant: 30),
            twitterButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35),
            twitterButton.heightAnchor.constraint(equalToConstant: 34),
            twitterButton.widthAnchor.constraint(equalToConstant: 150),
            
            accountTextField.topAnchor.constraint(equalTo: faceBookButton.bottomAnchor, constant: 35),
            accountTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 120),
            
            signUpTextView.topAnchor.constraint(equalTo: faceBookButton.bottomAnchor, constant: 35),
            signUpTextView.rightAnchor.constraint(equalTo: accountTextField.rightAnchor, constant: 45)
        ])
        
    }
    //MARK: - Actions
    @objc private func buttonTapped() {
        if let url = URL(string: "https://www.youtube.com/watch?v=7AzimrAgWbA") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    @objc private func fbTapped() {
        print("Не-а")
    }
//    
//    
//    @objc private func twitterTapped() {
//        if let url = URL(string: "https://www.youtube.com/watch?v=7AzimrAgWbA") {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
//    }
}



//MARK: - Extention

extension UITextField {
    func setLeftIcon(image: UIImage, color: UIColor) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.tintColor = color
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension UITextField {
    func setRightIcon(image: UIImage, color: UIColor) {
        let iconView = UIImageView(frame: CGRect(x: 100, y: 5, width: 20, height: 20))
        iconView.tintColor = color
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 130, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}
                            
extension UITextField {
    func attributedText(string: String) {
                
         let attributedArray: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.green]
                
        _ = NSAttributedString(string: string, attributes: attributedArray)
    }
}
