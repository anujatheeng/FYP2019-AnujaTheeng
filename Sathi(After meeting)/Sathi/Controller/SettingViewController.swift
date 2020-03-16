//
//  SettingViewController.swift
//  Sathi
//
//  Created by Anuza Theeng on 2/26/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var settings = Settings.settingsArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
}
extension SettingViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsetting = settings[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableCell") as! SettingsTableCell
        cell.selectionStyle = .none
        cell.setSettings(newsetting: newsetting)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
}

extension SettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = settings[indexPath.row]
        if indexPath.row == 3 {//&& indexPath.section == 3 {
            do {
                try Auth.auth().signOut()
            } catch  {
                print(error)
            }
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil )
            let VC = storyboard.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
            self.present(VC, animated: true, completion: nil )
        } else if indexPath.row == 4{
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = story.instantiateViewController(identifier:"FeedbackViewController" ) as! FeedbackViewController
            self.navigationController?.pushViewController(controller, animated: true)
        } else if  indexPath.row == 2 {
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
