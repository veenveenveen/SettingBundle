//
//  ViewController.swift
//  SettingBundle
//
//  Created by 黄启明 on 2017/4/24.
//  Copyright © 2017年 黄启明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refresh()
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground(_:)), name: Notification.Name.UIApplicationWillEnterForeground, object: app)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(_ sender: Any) {
//        refresh()
        //打开“设置”应用程序
        UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: ["": ""], completionHandler: nil)
    }
    
    func refresh() {
        label.text = defaults.string(forKey: "rank")
    }
    
    func appWillEnterForeground(_ notification: Notification) {
        defaults.synchronize()//强制用户默认值系统保存尚未保存的修改，然后从存储中重新加载所有未修改的偏好设置
        refresh()
    }


}

