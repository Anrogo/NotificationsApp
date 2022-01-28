//
//  ViewController.swift
//  Notificaciones
//
//  Created by user190722 on 1/28/22.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            if granted {
                print("Permiso concedido")
            } else {
                print("Permiso denegado")
                print(error)
            }
        }
    }

    @IBAction func showNotifaction(_ sender: UIButton) {
        //Crear contenido notificación
        let content = UNMutableNotificationContent()
        content.title = "Mi notificación"
        content.subtitle = "Info secundaria"
        content.body = "Algo"
        content.sound = .default
        
        //Definir disparador
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        //Pedir lanzamiento
        let request = UNNotificationRequest(identifier: "notificacionId", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) {
            (error) in print(error)
        }
    }
    
}

