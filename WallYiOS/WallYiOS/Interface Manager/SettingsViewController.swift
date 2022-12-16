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
    
    @IBAction func deleteDataTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "wallyios.setupdone")
        var window = self.view.window
        let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeViewController
        window?.rootViewController = welcomeVC
        window?.makeKeyAndVisible()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTabBar()
        styleViewController()
        addMenus()
    }
    
    func styleViewController() {
        cardView1.layer.cornerRadius = 12.0
        cardView2.layer.cornerRadius = 12.0
        cardView3.layer.cornerRadius = 12.0
        cardView4.layer.cornerRadius = 12.0
        cardView5.layer.cornerRadius = 12.0
    }
    
    func addMenus() {
        var currencyMenuItems: [UIAction] {
            return [
                UIAction(title: "RON", image: nil, handler: { (_) in
                    self.currencyBtn.setTitle("RON", for: .normal)
                }),
                UIAction(title: "Euro", image: nil, handler: { (_) in
                    self.currencyBtn.setTitle("Euro", for: .normal)
                }),
                UIAction(title: "Dollar", image: nil, handler: { (_) in
                    self.currencyBtn.setTitle("Dollar", for: .normal)
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
                }),
                UIAction(title: "One Month", image: nil, handler: { (_) in
                    self.deleteStatsBtn.setTitle("One Month", for: .normal)
                }),
                UIAction(title: "One Year", image: nil, handler: { (_) in
                    self.deleteStatsBtn.setTitle("One Month", for: .normal)
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
