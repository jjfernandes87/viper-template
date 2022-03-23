//
//  DetailContactProtocols.swift
//  SampleApp
//
//  Created by Julio Fernandes on 23/03/22.
//

// MARK: - ViewController
protocol DetailContactPresenterOutputProtocol: AnyObject {
    func showData(contact: ContactEntity)
}

// MARK: - Presenter
protocol DetailContactPresenterInputProtocol: AnyObject {
    func fetchData()
    func didSendMessage()
    func calling()
    func faceTime()
    func sendMail()
}

// MARK: - Interactor
protocol DetailContactInteractorInputProtocol: AnyObject {
    func fetchData()
    func contactName() -> String
}

protocol DetailContactInteractorOutputProtocol: AnyObject {
    func didFetchData(_ contact: ContactEntity)
}

// MARK: - Router
protocol DetailContactRouterProtocol: AnyObject {

}
