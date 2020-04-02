//
//  ViewController.swift
//  Electra13
//
//  Created by CoolStar on 3/1/20.
//  Copyright © 2020 coolstar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var electra: Electra?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        get_tfp0()
        let our_task = rk64(task_self + Offsets.shared.ipc_port.ip_kobject)
        electra = Electra(tfp0: tfpzero,
                          any_proc: rk64(our_task + Offsets.shared.task.bsd_info),
                          enable_tweaks: true,
                          restore_rootfs: false,
                          nonce: "0xbd34a880be0b53f3")
        electra?.jailbreak()
        
        UIApplication.shared.beginBackgroundTask {
            print("App about to close...")
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reboot() {
        electra?.rebootDevice()
    }
    
    @IBAction func exit() {
        electra?.exitApp()
    }

}
