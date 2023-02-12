//
//  SafariViewController.swift
//  AVPlayerViewController & IBSegueAction
//
//  Created by Ryan Lin on 2022/12/21.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {
    
    var webSite: String
    
    init?(coder:NSCoder, webSite: String) {
        self.webSite = webSite
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       updatedUI()
    }
    
    func updatedUI() {
        //利用 URL(string:) 把網址變成URL
        let url = URL(string: webSite)
        //宣告常數 browser，把 SFSafariViewController(url:url!）存入它
        let browser = SFSafariViewController(url:url!)
        //設定瀏覽器的底色
        browser.preferredBarTintColor = UIColor.black
        //設定瀏覽器的字體顏色
        browser.preferredControlTintColor = UIColor.cyan
        //呈現網頁
        present(browser, animated: true)
    }
    
}
