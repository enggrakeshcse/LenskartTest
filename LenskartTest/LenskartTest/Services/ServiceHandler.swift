//
//  ServiceClass.swift
//  LenskartTest
//
//  Created by Mac Admin on 29/05/21.
//

import Foundation

struct ServiceHandler
{
    func getApiData(completionHandler:@escaping(_ result: [[String: Any]]?)-> Void)
    {//MoviesResponse
        if let localData = self.readLocalFile(forName: "movies") {
            do {
                let dictJson = try JSONSerialization.jsonObject(with: localData, options: .mutableLeaves) as? [[String: Any]]
                _=completionHandler(dictJson)
            } catch _ {
                    
            }
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
}
