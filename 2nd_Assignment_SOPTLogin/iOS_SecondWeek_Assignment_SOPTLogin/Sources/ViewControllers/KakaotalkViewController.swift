//
//  KakaotalkViewController.swift
//  iOS_SecondWeek_Assignment_SOPTLogin
//
//  Created by Sehwa Ryu on 10/05/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class KakaotalkViewController: UIViewController {
    
    private var myProfileInformations: [ProfileInformation] = []
    private var profileInformations: [ProfileInformation] = []
    
    var friendsLabel = UILabel()

    @IBOutlet weak var katalkTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileInformations()
        katalkTableView.dataSource = self
        katalkTableView.delegate = self
        katalkTableView.separatorStyle = UITableViewCell.SeparatorStyle.none

    }

//    private func setProfileInformations() {
//        let myProfile = ProfileInformation(profile: .prof1, name: "류세화", status: " ")
//        let profile1 = ProfileInformation(profile: .prof1, name: "아요 김솝트", status: " ")
//        let profile2 = ProfileInformation(profile: .prof2, name: "안드 김솝트", status: "라랄")
//        let profile3 = ProfileInformation(profile: .prof3, name: "안드 정솝트", status: "시험기간 ㅠㅠ")
//        let profile4 = ProfileInformation(profile: .prof4, name: "기획 정솝트", status: " ")
//        let profile5 = ProfileInformation(profile: .prof5, name: "아요 한솝트", status: "코로나 언제 끝나..?")
//        let profile6 = ProfileInformation(profile: .prof6, name: "안드 김솝트", status: "멍멍")
//        let profile7 = ProfileInformation(profile: .prof7, name: "디자인 박솝트", status: "모각공 하자~")
//        let profile8 = ProfileInformation(profile: .prof8, name: "서버 윤솝트", status: " ")
//        let profile9 = ProfileInformation(profile: .prof9, name: "기획 한솝트", status: " 애옹")
//        myProfileInformations = [myProfile]
//        profileInformations = [profile1, profile2, profile3, profile4, profile5, profile6, profile7, profile8, profile9]
//
//    }
    
    private func setProfileInformations(){
         
         let me = ProfileInformation(profileImg:#imageLiteral(resourceName: "profile5Img") , profileName: "아요 류세화", statusLabel: "")
         let profile1 = ProfileInformation(profileImg:#imageLiteral(resourceName: "profile1Img"), profileName: "아요 김솝트", statusLabel: "")
         let profile2 = ProfileInformation(profileImg: #imageLiteral(resourceName: "profile9Img") ,profileName: "아요 김솝트", statusLabel: "날씨 너무 좋당")
         let profile3 = ProfileInformation(profileImg:#imageLiteral(resourceName: "profile3Img"), profileName: "안드 정솝트", statusLabel: "과제 힘들어..")
         let profile4 = ProfileInformation(profileImg:#imageLiteral(resourceName: "profile1Img"), profileName: "디자인 한솝트", statusLabel: "놀아줄 사람?")
         let profile5 = ProfileInformation(profileImg:#imageLiteral(resourceName: "profile7Img") , profileName: "기획 정솝트", statusLabel: "")
         let profile6 = ProfileInformation(profileImg:#imageLiteral(resourceName: "profile2Img"), profileName: "기획 신솝트", statusLabel: "애옹")
         let profile7 = ProfileInformation(profileImg:#imageLiteral(resourceName: "profile7Img") , profileName: "안드 한솝트", statusLabel: "")
         let profile9 = ProfileInformation(profileImg: #imageLiteral(resourceName: "profile8Img"),profileName: "서버 정솝트", statusLabel: "Haha")
         let profile10 = ProfileInformation(profileImg:#imageLiteral(resourceName: "9573886432601742940168682793295078318145536N") , profileName: "서버 윤솝트", statusLabel: "")
         let profile11 = ProfileInformation(profileImg: #imageLiteral(resourceName: "profile5Img"), profileName: "기획 한솝트", statusLabel: "코로나 언제 끝나..?")
         let profile12 = ProfileInformation(profileImg: #imageLiteral(resourceName: "profile2Img"), profileName: "아요 이솝트", statusLabel: "집에 가고싶다")
         let profile13 = ProfileInformation(profileImg:#imageLiteral(resourceName: "profile4Img") , profileName: "디자인 이솝트", statusLabel: "")
    
        profileInformations = [profile1,profile2,profile3,profile4,profile5,profile6,profile7,profile9,profile10,profile11,profile12,profile13]
         myProfileInformations = [me]
         
     }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        if section == 0{
            let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y: footerView.frame.height, width: tableView.frame.width - tableView.separatorInset.right - tableView.separatorInset.left - 14.5, height: 0.5))
            
            separatorView.backgroundColor = UIColor.lightGray
            footerView.addSubview(separatorView)
            
            friendsLabel = UILabel(frame: CGRect(x: 14, y: 9.5, width:tableView.bounds.size.width, height: 15))
            
            friendsLabel.font = UIFont(name: "KoPubWorldDotumPM", size: 8)
            friendsLabel.textColor = UIColor.lightGray
            friendsLabel.text = "친구 \(profileInformations.count)"
            friendsLabel.sizeToFit()
            footerView.addSubview(friendsLabel)
            
        }
        return footerView
    }
    
}

extension KakaotalkViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            return myProfileInformations.count
    }
        else {
            return profileInformations.count
    }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueReusableCell(withIdentifier: Conv1.identifier,for : indexPath) as? Conv1 else {
            return UITableViewCell()

        }
        
        // Section1 Constraints
        if indexPath.section == 1  {
            profileCell.setProfileInformation(
            profileImg:profileInformations[indexPath.row].profileImg!,
            profileName:profileInformations[indexPath.row].profileName,
            profileStatus:profileInformations[indexPath.row].statusLabel)

            //profileCell.imageHeight.constant = 50
            profileCell.imageTopConstraints.constant = 6
            //profileCell.imageBottomConstraints.constant = 7
            //profileCell.imageToLabelConstraints.constant = 22

        }
        else {
            //profileCell.imageHeight.constant = 60
            profileCell.imageTopConstraints.constant = 13
            //profileCell.imageBottomConstraints.constant = 15.5
            //profileCell.imageToLabelConstraints.constant = 13
        }

        // Section0 Constraints
        if indexPath.section == 0 {
            profileCell.setProfileInformation(
                profileImg:myProfileInformations[indexPath.row].profileImg!,
                profileName:myProfileInformations[indexPath.row].profileName,
                profileStatus:myProfileInformations[indexPath.row].statusLabel)

            profileCell.imageTopConstraints.constant = 13
            //profileCell.imageBottomConstraints.constant = 15.5
            //profileCell.imageToLabelConstraints.constant = 13
            profileCell.convName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
            //profileCell.imageHeight.constant = 60
        }
        else {
            //profileCell.imageHeight.constant = 50
            profileCell.imageTopConstraints.constant = 6
            //profileCell.imageBottomConstraints.constant = 7
            //profileCell.imageToLabelConstraints.constant = 22
            profileCell.convName.font = UIFont(name: "AppleSDGothicNeo", size: 17)

        }

        return profileCell
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        }
        return true
    }

    
    private func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.red

        return vw
    }
}
    
    
extension KakaotalkViewController: UITableViewDelegate {
    // Setting height for rows in section
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 95
        }
        else {
            return 85
        }
    }
    
    // Opening profile
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let detailViewController = self.storyboard?.instantiateViewController(identifier:
    "DetailViewController") as? DetailViewController else { return }
    //* 수정하기
        //detailViewController.imageProfile = profileInformations[indexPath.row].profileImg!
    detailViewController.nameProfile = profileInformations[indexPath.row].profileName
    detailViewController.statusProfile = profileInformations[indexPath.row].statusLabel
        self.present(detailViewController, animated: true, completion: nil)
    }

    // Deleting cells
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.profileInformations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            friendsLabel.text = "친구 \(profileInformations.count)"
            print(profileInformations.count)
        }
    }
    
    // Action Sheet
    @IBAction func actionSheetButton(_ sender: UIButton) {
    let alert: UIAlertController

    alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
    
    var cancelAction: UIAlertAction
    var editFriend: UIAlertAction
    var editAll: UIAlertAction

    cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction) in
    })
    editFriend = UIAlertAction(title: "친구 관리", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in

    })
    
    editAll = UIAlertAction(title: "전체 설정", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
    })
    
    alert.addAction(cancelAction)
    alert.addAction(editFriend)
    alert.addAction(editAll)
    self.present(alert,animated: true){

    }
}
}


