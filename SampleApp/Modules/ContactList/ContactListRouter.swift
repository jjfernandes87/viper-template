//
//  ContactListRouter.swift
//  SampleApp
//
//  Created by Julio Fernandes on 22/03/22.
//

import UIKit

final class ContactListRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension ContactListRouter: ContactListRouterProtocol {
    
    func showDetailContact(_ contact: ContactEntity) {
        guard let navigation = viewController?.navigationController else {
            return
        }
        
        let detailContact = DetailContactConfigurator()
        navigation.pushViewController(detailContact.createModule(contact: contact), animated: true)
    }
}
