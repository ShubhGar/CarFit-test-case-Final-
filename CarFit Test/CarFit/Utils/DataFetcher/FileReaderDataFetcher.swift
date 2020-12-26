//
//  FileReaderDataFetcher.swift
//  CarFit
//
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation


class FileReaderDataFetcher: DataFetcherProtocol{
    //MARK:-  fetch json data from json file and convert to Codable object also give failure in case of error
    func requestData<T:Codable>(url: URL, completion: @escaping (ApiResult<T>) -> Void) {
        do {
            let jsonData = try Data(contentsOf: url, options: .dataReadingMapped)
            let decoder = JSONDecoder()
            if let jsonResult = try? decoder.decode(T.self, from: jsonData)
            {
                completion(ApiResult.success(jsonResult))
            }
            else if let jsonResult = try? decoder.decode([T].self, from: jsonData)
            {
                completion(ApiResult.successArray(jsonResult))
            }
            else{
                completion(ApiResult.failure(.invalidResponse))
            }
        }
        catch{
            completion(ApiResult.failure(.notFound))
        }
    }
    
    
    
}
