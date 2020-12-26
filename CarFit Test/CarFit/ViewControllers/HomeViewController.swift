//
//  ViewController.swift
//  Calendar
//
//  Test Project
//

import UIKit

class HomeViewController: UIViewController, AlertDisplayer {

    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var calendarView: UIView!
    @IBOutlet weak var calendar: UIView!
    @IBOutlet weak var calendarButton: UIBarButtonItem!
    @IBOutlet weak var workOrderTableView: UITableView!
    
    private let cellID = "HomeTableViewCell"
    private var viewModel: CleanerListViewModel?
    private var cleaners: CleanerLists = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.addCalendar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    //MARK:- Add calender to view
    private func addCalendar() {
        if let calendar = CalendarView.addCalendar(self.calendar) {
            calendar.delegate = self
        }
    }

    //MARK:- UI setups
    private func setupUI() {
        self.navBar.transparentNavigationBar()
        let nib = UINib(nibName: self.cellID, bundle: nil)
        self.workOrderTableView.register(nib, forCellReuseIdentifier: self.cellID)
        self.workOrderTableView.rowHeight = UITableView.automaticDimension
        self.workOrderTableView.estimatedRowHeight = 170
        viewModel = CleanerListViewModel(delegate: self)
        self.setData(date: Date())
        self.addGesture()
    }
    
    //MARK:- add Gesture on tableview to hide calender
    func addGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideCalender))
        self.workOrderTableView.addGestureRecognizer(tap)
    }
    
    //MARK:- Hide calender when tapped on tableview
    @objc func hideCalender(){
        self.setCalender(visibility: false)
    }
    
    //MARK:- Show calendar when tapped, Hide the calendar when tapped outside the calendar view
    @IBAction func calendarTapped(_ sender: UIBarButtonItem) {
        self.setCalender(visibility: true)
    }
    
    //MARK:- Set Visibility of calender and other component
    func setCalender(visibility: Bool){
        self.calendar.isHidden = !visibility
        self.navBar.isHidden = visibility
        self.calendarView.backgroundColor = visibility ? UIColor.doneOption : UIColor.clear
    }
    
    //MARK:- Set Data according to Selected Date
    func setData(date: Date){
        self.navBar.topItem?.title = date.compare(date: Date()) ? "I DAG" : date.toString
        self.showProgressIndicator()
        viewModel?.fetchData(for: date)
    }
    
}


//MARK:- Tableview delegate and datasource methods
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cleaners.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! HomeTableViewCell
        let homeCellVM = HomeCellViewModel(cleaner: self.cleaners[indexPath.row], previousService: indexPath.row == 0 ? nil : self.cleaners[indexPath.row - 1])
        cell.configure(homeCellVM: homeCellVM)
        return cell
    }
    
}

//MARK:- Get selected calendar date
extension HomeViewController: CalendarDelegate {
    
    func getSelectedDate(_ date: Date) {
        self.setData(date: date)
    }
    
}

extension HomeViewController: DataViewerProtocol{
    //MARK:- update success
    func updateData(cleaners: CleanerLists) {
        self.cleaners = cleaners
        self.refreshVisits()
    }
    
    //MARK:- error in getting data
    func showError(message: String) {
        self.cleaners = []
        self.showAlert(message: message)
        self.refreshVisits()
    }
    
    //MARK:-  Refresh screen after data call back
    func refreshVisits(){
        DispatchQueue.main.async {
            self.hideProgressIndicator()
            self.workOrderTableView.reloadData()
        }
    }
    
}
