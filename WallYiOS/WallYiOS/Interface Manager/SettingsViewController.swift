//
//  SettingsViewController.swift
//  WallYiOS
//
//  Created by David Retegan on 16.12.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: -Tab Bar-
    @IBOutlet weak var floatingView: UIView!
    @IBOutlet weak var homeBtn: UIButton!
    
    @IBAction func homeTapped(_ sender: Any) {
        self.dismiss(animated: false)
    }
    //MARK: -End tab bar-

    //MARK: -Settings-
    @IBOutlet weak var cardView1: UIView!
    @IBOutlet weak var cardView2: UIView!
    @IBOutlet weak var cardView3: UIView!
    
    @IBOutlet weak var currencyBtn: UIButton!
    @IBOutlet weak var deleteStatsBtn: UIButton!
    
    //MARK: -Actions-
    @IBOutlet weak var cardView4: UIView!
    @IBOutlet weak var cardView5: UIView!
    @IBOutlet weak var cardView6: UIView!
    
    @IBAction func notificationsTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsViewController
        self.present(vc, animated: true)
    }
    
    @IBAction func deleteDataTapped(_ sender: Any) {
        data = [.init(amount: 0, weekDay: "Mon"),
                .init(amount: 0, weekDay: "Tue"),
                .init(amount: 0, weekDay: "Wed"),
                .init(amount: 0, weekDay: "Thu"),
                .init(amount: 0, weekDay: "Fri"),
                .init(amount: 0, weekDay: "Sat"),
                .init(amount: 0, weekDay: "Sun")]
        Functions.SharedInstance.saveData(key: "wallyios.savedOperations", array: data)
        NotificationCenter.default.post(name: .refreshNetworthView, object: nil)
        NotificationCenter.default.post(name: .refreshHomeScreen, object: nil)
        UserDefaults.standard.set(false, forKey: "wallyios.setupdone")
        let window = self.view.window
        let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeViewController
        window?.rootViewController = welcomeVC
        window?.makeKeyAndVisible()
    }
    
    @IBOutlet weak var adviceToggle: UISwitch!
    
    @IBAction func adviceToggleTapped(_ sender: UISwitch) {
        userPrefs.adviceToggle = sender.isOn
        Functions.SharedInstance.savePrefs(key: "wallyios.userPrefs", array: userPrefs)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTabBar()
        styleViewController()
        addMenus()
        self.currencyBtn.setTitle(userPrefs.currency, for: .normal)
        self.adviceToggle.isOn = userPrefs.adviceToggle
    }
    
    func styleViewController() {
        cardView1.layer.cornerRadius = 12.0
        cardView2.layer.cornerRadius = 12.0
        cardView3.layer.cornerRadius = 12.0
        cardView4.layer.cornerRadius = 12.0
        cardView5.layer.cornerRadius = 12.0
        cardView6.layer.cornerRadius = 12.0
    }
    
    func addMenus() {
        var currencyMenuItems: [UIAction] {
            return [
                UIAction(title: "RON", image: nil, handler: { (_) in
                    self.currencyBtn.setTitle("RON", for: .normal)
                    userPrefs.currency = " RON"
                    Functions.SharedInstance.savePrefs(key: "wallyios.userPrefs", array: userPrefs)
                    NotificationCenter.default.post(name: .refreshHomeScreen, object: nil)
                }),
                UIAction(title: "Euro", image: nil, handler: { (_) in
                    self.currencyBtn.setTitle("Euro", for: .normal)
                    userPrefs.currency = "€"
                    Functions.SharedInstance.savePrefs(key: "wallyios.userPrefs", array: userPrefs)
                    NotificationCenter.default.post(name: .refreshHomeScreen, object: nil)
                }),
                UIAction(title: "Dollar", image: nil, handler: { (_) in
                    self.currencyBtn.setTitle("Dollar", for: .normal)
                    userPrefs.currency = "$"
                    Functions.SharedInstance.savePrefs(key: "wallyios.userPrefs", array: userPrefs)
                    NotificationCenter.default.post(name: .refreshHomeScreen, object: nil)
                })
            ]
        }
        var currencyMenu: UIMenu {
            return UIMenu(title: "Change Currency", image: nil, identifier: nil, options: [], children: currencyMenuItems)
        }
        currencyBtn.menu = currencyMenu
        currencyBtn.showsMenuAsPrimaryAction = true
        
        var statsDeletionMenuItems: [UIAction] {
            return [
                UIAction(title: "Never", image: nil, handler: { (_) in
                    self.deleteStatsBtn.setTitle("Never", for: .normal)
                    userPrefs.deleteStatsAfter = 0
                    Functions.SharedInstance.savePrefs(key: "wallyios.userPrefs", array: userPrefs)
                    NotificationCenter.default.post(name: .refreshHomeScreen, object: nil)
                }),
                UIAction(title: "One Month", image: nil, handler: { (_) in
                    self.deleteStatsBtn.setTitle("One Month", for: .normal)
                    userPrefs.deleteStatsAfter = 30
                    Functions.SharedInstance.savePrefs(key: "wallyios.userPrefs", array: userPrefs)
                    NotificationCenter.default.post(name: .refreshHomeScreen, object: nil)
                }),
                UIAction(title: "One Year", image: nil, handler: { (_) in
                    self.deleteStatsBtn.setTitle("One Month", for: .normal)
                    userPrefs.deleteStatsAfter = 360
                    Functions.SharedInstance.savePrefs(key: "wallyios.userPrefs", array: userPrefs)
                    NotificationCenter.default.post(name: .refreshHomeScreen, object: nil)
                })
            ]
        }
        var statsDeletionMenu: UIMenu {
            return UIMenu(title: "Delete Stats After", image: nil, identifier: nil, options: [], children: statsDeletionMenuItems)
        }
        deleteStatsBtn.menu = statsDeletionMenu
        deleteStatsBtn.showsMenuAsPrimaryAction = true
    }
    
    func styleTabBar() {
        floatingView.layer.cornerRadius = floatingView.frame.height/2
                
        floatingView.layer.shadowColor = UIColor.black.cgColor
        floatingView.layer.shadowOpacity = 0.15
        floatingView.layer.shadowOffset = .zero
        floatingView.layer.shadowRadius = floatingView.frame.height/2
        floatingView.layer.shadowPath = UIBezierPath(rect: floatingView.bounds).cgPath
        floatingView.layer.shouldRasterize = true
        floatingView.layer.rasterizationScale = UIScreen.main.scale
    }

}
