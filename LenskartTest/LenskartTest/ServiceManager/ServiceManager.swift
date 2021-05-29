//
//  ServiceManager.swift
//  LenskartTest
//
//  Created by Mac Admin on 29/05/21.
//

import Foundation

struct ServiceManager {
    func getData(completionHandler:@escaping(_ result: MoviesResponse?)-> Void) {
        let servicesHandler = ServiceHandler()
        servicesHandler.getApiData { (response) in
            let result = MoviesResponse(_dict: response ?? [])
            completionHandler(result)
        }
    }
}
