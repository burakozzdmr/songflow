//
//  RegisterResultViewController.swift
//  songflow
//
//  Created by Burak Özdemir on 28.02.2025.
//

import UIKit
import SnapKit

//MARK: - RegisterResultViewController

class RegisterResultViewController: UIViewController {

    //MARK: - Properties
    
    private let successImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: Constants.successmark)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let thatsItLabel: UILabel = {
        let label = UILabel()
        label.text = "That's it!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let registerMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Register process is successfully"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back to Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .init(named: Constants.primaryButtonColor)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(backLoginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
}

//MARK: - Privates

private extension RegisterResultViewController {
    func addViews() {
        view.addSubview(successImageView)
        view.addSubview(thatsItLabel)
        view.addSubview(registerMessageLabel)
        view.addSubview(backToLoginButton)
    }
    
    func configureConstraints() {
        successImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(160)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(128)
        }
        
        thatsItLabel.snp.makeConstraints {
            $0.top.equalTo(successImageView.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        registerMessageLabel.snp.makeConstraints {
            $0.top.equalTo(thatsItLabel.snp.bottom).offset(48)
            $0.centerX.equalToSuperview()
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.top.equalTo(registerMessageLabel.snp.bottom).offset(64)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(56)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .init(named: Constants.primaryBackgroundColor)
        addViews()
        configureConstraints()
    }
}

//MARK: - Objective-C Methods

private extension RegisterResultViewController {
    @objc func backLoginButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}

#Preview {
    RegisterResultViewController()
}
