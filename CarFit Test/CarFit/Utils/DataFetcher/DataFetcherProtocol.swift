//
//  DataFetcherProtocol.swift
//  CarFit
//
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation

protocol DataFetcherProtocol {
    func requestData<T:Codable>(url:URL, completion: @escaping (ApiResult<T>)->Void)
}

enum ApiResult<T:Codable> {
    case success(T)
    case successArray([T])
    case failure(RequestError)
}

enum RequestError: Error {
      case unknownError
      case authorizationError(Any)
      case invalidRequest
      case notFound
      case invalidResponse
  }
