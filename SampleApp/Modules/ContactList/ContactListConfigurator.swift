//
//  ContactListConfigurator.swift
//  SampleApp
//
//  Created by Julio Fernandes on 22/03/22.
//

import UIKit

final class ContactListConfigurator {
        
    func createModule() -> UIViewController {
        let router = ContactListRouter()
        let interactor = ContactListInteractor()
        let presenter = ContactListPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = ContactListViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
