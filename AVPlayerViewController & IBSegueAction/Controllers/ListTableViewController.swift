//
//  ListTableViewController.swift
//  AVPlayerViewController & IBSegueAction
//
//  Created by Ryan Lin on 2022/12/15.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var attractions: [Attraction] = [
        Attraction(name: "星耀樟怡", since: "since 2019 Mar", photo: "jewel", intorduction: "星耀樟宜（英語：Jewel Changi Airport）係位於新加坡樟宜機場中以自然為主題的娛樂、零售綜合設施，連結該機場的三個航廈。其核心為世界最高的室內瀑布雨漩渦（Rain Vortex），其週邊為階梯式森林佈置。星耀樟宜中設有花園、景點、旅館及約300家零售商店及餐廳，總樓地板面積為135,700 m2，共計10層樓，包括5層地上及5層地下樓層。其中景點包括高達5層樓的室內花園資生堂森林谷、最頂層的星空花園。"),
        Attraction(name: "S.E.A. 海洋館", since: "since 1822", photo: "sea aquarium", intorduction: "S.E.A. 海洋館是全球最大的水族館之一，10 萬余海洋生物休憩於此，匯聚了 45 個迥異棲息地的上千物種。成群結隊的水生生物游弋生姿，互動項目、近距離邂逅和沉浸式學習之旅相得益彰，激勵游客保護世界的海洋。"),
        Attraction(name: "新加坡植物園", since: "since 1822", photo: "Botanic Gardens", intorduction: "新加坡植物園（英文：Singapore Botanic Gardens，馬來文：Taman Botanik Singapura或Kebun Botani Singapura）占地74公頃，位於新加坡。約為英國皇家植物園大小的一半，紐約中央公園的五分之一。開放時間為早上5點至午夜12點，並且除國家胡姬花園外全園免費。新加坡植物園南部為荷蘭路和那比爾路，東部為古魯尼路，西部為泰瑟爾道和古魯尼公園路，北部為武吉知馬路。公園最南端距最北端約2.5公里。2015年7月4日，新加坡植物園被列入世界文化遺產。"),
        Attraction(name: "阿凡達：水之道", since:"導演：詹姆斯卡麥隆", photo: "AVATAR2", intorduction: "拍片預算2.5億美元，《阿凡達：水之道》設於首集超過十年後，成為納美人並與奈蒂莉共結連理的傑克，在潘朵拉星上與他們的孩子組成蘇里一家，過著與世無爭的幸福生活，未料威脅再度降臨，他們不遺餘力保護彼此，為了生存再度奮戰，還得承受隨之而來的悲痛創傷。"),
        Attraction(name: "花路阿朱媽", since: "導演：何書銘", photo: "花路", intorduction: "《花路阿朱媽》（英語：Ajoomma，韓語：아줌마），前名《花路安娣》、《阿姨》，是新韓兩地聯制的2022年電影，由《回程667》的何書銘執導，新加坡導演陳哲藝製作的喜劇長片。電影於2022年10月7日在釜山國際影展舉行全球首映。"),
        Attraction(name: "憂鬱之島", since: "導演：陳梓桓", photo: "憂鬱之島", intorduction: "《憂鬱之島》（英語：Blue Island）是一部2022年由陳梓桓作為導演的香港電影，於加拿大Hotdocs國際紀錄片影展作世界首映。電影獲得第13屆台灣國際紀錄片影展3項大獎和第59屆金馬獎最佳紀錄片提名。")
    ]
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //為TableViewController加入背景，記得Table Ｖiew Cell也要調成透明
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "BG"))
    }
    
    @IBSegueAction func showIntro(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> IntroViewController? {
        
        switch segueIdentifier {
        case "jewel":
            index = 0
        case "sea aquarium":
            index = 1
        case "botanic garden":
            index = 2
        case "avatar2":
            index = 3
        case "ajoomma":
            index = 4
        case "blue island":
            index = 5
        default:
            break
        }
        return IntroViewController(coder: coder, attractions: attractions, index: index)
    }
}
