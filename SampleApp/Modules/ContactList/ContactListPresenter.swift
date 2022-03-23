//
//  ContactListPresenter.swift
//  SampleApp
//
//  Created by Julio Fernandes on 22/03/22.
//

import Foundation

final class ContactListPresenter {
    
    // MARK: - Viper Properties
    weak var viewController: ContactListPresenterOutputProtocol?
    private let router: ContactListRouterProtocol
    private let interactor: ContactListInteractorInputProtocol
    
    // MARK: - Private Properties
    var contactList: [ContactEntity] = []
    
    // MARK: - Inits
    init(router: ContactListRouterProtocol,
         interactor: ContactListInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
        
}

// MARK: - Input Protocol
extension ContactListPresenter: ContactListPresenterInputProtocol {
    func fetchData() {
        interactor.fetchData()
    }
}

// MARK: - Output Protocol
extension ContactListPresenter: ContactListInteractorOutputProtocol {
    
    func didFetchData(_ contactList: [ContactEntity]) {
        self.contactList = contactList
        viewController?.showData()
    }
    
    func numberOfRowsInSection() -> Int {
        return contactList.count
    }
    
    func contactListForRowAt(_ indexPath: IndexPath) -> ContactEntity {
        return contactList[indexPath.row]
    }
    
    func didSelectRowAt(_ indexPath: IndexPath) {
        router.showDetailContact(contactList[indexPath.row])
    }
}
