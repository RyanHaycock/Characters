//
//  CharacterInfoViewController.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

final class CharacterInfoViewController: UIViewController {
    
    typealias ViewModel = CharacterInfoViewModel
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .spacingToken(.padding)
        return stackView
    }()
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.setCornerRadius(.large, maskToBounds: true)
        imageView.backgroundColor = .palette(.missingImageColour)
        return imageView
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .spacingToken(.mediumPadding)
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .font(.heading, size: .heading)
        label.textColor = .palette(.primaryTextColour)
        label.textAlignment = .center
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .palette(.secondaryTextColour)
        label.textAlignment = .left
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .palette(.secondaryTextColour)
        label.textAlignment = .left
        return label
    }()
    
    private let spacer = UIStackView()
    
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { preconditionFailure("init(coder:) has not been implemented") }
}

// MARK: - Lifecycle

extension CharacterInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureFromViewModel(with: self.viewModel)
    }
}

// MARK: - Setup

extension CharacterInfoViewController {
    private func setup() {
        setupView()
        addSubviews()
        configureConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .palette(.primaryColour)
    }
    
    private func addSubviews() {
        view.addSubview(containerStackView)
        containerStackView.addArrangedSubviews([
            characterImageView,
            labelStackView,
            spacer
        ])
        labelStackView.addArrangedSubviews([
            nameLabel,
            speciesLabel,
            genderLabel
        ])
    }
    
    private func configureConstraints() {
        containerStackView.pin(.all, safelyTo: view, margins: .init(all: .spacingToken(.padding)))
        characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor).activated()
    }
}

// MARK: - Configure From View Model

extension CharacterInfoViewController {
    private func configureFromViewModel(with viewModel: ViewModel) {
        configureName(from: viewModel)
        configureSpecies(from: viewModel)
        configureGender(from: viewModel)
        configureImage(from: viewModel)
    }
    
    private func configureName(from viewModel: ViewModel) {
        nameLabel.text = viewModel.name
    }
    
    private func configureSpecies(from viewModel: ViewModel) {
        speciesLabel.isHidden = viewModel.species.isEmpty
        speciesLabel.attributedText = NSMutableAttributedString()
            .append("Species: ", font: .boldBody, size: .largeBody)
            .append(viewModel.species, font: .body, size: .largeBody)
    }
    
    private func configureGender(from viewModel: ViewModel) {
        genderLabel.isHidden = viewModel.gender.isEmpty
        genderLabel.attributedText = NSMutableAttributedString()
            .append("Gender: ", font: .boldBody, size: .largeBody)
            .append(viewModel.gender, font: .body, size: .largeBody)
    }
    
    private func configureImage(from viewModel: ViewModel) {
        characterImageView.setImage(with: viewModel.imageURL)
    }
}
