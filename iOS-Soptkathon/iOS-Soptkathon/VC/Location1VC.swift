//
//  Location1VC.swift
//  iOS-Soptkathon
//
//  Created by Sehwa Ryu on 06/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class Location1VC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let locationNameList: [String] = ["아시아", "유럽", "아프리카", "남아메리카"]
    let locationEngList: [String] = ["Asia", "Europe", "Africa", "South America"]
    let locationImgList: [String] = ["asiaImg", "europeImg", "africaImg", "saImg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension Location1VC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCellSE", for: indexPath) as? LocationCellSE else { return UITableViewCell() }
        cell.locationImageView.image = UIImage(named: locationImgList[indexPath.row])
        cell.nameLabel.text = locationNameList[indexPath.row]
        cell.engLabel.text = locationEngList[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Location_2", bundle: nil)
        guard let view = storyboard.instantiateViewController(identifier: "Location2VC") as? Location2VC else { return }
        
        view.locationName = self.locationNameList[indexPath.row]
        
        self.present(view, animated: true)
    }
}
