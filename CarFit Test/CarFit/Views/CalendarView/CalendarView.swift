//
//  CalendarView.swift
//  Calendar
//
//  Test Project
//

import UIKit

protocol CalendarDelegate: class {
    func getSelectedDate(_ date: Date)
}

class CalendarView: UIView {
    
    @IBOutlet weak var monthAndYear: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var daysCollectionView: UICollectionView!
    private let cellID = "DayCell"
    weak var delegate: CalendarDelegate?
    var selectedMonth: Date? = Date()
    var selectedDate: Date? = Date()
    
    //MARK:- Initialize calendar
    private func initialize() {
        let nib = UINib(nibName: self.cellID, bundle: nil)
        self.daysCollectionView.register(nib, forCellWithReuseIdentifier: self.cellID)
        self.daysCollectionView.delegate = self
        self.daysCollectionView.dataSource = self
        self.refreshCalender()
    }
    
    //MARK:- Change month when left and right arrow button tapped
    @IBAction func arrowTapped(_ sender: UIButton) {
        self.selectedMonth = sender == rightBtn ? selectedMonth?.nextMonth : selectedMonth?.previousMonth
        self.refreshCalender()
    }
    
    //MARK:- Refresh Calender according to selected month also check current month
    func refreshCalender(){
        self.monthAndYear.text = (self.selectedMonth?.nameOfMonth ?? Date().nameOfMonth) + " " + "\(self.selectedMonth?.year ?? Date().year)"
        var indexPath = IndexPath(item: 0, section: 0)
        if self.selectedMonth?.isCurrentMonth ?? false{
            self.setSelected(date: Date())
            indexPath = IndexPath(item: (self.selectedDate?.day ?? 1) - 1, section: 0)
        }
        self.daysCollectionView.reloadData()
        self.daysCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    //MARK:- notify delegate after date selection
    func setSelected(date: Date){
        self.selectedDate = date
        self.delegate?.getSelectedDate(date)
    }
    
}

//MARK:- Calendar collection view delegate and datasource methods
extension CalendarView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.selectedMonth?.endOfMonth?.day ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as! DayCell
        let date = self.getDate(byAdding: indexPath.row)
        cell.configure(date: date)
        cell.dayView.backgroundColor = date.compare(date: self.selectedDate ?? Date()) ? .daySelected : .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let date = self.getDate(byAdding: indexPath.row)
        self.setSelected(date: date)
        self.daysCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    //MARK:- get date by adding some day in given date
    func getDate(byAdding day: Int)-> Date{
        var comps = DateComponents()
        comps.day = day
        return Calendar.current.date(byAdding: comps, to: self.selectedMonth?.startOfMonth ?? Date()) ?? Date()
    }
    
}

//MARK:- Add calendar to the view
extension CalendarView {
    
    public class func addCalendar(_ superView: UIView) -> CalendarView? {
        var calendarView: CalendarView?
        if calendarView == nil {
            calendarView = UINib(nibName: "CalendarView", bundle: nil).instantiate(withOwner: self, options: nil).last as? CalendarView
            guard let calenderView = calendarView else { return nil }
            calendarView?.frame = CGRect(x: 0, y: 0, width: superView.bounds.size.width, height: superView.bounds.size.height)
            superView.addSubview(calenderView)
            calenderView.initialize()
            return calenderView
        }
        return nil
    }
    
}
