//
//  HomeTableViewCell.swift
//  Calendar
//
//  Test Project
//

import UIKit
import CoreLocation

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var customer: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var tasks: UILabel!
    @IBOutlet weak var arrivalTime: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var timeRequired: UILabel!
    @IBOutlet weak var distance: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.bgView.layer.cornerRadius = 10.0
        self.statusView.layer.cornerRadius = self.status.frame.height / 2.0
        self.statusView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    func configure(homeCellVM: HomeCellViewModel){
        self.customer.text = homeCellVM.customerName
        self.status.text = homeCellVM.visitState.rawValue
        self.statusView.backgroundColor = homeCellVM.visitStateColor
        self.tasks.text = homeCellVM.tasks
        self.arrivalTime.text = homeCellVM.startTime
        self.destination.text = homeCellVM.address
        self.timeRequired.text = homeCellVM.totalTime
        self.distance.text = homeCellVM.distance
    }

}
