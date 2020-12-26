//
//  FileReader.swift
//  CarFit
//
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation


class FileReaderDataFetcher: DataFetcherProtocol{
    func requestData<T:Codable>(url: URL, completion: @escaping (ApiResult<T>) -> Void) {
        do {
            let jsonData = try Data(contentsOf: url, options: .dataReadingMapped)
            if let jsonResult: [String:Any] = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String:Any]
            {
                completion(ApiResult.success(jsonResult))
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
