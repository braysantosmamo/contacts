//
//  APIService.swift
//  Contacts
//
//  Created by Bray on 5/31/21.
//

import Foundation

class APIService : NSObject {
    private let freqSourcesURL = URL(string: "https://60adf30580a61f001733208d.mockapi.io/api/v2/frequents")!
    private let mamoSourcesURL = URL(string: "https://60adf30580a61f001733208d.mockapi.io/api/v2/accounts")!
        
    func apiToGetFreqContactsData(completion : @escaping (FreqContacts) -> ()){
        URLSession.shared.dataTask(with: freqSourcesURL) { (data, urlResponse, error) in
            if let data = data {
                    
                let jsonDecoder = JSONDecoder()
                    
                let fconData = try! jsonDecoder.decode(FreqContacts.self, from: data)
                    completion(fconData)
            }
        }.resume()
    }
    
    func apiToPostMamoContactsData(completion : @escaping (Contacts) -> ()){
        
        var request = URLRequest(url: mamoSourcesURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // HARDCODED SINCE API RETURNS HAS NO CHANGE EVEN IF BODY HAS BEEN CHANGE
        let json = [
            "emails" : [
                "clara.j.hamel@yahoo.com",
                "Paul.Hamilton@gmail.com",
                "Tanya.bell@gmail.com",
                "Terrellgraham@gmail.com",
                "Yolandacaldwell@gmail.com"
              ],
              "phones" : [
                "+971545554223",
                "+971502090761",
                "+971545558080",
                "+971502060971",
                "+971502060981"
              ]
        ]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        URLSession.shared.uploadTask(with: request, from: jsonData, completionHandler: { data, urlResponse, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let conData = try! jsonDecoder.decode(Contacts.self, from: data)
                    completion(conData)
            }
        }).resume()
    }
}
