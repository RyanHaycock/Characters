//
//  CharacterListViewController.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

final class CharacterListViewController: UIViewController {
    typealias ViewModel = CharacterListViewModelProtocol
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CharacterCell.self)
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: .spacingToken(.padding))
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .palette(.backgroundColour)
        return tableView
    }()
    
    private let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.palette(.primaryTextColour)]
        let attributedText = NSAttributedString(string: "Pull to reload", attributes: attributes)
        refreshControl.attributedTitle = attributedText
        refreshControl.tintColor = .palette(.primaryTextColour)
        return refreshControl
    }()
    
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { preconditionFailure("init(coder:) has not been implemented") }
}

// MARK: - Lifecycle

extension CharacterListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureFromViewModel()
    }
}

// MARK: - Setup

extension CharacterListViewController {
    private func setup() {
        setupView()
        setupTableView()
        addSubviews()
        configureConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .palette(.backgroundColour)
        title = viewModel.title
        refreshControl.addTarget(self, action: #selector(refreshCharacters), for: .valueChanged)
    }
    
    private func setupTableView() {
        tableView.dataSource = viewModel
        tableView.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        tableView.refreshControl = refreshControl
    }
    
    private func configureConstraints() {
        tableView.pin(.all, to: view)
    }
}

// MARK: - Actions

extension CharacterListViewController {
    @objc private func refreshCharacters() {
        loadCharactersFromViewModel()
    }
}

// MARK: - Configure From View Model

extension CharacterListViewController {
    private func configureFromViewModel() {
        setupOnReloadData()
        loadCharactersFromViewModel()
    }
    
    private func setupOnReloadData() {
        viewModel.onReloadData = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func loadCharactersFromViewModel() {
        viewModel.fetchCharacters { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
}

// MARK: - TableView Delegate

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.cellTapped(at: indexPath)
    }
}
