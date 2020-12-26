//
//  CleanerListModel.swift
//  CarFit
//
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation

struct CleanerListModel:Codable {
    var data: CleanerLists?
}

struct CleanerListData: Codable {
    var visitId: String?
    var houseOwnerFirstName: String?
    var houseOwnerLastName: String?
    var visitState:String?
    var startTimeUtc: String?
    var expectedTime: String?
    var houseOwnerAddress: String?
    var houseOwnerZip: String?
    var houseOwnerCity: String?
    var houseOwnerLatitude: Double?
    var houseOwnerLongitude: Double?
    var tasks:[Tasks]?
}

struct Tasks: Codable{
    var taskId: String?
    var title: String?
    var timesInMinutes: Int?
    var price: Double?
}

enum VisitState:String, Codable{
    case ToDo
    case InProgress
    case Done
    case Rejected
}

typealias CleanerLists = [CleanerListData]
