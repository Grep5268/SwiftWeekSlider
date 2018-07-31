//
//  ViewController.swift
//  SwiftWeekSlider
//
//  Created by Gary Frazier on 07/27/2018.
//  Copyright (c) 2018 Gary Frazier. All rights reserved.
//

import Foundation
import UIKit
import SwiftWeekSlider

class ViewController: UIViewController {

    @IBOutlet weak var weekSlider: WeekSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let calendar = Calendar.current
        
        weekSlider.textColor = UIColor.black
        weekSlider.scrollViewColor = UIColor.cyan
        
        weekSlider.dayConfig = [
            DayConfigModel(date: Date(), onClick: {() in
                self.weekSlider.dayConfig![0].highlighted = !self.weekSlider.dayConfig![0].highlighted
                self.weekSlider.setupCells()
            }),
            DayConfigModel(date: calendar.date(byAdding: .day, value: 1, to: Date())!, onClick: {() in
                self.weekSlider.textColor = UIColor.red
                self.weekSlider.setupCells()
            }),
            DayConfigModel(date: calendar.date(byAdding: .day, value: 2, to: Date())!),
            DayConfigModel(date: calendar.date(byAdding: .day, value: 3, to: Date())!),
            DayConfigModel(date: calendar.date(byAdding: .day, value: 4, to: Date())!),
            DayConfigModel(date: calendar.date(byAdding: .day, value: 5, to: Date())!),
            DayConfigModel(date: calendar.date(byAdding: .day, value: 6, to: Date())!)
        ]
        
        weekSlider.setupCells()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

