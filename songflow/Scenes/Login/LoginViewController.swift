//
//  LoginViewController.swift
//  songflow
//
//  Created by Burak Özdemir on 28.02.2025.
//

import UIKit
import BYCustomTextField
import SnapKit

//MARK: - LoginViewController

class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    private let loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: Constants.splash)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var emailTextField: BYUnderlineTextField = {
        let textField = BYUnderlineTextField(
            placeholder: "E-Mail",
            alertMessage: "Invalid E-Mail",
            underlineColor: .white,
            characters: ["@", "."],
            textColor: .lightGray,
            leftIcon: "envelope.fill"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: BYUnderlineSecurityTextField = {
        let textField = BYUnderlineSecurityTextField(
            placeholder: "Password",
            alertMessage: "Invalid Password",
            underlineColor: .white,
            minCharacterCount: 6,
            textColor: .lightGray,
            leftIcon: "key.fill"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Password?"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(named: Constants.primaryButtonColor)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
        return stackView
    }()
    
    private let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var registerNowLabel: UILabel = {
        let label = UILabel()
        label.text = "Register Now"
        label.textColor = .init(named: Constants.primaryButtonColor)
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(registerNowTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
}

//MARK: - Privates

private extension LoginViewController {
    func addViews() {
        view.addSubview(loginImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(loginButton)
        view.addSubview(footerStackView)
        footerStackView.addArrangedSubview(dontHaveAccountLabel)
        footerStackView.addArrangedSubview(registerNowLabel)
    }
    
    func configureConstraints() {
        loginImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(64)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(128)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(loginImageView.snp.bottom).offset(64)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
        }
        
        forgotPasswordLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(48)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(forgotPasswordLabel.snp.bottom).offset(64)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(56)
        }
        
        footerStackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
    func configureUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        view.backgroundColor = .init(named: Constants.primaryBackgroundColor)
        addViews()
        configureConstraints()
    }
}

//MARK: - Objective-C Methods

private extension LoginViewController {
    @objc func forgotPasswordTapped() {
        
    }
    
    @objc func loginButtonTapped() {
        
    }
    
    @objc func registerNowTapped() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

#Preview {
    LoginViewController()
}
