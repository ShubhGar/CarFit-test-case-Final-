//
//  CleanerListViewModel.swift
//  CarFit
//  
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation

var cleanerListData:CleanerListModel?

protocol DataViewerProtocol:class {
    func updateData(cleaners:CleanerLists)
    func showError(message:String)
}

class CleanerListViewModel {
    private weak var delegate:DataViewerProtocol?
    private var dataFetcher: DataFetcherProtocol
    
    init(delegate:DataViewerProtocol) {
        self.delegate = delegate
        self.dataFetcher = FileReaderDataFetcher()
        self.fetchData()
    }
    
    //MARK:- Fetch data from file we can change it to netwok b just chaning URL and creating a network data fetcher
    private func fetchData(){
        if let path = Bundle.main.path(forResource: "carfit", ofType: "json") {
            self.dataFetcher.requestData(url: URL(fileURLWithPath: path)) { (result: ApiResult<CleanerListModel>) in
                switch result {
                case .success(let returnData) :
                    //Storing data in local variable
                    cleanerListData = returnData
                case .successArray(_):
                    break
                case .failure(_):
                    //TODO: Can show failure in Case of Network call
                    break
                }
            }
        }
    }
    
    //fetching data from local variable by filtering date
    func fetchData(for date: Date){
        if let cleaners = cleanerListData?.data?.filter({ (data) -> Bool in
            let startDate = getDate(from: data.startTimeUtc ?? "",formatter: "yyyy-MM-dd'T'HH:mm:ss")
            return startDate?.compare(date: date) ?? false
        }){
            self.delegate?.updateData(cleaners: cleaners)
        }
        else{
            self.delegate?.showError(message: "No Data Found")
        }
    }
    
}
