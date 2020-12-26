//
//  CFUtils.swift
//  CarFit
//
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation

//MARK:- Get date from string according to given date formatte
func getDate(from string: String, formatter: String = "yyyy-MM-dd")-> Date? {
    let dateFormatter = getDateFormatter(formatter: formatter)
    return dateFormatter.date(from: string)
}

//MARK:- get dateformatter object of given formatte
func getDateFormatter(formatter: String = "yyyy-MM-dd")-> DateFormatter{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = formatter
    // can change time format, can use TimeZone.current.abbreviation() for device time format
    dateFormatter.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation() ?? "UTC")
    return dateFormatter
}
