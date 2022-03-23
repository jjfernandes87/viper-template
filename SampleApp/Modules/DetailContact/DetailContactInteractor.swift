//
//  DetailContactInteractor.swift
//  SampleApp
//
//  Created by Julio Fernandes on 23/03/22.
//

final class DetailContactInteractor {
    
    // MARK: - VIPER Properties

    weak var output: DetailContactInteractorOutputProtocol?

    // MARK: - Private Properties
    private let contact: ContactEntity
    
    // MARK: - Inits
    init(contact: ContactEntity) {
        self.contact = contact
    }
 
}

// MARK: - Input Protocol
extension DetailContactInteractor: DetailContactInteractorInputProtocol {

    func fetchData() {
        output?.didFetchData(contact)
    }
    
    func contactName() -> String {
        return contact.name
    }
}
