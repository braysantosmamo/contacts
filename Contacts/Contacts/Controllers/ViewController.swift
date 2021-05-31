//
//  ViewController.swift
//  Contacts
//
//  Created by Bray on 5/31/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var contactsViewModel : ContactsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callToViewModelForUIUpdate()
    }

    func callToViewModelForUIUpdate() {
        self.contactsViewModel = ContactsViewModel()

        self.contactsViewModel.bindContactsViewModelToController = {
            print(self.contactsViewModel.fconData.frequents[0].publicName)
            print(self.contactsViewModel.conData.mamoAccounts[1].publicName!)
        }
    }

}

