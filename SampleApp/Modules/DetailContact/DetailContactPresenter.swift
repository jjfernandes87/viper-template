//
//  DetailContactPresenter.swift
//  SampleApp
//
//  Created by Julio Fernandes on 23/03/22.
//

import Foundation

final class DetailContactPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: DetailContactPresenterOutputProtocol?
    private let router: DetailContactRouterProtocol
    private let interactor: DetailContactInteractorInputProtocol
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(router: DetailContactRouterProtocol,
         interactor: DetailContactInteractorInputProtocol) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
    private func log(_ message: String) {
        print(String(repeating: "=", count: 50))
        print(">> \(message) \(interactor.contactName())")
        print(String(repeating: "=", count: 50))
        print("\n")
    }
}

// MARK: - Input Protocol
extension DetailContactPresenter: DetailContactPresenterInputProtocol {
    func fetchData() {
        interactor.fetchData()
    }
}

// MARK: - Output Protocol
extension DetailContactPresenter: DetailContactInteractorOutputProtocol {
    func didFetchData(_ contact: ContactEntity) {
        viewController?.showData(contact: contact)
    }
    
    func didSendMessage() {
        log("Send a message to")
    }
    
    func calling() {
        log("Calling to")
    }
    
    func faceTime() {
        log("Start a Face Time to")
    }
    
    func sendMail() {
        log("Send email to")
    }
}
