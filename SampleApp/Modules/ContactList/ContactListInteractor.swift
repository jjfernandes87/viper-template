//
//  ContactListInteractor.swift
//  SampleApp
//
//  Created by Julio Fernandes on 22/03/22.
//

final class ContactListInteractor {
    
    // MARK: - VIPER Properties
    weak var output: ContactListInteractorOutputProtocol?

    // MARK: - Private Properties
    let contactListResponse: [ContactEntity] = [
        ContactEntity(name: "Ronald Robertson", phone: "+55 (11) 99999-9999"),
        ContactEntity(name: "Johnny Watson", phone: "+55 (11) 99999-9999"),
        ContactEntity(name: "Annette Cooper", phone: "+55 (11) 99999-9999"),
        ContactEntity(name: "Arthur Bell", phone: "+55 (11) 99999-9999"),
        ContactEntity(name: "Jane Warren", phone: "+55 (11) 99999-9999"),
        ContactEntity(name: "Morris Henry", phone: "+55 (11) 99999-9999"),
        ContactEntity(name: "Irma Flores", phone: "+55 (11) 99999-9999"),
    ]
    
}

// MARK: - Input Protocol
extension ContactListInteractor: ContactListInteractorInputProtocol {

    func fetchData() {
        output?.didFetchData(contactListResponse)
    }
    
}
