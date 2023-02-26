//
//  CharacterCell.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

final class CharacterCell: UITableViewCell, ReusableView {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .palette(.primaryColour)
        view.setCornerRadius(.large, maskToBounds: true)
        return view
    }()
    
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = .spacingToken(.padding)
        return stackView
    }()
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.setCornerRadius(.medium, maskToBounds: true)
        imageView.backgroundColor = .palette(.missingImageColour)
        return imageView
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .spacingToken(.minorPadding)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(vertical: 8)
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .font(.subheading, size: .subheading)
        label.textColor = .palette(.primaryTextColour)
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .palette(.secondaryTextColour)
        return label
    }()
    
    private let genderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .palette(.secondaryTextColour)
        return label
    }()
    
    private let spacer = UIStackView()
    
    private var viewModel: ViewModel?
    private var pendingImageRequest: Cancellable?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { preconditionFailure("init(coder:) has not been implemented") }
}

// MARK: - Setup

extension CharacterCell {
    private func setup() {
        setupView()
        addSubviews()
        configureConstraints()
    }
    
    private func setupView() {
        backgroundColor = .palette(.backgroundColour)
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(containerStackView)
        containerStackView.addArrangedSubviews([
            characterImageView,
            labelStackView
        ])
        labelStackView.addArrangedSubviews([
            nameLabel,
            speciesLabel,
            genderLabel,
            spacer
        ])
    }
    
    private func configureConstraints() {
        configureContainerViewConstraints()
        configureContainerStackViewConstraints()
        configureImageViewConstraints()
    }
    
    private func configureContainerViewConstraints() {
        let containerMargins = UIEdgeInsets(
            horizontal: .spacingToken(.padding),
            vertical: .spacingToken(.minorPadding)
        )
        containerView.pin(.all, to: contentView, margins: containerMargins)
    }
    
    private func configureContainerStackViewConstraints() {
        containerStackView.pin(.all, to: containerView)
    }
    
    private func configureImageViewConstraints() {
        characterImageView.widthAnchor.constraint(equalToConstant: 140).activated()
        characterImageView.heightAnchor.constraint(equalTo: characterImageView.widthAnchor).activated()
    }
}

// MARK: - Lifecycle

extension CharacterCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        self.viewModel = nil
        self.characterImageView.image = nil
        self.pendingImageRequest?.cancel()
        self.pendingImageRequest = nil
    }
}

// MARK: - Configure From View Model

extension CharacterCell {
    func configure(with viewModel: ViewModel) {
        guard viewModel != self.viewModel else { return }
        self.viewModel = viewModel
        
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
        speciesLabel.text = "Species: \(viewModel.species)"
        speciesLabel.attributedText = NSMutableAttributedString()
            .append("Species: ", font: .boldBody, size: .body)
            .append(viewModel.species, font: .body, size: .body)
    }
    
    private func configureGender(from viewModel: ViewModel) {
        genderLabel.isHidden = viewModel.gender.isEmpty
        genderLabel.attributedText = NSMutableAttributedString()
            .append("Gender: ", font: .boldBody, size: .body)
            .append(viewModel.gender, font: .body, size: .body)
    }
    
    private func configureImage(from viewModel: ViewModel) {
        self.pendingImageRequest = characterImageView.setImage(with: viewModel.imageURL)
    }
}

// MARK: - Cell Highlight

extension CharacterCell {
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            containerView.backgroundColor = .palette(.tintColour)
        } else {
            containerView.backgroundColor = .palette(.primaryColour)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            containerView.backgroundColor = .palette(.tintColour)
        } else {
            containerView.backgroundColor = .palette(.primaryColour)
        }
    }
}
