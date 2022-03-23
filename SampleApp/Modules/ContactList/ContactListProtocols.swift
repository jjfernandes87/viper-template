//
//  ContactListProtocols.swift
//  SampleApp
//
//  Created by Julio Fernandes on 22/03/22.
//

import Foundation

// MARK: - ViewController
protocol ContactListPresenterOutputProtocol: AnyObject {
    func showData()
}

// MARK: - Presenter
protocol ContactListPresenterInputProtocol: AnyObject {
    func fetchData()
    func numberOfRowsInSection() -> Int
    func contactListForRowAt(_ indexPath: IndexPath) -> ContactEntity
    func didSelectRowAt(_ indexPath: IndexPath)
}

// MARK: - Interactor
protocol ContactListInteractorInputProtocol: AnyObject {
    func fetchData()
}

protocol ContactListInteractorOutputProtocol: AnyObject {
    func didFetchData(_ contactList: [ContactEntity])
}

// MARK: - Router
protocol ContactListRouterProtocol: AnyObject {
    func showDetailContact(_ contact: ContactEntity)
}
