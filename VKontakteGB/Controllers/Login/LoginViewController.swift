//
//  ViewController.swift
//  VKontakteGB
//
//  Created by Mark Nevmerzhitskiy on 25.01.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - Public Properties
    
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let labelApplication: UILabel = {
        let label = UILabel()
        label.text = "VKontakte"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = .systemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginField: UITextField = {
        let log = UITextField()
        log.borderStyle = .roundedRect
        log.placeholder = "Enter your number phone or email"
        log.translatesAutoresizingMaskIntoConstraints = false
        return log
    }()
    
    private let passwordField: UITextField = {
        let pass = UITextField()
        pass.borderStyle = .roundedRect
        pass.placeholder = "Enter your password"
        pass.isSecureTextEntry = true
        pass.translatesAutoresizingMaskIntoConstraints = false
        return pass
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonWebVersion: UIButton = {
        let button = UIButton()
        button.setTitle("Go to web version", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraintes()
        logInButton.addTarget(nil, action: #selector(checkLog), for: .touchUpInside)
        buttonWebVersion.addTarget(nil, action: #selector(visitWebSite), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWilBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - OBJC Method
    
    @objc func checkLog() {
        
        if loginField.text == "1" && passwordField.text == "1" {
            let vc = MainTabBarController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            print("Succes!")
        } else {
            print("Error!Warning!")
        }
    }
    
    @objc func visitWebSite() {
        print("Welcome to web version")
    }
    
    @objc func keyboardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        
        self.scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWilBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
}

//MARK: - Setup Constraints

extension LoginViewController {
    
    func setupConstraintes() {
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        scrollView.addSubview(labelApplication)
        NSLayoutConstraint.activate([
            labelApplication.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            labelApplication.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            labelApplication.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            labelApplication.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        scrollView.addSubview(loginField)
        NSLayoutConstraint.activate([
            loginField.topAnchor.constraint(equalTo: labelApplication.bottomAnchor, constant: 60),
            loginField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            loginField.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        scrollView.addSubview(passwordField)
        NSLayoutConstraint.activate([
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 25),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordField.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        scrollView.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 45),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            logInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        scrollView.addSubview(buttonWebVersion)
        NSLayoutConstraint.activate([
            buttonWebVersion.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 70),
            buttonWebVersion.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            buttonWebVersion.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            buttonWebVersion.heightAnchor.constraint(equalToConstant: 40),
            buttonWebVersion.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40 )
        ])
        
    }
}

