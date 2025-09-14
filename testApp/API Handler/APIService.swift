//
//  APIService.swift
//  testApp
//
//  Created by Esakki - iOS on 13/09/25.
//

import UIKit
import Foundation
import SwiftyJSON
import Alamofire

public typealias LocalJSONObject = JSON
public typealias Parameters = [String: Any]

protocol baseSwiftyJSON {
    init(json: LocalJSONObject)
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.metricinfo.com/api/Client/"
    
    private init() {}
    
    //MARK: Alamofire API Call (GET)
    
    func APIRequest<T: baseSwiftyJSON>(endPoints: String, Method: HTTPMethod, Parameters: Parameters? = nil, completion: @escaping(Result<T, Error>) -> Void){
        
        let urlString = baseURL + endPoints
        guard let URL = URL(string: urlString) else {
            debugPrint("InVaild URL")
            return
        }
        let headers: HTTPHeaders = [
            "Travelize_Authentication": "P/xgewt8+bhG6xYVveE+lLIjQSIKaUnoj9f8NHYHqQo8uz/gpTuRBMDBZhpDm6QuLgamO/z/X6HgJT5NFtUSV9hTc7a/EtuKRXwzbtt8jXe2epiA5dOkebouO8Hl5QM4+lhHngEiz1RHQ47tc1jTVIDBU7WHCtvJPFex/ez13NB+TTXptqHAse8K9vZ4FsWNXcV4gCQL+FJg2c2pCUQNmLe9pCqYbt5iGggMYOkquaMovrlI3mKRtwX8X04nJeBGnjKPaje51a7UUCBuJigfiUbc1kIY4gyafNWxhCVl80CZ4/3lHjaNYIhxgf0aUWOQ",
            "Accept": "application/json"
        ]
        AF.request(URL, parameters: Parameters, headers: headers).response(queue: DispatchQueue.main, completionHandler: { (AFResponseData) in
            switch AFResponseData.result {
            case .success(let data):
                guard let jsonResult = self.dataToJSON(data: data ?? Data()) else { return }
                let jsonValue = LocalJSONObject(jsonResult)
                let jsonInit = T.init(json: jsonValue)
                completion(.success(jsonInit))
                debugPrint("\(jsonValue)")
                break
            case .failure(let error):
                completion(.failure(error))
                debugPrint("\(error)")
                break
            }
        })
    }
    
    func dataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
}




