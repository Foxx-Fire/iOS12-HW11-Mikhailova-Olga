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
    //MARK: - Outlets UI
    
    //MARK: - ViewBackground
    // так понимаю в констрейнты данную вьюху не надо добавлять или надо?
    private lazy var background: UIView = {
        let background = UIView()//(frame: CGRect(x: 0, y: 0, width: 320, height: 0))
        let gradient = CAGradientLayer()

        gradient.frame = view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.systemPink.cgColor, UIColor.white.cgColor]

        background.layer.insertSublayer(gradient, at: 0)
        
        //background.contentMode = .scaleAspectFit
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
        // Поискала как делать чтоб все было на местах при повороте экрана - мало что поняла, а это не работает потому что мы их отключили вероятно... и как тогда быть?
        // Еще есть некий загадочный Autoloyaut с которвм не поняла как работать - в принципе что это? - констрейнты что ли...?
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
        connectTextField.translatesAutoresizingMaskIntoConstraints = false
        return connectTextField
    }()
    
    //MARK: - Line
    // так себе решение - не знаю как придумать лучше - две линии что ли делать надо?
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.systemGray5
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //MARK: - FB button
    private lazy var faceBookButton: UIButton = {
        let faceBookButton = UIButton(type: .system)
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
        faceBookButton.addTarget(self, action: #selector(messengersTapped), for: .touchUpInside)
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
        twitterButton.addTarget(self, action: #selector(messengersTapped), for: .touchUpInside)
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
        signUpTextView.translatesAutoresizingMaskIntoConstraints = false
        return signUpTextView
    }()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveContentUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //скрыть клавиатуру
        let tapGuesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tapGuesture)
        
//        NotificationCenter.default.addObserver(self, selector: #selector(moveContentBack), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Setups
    
    private func createGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(gesture)
    }
    private func setupView(){
      
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
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
//            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            login.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            login.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            login.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            login.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            login.widthAnchor.constraint(equalToConstant: 60),
            login.heightAnchor.constraint(equalToConstant: 35),
            
            loginTextField.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 45),
            //loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            loginTextField.heightAnchor.constraint(equalToConstant: 38),
            loginTextField.widthAnchor.constraint(equalToConstant: 120),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            passwordTextField.heightAnchor.constraint(equalToConstant: 38),
            passwordTextField.widthAnchor.constraint(equalToConstant: 120),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 45),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
           
            remindTextButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            remindTextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            remindTextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            remindTextButton.heightAnchor.constraint(equalToConstant: 18),
            remindTextButton.widthAnchor.constraint(equalToConstant: 40),
            
            line.topAnchor.constraint(equalTo: remindTextButton.bottomAnchor, constant: 190),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.widthAnchor.constraint(equalToConstant: 50),
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            connectTextField.topAnchor.constraint(equalTo: remindTextButton.bottomAnchor, constant: 185),
            connectTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 130),
            connectTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            connectTextField.heightAnchor.constraint(equalToConstant: 10),
            connectTextField.widthAnchor.constraint(equalToConstant: 100),
            
            faceBookButton.topAnchor.constraint(equalTo: connectTextField.bottomAnchor, constant: 45),
            faceBookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            //faceBookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -220),
            faceBookButton.heightAnchor.constraint(equalToConstant: 34),
            faceBookButton.widthAnchor.constraint(equalToConstant: 150),
            
            twitterButton.topAnchor.constraint(equalTo: connectTextField.bottomAnchor, constant: 45),
           //twitterButton.leadingAnchor.constraint(equalTo: faceBookButton.trailingAnchor, constant: 300),
           // twitterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220),
            twitterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            twitterButton.heightAnchor.constraint(equalToConstant: 34),
            twitterButton.widthAnchor.constraint(equalToConstant: 150),
            
            accountTextField.topAnchor.constraint(equalTo: faceBookButton.bottomAnchor, constant: 45),
            accountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            accountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            accountTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            
            signUpTextView.topAnchor.constraint(equalTo: faceBookButton.bottomAnchor, constant: 45),
            signUpTextView.rightAnchor.constraint(equalTo: accountTextField.rightAnchor, constant: 15),
            signUpTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            signUpTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
        
    }
    //MARK: - Actions
    @objc private func buttonTapped() {
        if let url = URL(string: "https://www.youtube.com/watch?v=7AzimrAgWbA") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // почему-то не отрабатывает принт
    @objc private func messengersTapped() {
        print("Надеемся, у вас есть VPN")
    }
    
    // так не срабатывает убрать клавиатуру(((
    @objc private func viewTapped() {
        view.endEditing(true)
    }
    
    // но я нашла нечто другое и более замороченное - это вообще то что нужно?
    @objc private func moveContentUp(notification: NSNotification) {
        let userInfo = notification.userInfo
        let keyboardFrame = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        let keyboardHeight = keyboardFrame!.size.height
        let emptySpaceHight = view.frame.size.height - remindTextButton.frame.origin.y - remindTextButton.frame.size.height
        let coveredContentHeight = keyboardHeight - emptySpaceHight
        view.frame.origin.y = -coveredContentHeight
        
    }
    
    @objc private func moveContentBack(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}


