//
//  DetailContactConfigurator.swift
//  SampleApp
//
//  Created by Julio Fernandes on 23/03/22.
//

import UIKit

final class DetailContactConfigurator {
        
    func createModule(contact: ContactEntity) -> UIViewController {
        let router = DetailContactRouter()
        let interactor = DetailContactInteractor(contact: contact)
        let presenter = DetailContactPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = DetailContactViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
