//
//  ContactsViewModel.swift
//  Contacts
//
//  Created by Bray on 5/31/21.
//

import Foundation

class ContactsViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var conData : Contacts!; private(set) var fconData : FreqContacts! {
        didSet {
            self.bindContactsViewModelToController()
        }
    }
    
    var bindContactsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetContactsData()
    }
    
    func callFuncToGetContactsData() {
        self.apiService.apiToPostMamoContactsData { (conData) in
            self.conData = conData
        }
        
        self.apiService.apiToGetFreqContactsData { (fconData) in
            self.fconData = fconData
        }
    }
}
