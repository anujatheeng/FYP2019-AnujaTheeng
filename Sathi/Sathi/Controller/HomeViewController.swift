//
//  HomeViewController.swift
//  MyProjectApp
//
//  Created by Anuza Theeng on 1/21/20.
//  Copyright © 2020 Anuza Theeng. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var feature = Features.createArray()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feature.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newFeature = feature[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturesCell") as! FeaturesCell
        cell.selectionStyle = .none
        cell.setFeatures(newFeature: newFeature)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = feature[indexPath.row]
        if indexPath.row == 0 {
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "AlertButtonViewController") as! AlertButtonViewController
            controller.titleString = data.title
            self.navigationController?.pushViewController(controller, animated: true)
        } else if indexPath.row == 1 {
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "EmergencyContactViewController") as! EmergencyContactViewController
            self.navigationController?.pushViewController(controller, animated: true)
        }else if indexPath.row == 2 {
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "PolicestationViewController") as! PolicestationViewController
            self.navigationController?.pushViewController(controller, animated: true)
        } else if indexPath.row == 3 {
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "PronezoneViewController") as! PronezoneViewController
            self.navigationController?.pushViewController(controller, animated: true)
        } else if indexPath.row == 4  {
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "SoundViewController") as! SoundViewController
            self.navigationController?.pushViewController(controller, animated: true)
        } else {
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "AboutAppViewController") as! AboutAppViewController
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
