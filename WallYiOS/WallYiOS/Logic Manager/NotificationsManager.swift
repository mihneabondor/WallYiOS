//
//  NotificationsManager.swift
//  WallYiOS
//
//  Created by David Retegan on 18.12.2022.
//

import Foundation
import UserNotifications

class NotificationsManager {
    
    static let sharedInstance = NotificationsManager()
    
    let center = UNUserNotificationCenter.current()
    
    private init() {}
    
    var checkInTime = UserDefaults.standard.object(forKey: "wallyios.notificationsCheckInTime") as? Date ?? Date()
    
    func managePermission() {
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional {
                print("We good w Notifications")
            } else {
                self.center.requestAuthorization(options: [.alert, .sound]) { granted, error in
                    if granted {
                        print("We good w Notifications")
                    } else {
                        print("We not good w Notifications")
                    }
                }
            }
        }
    }
    
    func updateNotifications(with date: Date) {
        checkInTime = UserDefaults.standard.object(forKey: "wallyios.notificationsCheckInTime") as? Date ?? Date()
        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Check-In"
        content.body = "Wall-Y is waiting for your daily check-in"
        content.categoryIdentifier = "wallyios.notification"

        var calendar = Calendar.current
        calendar.timeZone = TimeZone.current
        var dateInfo = DateComponents()
        dateInfo.hour = Calendar.current.component(.hour, from: date)
        dateInfo.minute = Calendar.current.component(.minute, from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: true)

        let uniqueID = UUID().uuidString
        let request = UNNotificationRequest(identifier: uniqueID, content: content, trigger: trigger)
        center.add(request)
    }
}
