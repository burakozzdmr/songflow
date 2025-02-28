//
//  ViewController.swift
//  songflow
//
//  Created by Burak Özdemir on 28.02.2025.
//

import UIKit
import SnapKit

//MARK: - SplashViewController

class SplashViewController: UIViewController {

    //MARK: - Properties
    
    private let splashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: Constants.splash)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let loadingIndicatorView: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.color = .init(named: Constants.primaryButtonColor)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configureUI()
    }
}

//MARK: - Privates

private extension SplashViewController {
    func addViews() {
        view.addSubview(splashImageView)
        view.addSubview(loadingIndicatorView)
    }
    
    func configureConstraints() {
        splashImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(256)
        }
        
        loadingIndicatorView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(96)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .init(named: Constants.primaryBackgroundColor)
        addViews()
        configureConstraints()
    }
}

#Preview {
    SplashViewController()
}
