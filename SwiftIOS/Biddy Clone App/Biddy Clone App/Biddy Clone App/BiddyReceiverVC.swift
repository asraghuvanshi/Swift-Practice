//
//  BiddyReceiverVC.swift
//  Biddy Clone App
//
//  Created by Avi on 03/01/23.
//

import UIKit

class BiddyReceiverVC: UIViewController {

    @IBOutlet weak var biddyNotifyBttn: UIButton!
    @IBOutlet weak var biddyNotifyStopBttn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        biddyNotifyBttn.layer.cornerRadius = 25
        biddyNotifyStopBttn.layer.cornerRadius = 25
    }

}
