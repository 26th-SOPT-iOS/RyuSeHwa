//
//  DetailViewController.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 13/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    //데이터 넘겨받기
    var nameProfile: String = ""
    var imageProfile: String = ""
    var statusProfile: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()

        // Do any additional setup after loading the view.
    }
    
    private func initView() {
        profileImageView.image = UIImage(named: imageProfile)
        nameLabel.text = nameProfile
        statusLabel.text = statusProfile
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
