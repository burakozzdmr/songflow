//
//  LoadingView.swift
//  songflow
//
//  Created by Burak Özdemir on 1.03.2025.
//

import UIKit
import SnapKit

//MARK: - LoadingView

class LoadingView: UIView {
    
    //MARK: - Properties
    
    private let loadingIndicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.color = .init(named: Constants.primaryButtonColor)
        indicatorView.style = .large
        indicatorView.hidesWhenStopped = true
        indicatorView.startAnimating()
        return indicatorView
    }()
    
    //MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Privates

private extension LoadingView {
    func addViews() {
        self.addSubview(loadingIndicatorView)
    }
    
    func configureConstraints() {
        loadingIndicatorView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func configureUI() {
        self.backgroundColor = .black.withAlphaComponent(0.75)
        addViews()
        configureConstraints()
    }
}

#Preview {
    LoadingView()
}
