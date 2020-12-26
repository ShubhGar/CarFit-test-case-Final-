//
//  HomeViewModel.swift
//  CarFit
//  
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation

protocol DataViewerProtocol:class {
    func updateData(users:UserViewModels)
    func showError(message:String)
}

class CleanerListViewModel {
    private var dataFetcher: DataFetcherProtocol
    init() {
        self.dataFetcher = FileReader()
    }
    func fetchData(){
        if let path = Bundle.main.path(forResource: "carfit", ofType: "json") {
            self.dataFetcher.requestData(path: path) { (result) in
                
            }
        }
    }
}
