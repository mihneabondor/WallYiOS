//
//  StatsViewController.swift
//  WallYiOS
//
//  Created by David Retegan on 17.12.2022.
//

import UIKit
import SwiftUI

class StatsViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var savingStatView: UIView!
    @IBOutlet weak var spendingStatView: UIView!
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleViewController()
    }
    
    func styleViewController() {
        segmentedControl.selectedSegmentIndex = 1
        
        //Saving stat
        savingStatView.layer.cornerRadius = 16
        let childView1 = UIHostingController(rootView: StatView())
        childView1.view.frame = savingStatView.bounds
        childView1.view.layer.cornerRadius = 16
        savingStatView.addSubview(childView1.view)
        
        //Spending stat
        spendingStatView.layer.cornerRadius = 16
        let childView2 = UIHostingController(rootView: StatView())
        childView2.view.frame = spendingStatView.bounds
        childView2.view.layer.cornerRadius = 16
        spendingStatView.addSubview(childView2.view)
    }

}
