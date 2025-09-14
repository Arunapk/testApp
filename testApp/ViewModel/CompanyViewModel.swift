//
//  CompanyViewModel.swift
//  testApp
//
//  Created by Esakki - iOS on 14/09/25.
//


import UIKit
import Foundation
import Combine

class CompanyViewModel{
    
    @Published var clientResponse: ClientResponse?
    public var cancelable = Set<AnyCancellable>()
    
    //Get?UserId=USR5021&PageSize=1000&CurrentPage=1&EnabledStatus=1
    
    func fetchData(user_id: String, page_size: Int, current_page: Int, enabled_status: Int){
        let endPointUrl = "Get?UserId=\(user_id)&PageSize=\(page_size)&CurrentPage=\(current_page)&EnabledStatus=\(enabled_status)"
        NetworkManager.shared.APIRequest(endPoints: endPointUrl, Method: .get, completion: { [weak self]  (result: Result<ClientResponse, Error>) in
            switch result{
            case .success(let value):
                self?.clientResponse = value
                break
            case .failure(let error):
                debugPrint(error)
                break
            }
        })
        
    }
    
}
