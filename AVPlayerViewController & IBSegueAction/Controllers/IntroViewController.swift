//
//  IntroViewController.swift
//  AVPlayerViewController & IBSegueAction
//
//  Created by Ryan Lin on 2022/12/15.
//

import UIKit
import AVKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var introTextView: UITextView!
    @IBOutlet weak var playButton: UIButton!
    //宣告兩個變數，分別把兩個自創的型別存入
    let attraction: Attraction
    
    init?(coder: NSCoder, attraction: Attraction) {
        self.attraction = attraction
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var website: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = attraction.name
        photoImageView.image = UIImage(named:attraction.photo)
        directorLabel.text = attraction.since
        introTextView.text = attraction.intorduction
    }
    
    @IBSegueAction func showVideo(_ coder: NSCoder) -> AVPlayerViewController? {
        let showVideoController = AVPlayerViewController(coder: coder)
        //用title顯示的名稱判斷要跑的影片
        switch title {
        case "星耀樟怡":
            //用Bundle.main.url(forResource: , withExtension: )讀取程式內影片的路徑
            let videoUrl = Bundle.main.url(forResource: "jewel", withExtension: "mp4")
            //利用型別AVPlayer及其屬性url傳入檔案路徑存入下一頁的播放器
            showVideoController?.player = AVPlayer(url: videoUrl!)
        case "S.E.A. 海洋館":
            let videoUrl = Bundle.main.url(forResource: "sea aquarium", withExtension: "mp4")
            showVideoController?.player = AVPlayer(url: videoUrl!)
        case "新加坡植物園":
            //也可以寫在一起
            showVideoController?.player = AVPlayer(url: Bundle.main.url(forResource: "Botanic Gardens", withExtension: "mp4")!)
        case "阿凡達：水之道":
            showVideoController?.player = AVPlayer(url: Bundle.main.url(forResource: "AVATAR2預告", withExtension: "mp4")!)
        case "花路阿朱媽":
            showVideoController?.player = AVPlayer(url: Bundle.main.url(forResource: "AJOOMMA預告", withExtension: "mp4")!)
        case "憂鬱之島":
            showVideoController?.player = AVPlayer(url: Bundle.main.url(forResource: "Blue Island預告", withExtension: "mp4")!)
        default:
            break
        }
        //播放影片
        showVideoController?.player?.play()
        
        return showVideoController
    }
    
    @IBSegueAction func showWebsite(_ coder: NSCoder) -> SafariViewController? {
        
        switch title {
        case "星耀樟怡":
            website = "https://www.jewelchangiairport.com/"
        case "S.E.A. 海洋館":
            website = "https://www.pelago.co/en-SG/activity/pxelg-rws-sea-aquarium-ticket-singapore/?campaignid=17072198831&adgroupid=140538025180&adid=614838960392&gclid=Cj0KCQiAqOucBhDrARIsAPCQL1a3DD5zMAE9ra2--9qbH6rIYz14QxyH1dgNQurcU523fJuGzNMYENsaAndEEALw_wcB"
        case "新加坡植物園":
            website = "https://www.nparks.gov.sg/SBG"
        case "阿凡達：水之道":
            website = "https://www.avatar.com/"
        case "花路阿朱媽":
            website = "https://www.harpersbazaar.com/tw/culture/filmandmusic/g42000475/ajoomma/"
        case "憂鬱之島":
            website = "https://www.blueislandmovie.com/zh/%E4%B8%BB%E9%A0%81/"
        default:
            break
        }
        return SafariViewController(coder: coder, webSite: website)
    }
}
