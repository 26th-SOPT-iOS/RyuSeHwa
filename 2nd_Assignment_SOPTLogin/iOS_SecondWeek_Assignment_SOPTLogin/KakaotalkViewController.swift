//
//  KakaotalkViewController.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 10/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class KakaotalkViewController: UIViewController {

    private var profileInformations: [ProfileInformation] = []
    
    @IBOutlet weak var katalkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileInformations()
        katalkTableView.dataSource = self
        katalkTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    private func setProfileInformations() {
        let profile1 = ProfileInformation(profile: .prof1, name: "아요 이솝트", status: " ")
        let profile2 = ProfileInformation(profile: .prof2, name: "안드 김솝트", status: "라랄")
        let profile3 = ProfileInformation(profile: .prof3, name: "안드 정솝트", status: "시험기간 ㅠㅠ")
        let profile4 = ProfileInformation(profile: .prof4, name: "기획 정솝트", status: " ")
        let profile5 = ProfileInformation(profile: .prof5, name: "아요 한솝트", status: "코로나 언제 끝나..?")
        let profile6 = ProfileInformation(profile: .prof6, name: "안드 김솝트", status: "멍멍")
        let profile7 = ProfileInformation(profile: .prof7, name: "디자인 박솝트", status: "모각공 하자~")
        let profile8 = ProfileInformation(profile: .prof8, name: "서버 윤솝트", status: " ")
        let profile9 = ProfileInformation(profile: .prof9, name: "기획 한솝트", status: " 애옹")
    profileInformations = [profile1, profile2, profile3, profile4, profile5, profile6, profile7, profile8, profile9] }
    
}

extension KakaotalkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileInformations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let conv1 = tableView.dequeueReusableCell(withIdentifier: Conv1.identifier, for: indexPath) as? Conv1
            else {return UITableViewCell() }
        conv1.setProfileInformation(profileImageName:
            profileInformations[indexPath.row].profile.getImageName(),
            name: profileInformations[indexPath.row].name,
            status: profileInformations[indexPath.row].status)
        
        return conv1
    }
    
    private func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.red

        return vw
    }
}

extension KakaotalkViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let detailViewController = self.storyboard?.instantiateViewController(identifier:
    "DetailViewController") as? DetailViewController else { return }
    detailViewController.imageProfile = profileInformations[indexPath.row].profile.getImageName()
    detailViewController.nameProfile = profileInformations[indexPath.row].name
    detailViewController.statusProfile = profileInformations[indexPath.row].status
        self.present(detailViewController, animated: true, completion: nil)
    }

    // Deleting cells
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}


