//
//  CharacterListViewModel.swift
//  Characters
//
//  Created by Ryan Haycock on 22/02/2023.
//

import UIKit

protocol CharacterListViewModelProtocol: UITableViewDataSource {
    var title: String { get }
    var characters: [Character] { get }
    
    var onReloadData: (() -> Void)? { get set }
    var onCharacterTapped: ((Character) -> Void)? { get set }
    
    func fetchCharacters(completion: @escaping () -> Void)
    func cellTapped(at indexPath: IndexPath)
}

final class CharacterListViewModel: NSObject, CharacterListViewModelProtocol {
    
    let title: String = "Rick and Morty Characters"
    
    private(set) var characters: [Character] = []
    
    var onReloadData: (() -> Void)?
    var onCharacterTapped: ((Character) -> Void)?
    
    func fetchCharacters(completion: @escaping () -> Void) {
        Env.characterService.fetchCharacters { [weak self] result in
            defer {
                completion()
            }
            
            switch result {
            case .success(let characters):
                guard characters != self?.characters else { return }
                self?.characters = characters
                self?.onReloadData?()
                
            case .failure(let error):
                print(error) // TODO: add logging to avoid printing in production
            }
        }
    }
    
    func cellTapped(at indexPath: IndexPath) {
        let character = characters[indexPath.row]
        onCharacterTapped?(character)
    }
}

// MARK: - TableView Data Source

extension CharacterListViewModel {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CharacterCell = tableView.dequeueReusableCell(for: indexPath)
        let character = characters[indexPath.row]
        let viewModel = CharacterCell.ViewModel(character: character)
        cell.configure(with: viewModel)
        return cell
    }
}
