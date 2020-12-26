//
//  HomeCellViewModel.swift
//  CarFit
//
//  Created by shubham Garg on 07/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class HomeCellViewModel {
    var cleaner:CleanerListData
    var previousService:CleanerListData?
    init(cleaner:CleanerListData, previousService:CleanerListData? = nil) {
        self.cleaner = cleaner
        self.previousService = previousService
    }
    
    var customerName: String{
        return (cleaner.houseOwnerFirstName ?? "") + " " + (cleaner.houseOwnerLastName ?? "")
    }
    
    var visitState: VisitState{
        switch cleaner.visitState?.lowercased() {
        case "Done":
            visitStateColor = .doneOption
            return .Done
        case "inprogress" :
            visitStateColor = .inProgressOption
            return .InProgress
        case "rejected":
            visitStateColor = .rejectedOption
            return .Rejected
        default:
            visitStateColor = .todoOption
            return .ToDo
        }
    }
    //Visit color is depend upon visit state
    var visitStateColor:UIColor = UIColor.todoOption
    
    var startTime:String{
        let startDate = getDate(from: cleaner.startTimeUtc ?? "",formatter: "yyyy-MM-dd'T'HH:mm:ss")
        return startDate?.toTimeString ?? ""
    }
    
    var expectedTime:String{
        return cleaner.expectedTime ?? ""
    }
    
    var address: String{
        let city = (cleaner.houseOwnerZip ?? "") +  " " + (cleaner.houseOwnerCity ?? "")
        return (cleaner.houseOwnerAddress ?? "") + " " + city
    }
    
    var tasks: String{
        return cleaner.tasks?.reduce("") { $0 + (" " + ($1.title ?? ""))} ?? ""
    }
    
    var totalTime: String{
        return "\(cleaner.tasks?.reduce(0) { $0 + ($1.timesInMinutes ?? 0)} ?? 0)"
    }
    
    var distance:String{
        if let previousLocation = previousService{
            // find distance between 2 coordinates
            let coordinate₀ = CLLocation(latitude: previousLocation.houseOwnerLatitude ?? 0, longitude: previousLocation.houseOwnerLongitude ?? 0)
                   let coordinate₁ = CLLocation(latitude: cleaner.houseOwnerLatitude ?? 0, longitude: cleaner.houseOwnerLongitude ?? 0)
                   let distance = coordinate₀.distance(from: coordinate₁)/100
                   return "\(Double(round(distance)/10)) Km"
        }
       return "0 Km"
    }
}
