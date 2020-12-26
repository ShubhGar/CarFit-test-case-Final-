//
//  Date+Extentions.swift
//  CarFit
//
//  Created by shubham Garg on 06/09/20.
//  Copyright © 2020 Test Project. All rights reserved.
//

import Foundation


extension Date{
    //MARK:- month of given date
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    
    //MARK:- week day of given date
    var weekDay: String{
        let dateFormatter = getDateFormatter(formatter: "EEE")
        return dateFormatter.string(from: self)
    }
    
    //MARK:- year of given date
    var year: Int {
        return Calendar.current.component(.year,  from: self)
    }
    
    //MARK:- day of given date
    var day: Int {
        return Calendar.current.component(.day,  from: self)
    }
    
    //MARK:- next month date from given date
    var nextMonth: Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    
    //MARK:- previous month date from given date
    var previousMonth: Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
    //MARK:- name of month of given date
    var nameOfMonth: String{
        let dateFormatter = getDateFormatter(formatter: "MMM")
        return dateFormatter.string(from: self)
    }
    
    //MARK:- check current month and month of given date is same
    var isCurrentMonth: Bool{
        let now = Date()
        return self.month == now.month && self.year == now.year
    }
    
    //MARK:- start date of given month
    var startOfMonth: Date? {
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: comp)!
    }
    
    //MARK:- last date of given month
    var  endOfMonth: Date? {
        var comps = DateComponents()
        comps.month = 1
        comps.day = -1
        return Calendar.current.date(byAdding: comps, to: startOfMonth ?? self)
    }
    
    //MARK:- convert date to string
    var toString: String{
        let dateFormatter = getDateFormatter()
        return dateFormatter.string(from: self)
    }
    
    //MARK:- convert date to time
    var toTimeString: String{
        let dateFormatter = getDateFormatter(formatter: "HH:mm")
        return dateFormatter.string(from: self)
    }
    
    //MARK:- compare date to given date
    func compare(date: Date)-> Bool{
         return self.day == date.day && self.month == date.month && self.year == date.year
    }
    
}
