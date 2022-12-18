//
//  NotificationsViewController.swift
//  WallYiOS
//
//  Created by David Retegan on 18.12.2022.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var timePicker: UIDatePicker!

    @IBOutlet weak var dismissBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cardView: UIView!
    
    @IBAction func cancelTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.1) {
            self.dismissBtn.alpha = 0.0
        } completion: { _ in
            self.dismiss(animated: true)
        }
    }
    @IBAction func saveTapped(_ sender: Any) {
        UserDefaults.standard.set(timePicker.date, forKey: "wallyios.notificationsCheckInTime")
        NotificationsManager.sharedInstance.updateNotifications(with: timePicker.date)
        UIView.animate(withDuration: 0.1) {
            self.dismissBtn.alpha = 0.0
        } completion: { _ in
            self.dismiss(animated: true)
        }
    }
    @IBAction func dismissTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.1) {
            self.dismissBtn.alpha = 0.0
        } completion: { _ in
            self.dismiss(animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        styleModalView()
        NotificationsManager.sharedInstance.managePermission()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.dismissBtn.alpha = 0.4
        }
    }
    
    func styleModalView() {
        cardView.layer.cornerRadius = 24.0
        saveBtn.layer.cornerRadius = 16.0
        
        timePicker.setDate(NotificationsManager.sharedInstance.checkInTime, animated: false)
    }
}
