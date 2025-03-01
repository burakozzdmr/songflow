//
//  RegisterViewController.swift
//  songflow
//
//  Created by Burak Özdemir on 28.02.2025.
//

import UIKit
import BYCustomTextField
import SnapKit

//MARK: - RegisterViewController

class RegisterViewController: UIViewController {

    //MARK: - Properties
    
    private let registerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: Constants.splash)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var nameTextField: BYUnderlineTextField = {
        let textField = BYUnderlineTextField(
            placeholder: "Full name",
            alertMessage: "Invalid E-Mail",
            underlineColor: .white,
            characters: ["@", "."],
            textColor: .lightGray,
            leftIcon: "person.text.rectangle.fill"
        )
        textField.delegate = self
        return textField
    }()
    
    private lazy var usernameTextField: BYUnderlineTextField = {
        let textField = BYUnderlineTextField(
            placeholder: "User Name",
            alertMessage: "Invalid E-Mail",
            underlineColor: .white,
            characters: ["@", "."],
            textColor: .lightGray,
            leftIcon: "person.fill"
        )
        textField.delegate = self
        return textField
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
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(named: Constants.primaryButtonColor)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return button
    }()
    
    private let viewModel: RegisterViewModel
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    init(viewModel: RegisterViewModel = .init()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Privates

private extension RegisterViewController {
    func addViews() {
        view.addSubview(registerImageView)
        view.addSubview(nameTextField)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
    }
    
    func configureConstraints() {
        registerImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(64)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(128)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(registerImageView.snp.bottom).offset(64)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
        }
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
        }
        
        registerButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(64)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(56)
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

private extension RegisterViewController {
    @objc func registerTapped() {
        viewModel.register(with: emailTextField.text ?? "", and: passwordTextField.text ?? "") { [weak self] authError in
            guard let self else { return }
            if authError != nil {
                let alertController = UIAlertController(
                    title: "HATA",
                    message: "Kayıt işlemi başarısız",
                    preferredStyle: .alert
                )
                alertController.addAction(
                    UIAlertAction(title: "Tamam", style: .default)
                )
                self.present(alertController, animated: true)
            } else {
                if nameTextField.text != "", usernameTextField.text != "" {
                    self.navigationController?.pushViewController(RegisterResultViewController(), animated: true)
                } else {
                    let alertController = UIAlertController(
                        title: "HATA", message: "Tüm alanların doldurulması zorunludur.", preferredStyle: .alert
                    )
                    alertController.addAction(
                        UIAlertAction(title: "Tamam", style: .default)
                    )
                    self.present(alertController, animated: true)
                }
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

#Preview {
    RegisterViewController()
}
