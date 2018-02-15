//
//  ViewController.swift
//  CalendarViewDemo
//
//  Created by Wito Chandra on 05/04/16.
//  Copyright © 2016 Wito Chandra. All rights reserved.
//

import UIKit

import WTCalendarView

class ViewController: UIViewController {

    @IBOutlet var calendarView: CalendarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.localeIdentifier = "de_DE"
        calendarView.delegate = self
        
        let components = NSDateComponents()
        components.day = 1
        components.month = 1
        components.year = 2016
        calendarView.setBeginDate(Date(), finishDate: Date(timeIntervalSinceNow: 24 * 3600))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func buttonTodayPressed() {
        calendarView.setBeginDate(Date(), finishDate: Date(timeIntervalSinceNow: 24 * 3600))
        calendarView.scrollToMonthOfDate(calendarView.beginDate!)
    }
    
    @IBAction func buttonTomorrowPressed() {
        calendarView.setBeginDate(Date(timeIntervalSinceNow: 24 * 3600), finishDate: Date(timeIntervalSinceNow: 2 * 24 * 3600))
        calendarView.scrollToMonthOfDate(calendarView.beginDate!)
    }
}

extension ViewController: CalendarViewDelegate {
    
    func calendarView(_ calendarView: CalendarView, didUpdateBeginDate beginDate: Date?) {
        print("Update Begin Date \(String(describing: beginDate))")
    }
    
    func calendarView(_ calendarView: CalendarView, didUpdateFinishDate finishDate: Date?) {
        print("Update Finish Date \(String(describing: finishDate))")
    }
}

