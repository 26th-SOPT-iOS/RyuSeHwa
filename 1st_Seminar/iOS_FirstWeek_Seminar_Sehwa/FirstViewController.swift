//
//  FirstViewController.swift
//  iOS_FirstWeek_Seminar_Sehwa
//
//  Created by Sehwa Ryu on 18/04/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sampleSwitch: UISwitch!
    @IBOutlet weak var sampleSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func transferData( _sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else { return }
        
        receiveViewController.name = nameTextField.text
        receiveViewController.email = emailTextField.text
        receiveViewController.isOnOff = sampleSwitch.isOn
        receiveViewController.frequency = sampleSlider.value
        self.present(receiveViewController, animated: true, completion: nil)
    }

   

}
