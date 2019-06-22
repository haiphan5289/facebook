//
//  post.swift
//  facebook
//
//  Created by HaiPhan on 6/21/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class post {
    var user_name: String?
    var profile_image_name: String?
    var status_text: String?
    var des_image_name: String?
    var like: Int?
    var cmt: Int?
    
    init(user_name:String, profile_image_name: String, status_text: String, des_image_name: String, like: Int, cmt: Int) {
        self.user_name = user_name
        self.profile_image_name = profile_image_name
        self.status_text = status_text
        self.des_image_name = des_image_name
        self.like = like
        self.cmt = cmt
    }
}

class post_feature {
   
    func create_post() -> [post]{
        var array_temp: [post] = [post]()
        let user1 : post = post(user_name: "Phan Thanh Hải",profile_image_name: "https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.0-9/22405388_888543964635901_4975265809085168194_n.jpg?_nc_cat=111&_nc_oc=AQk3Z9OFqczS90V0AIILH5B43aWrdPVbZX77r-ga7vbqPi0Yc4ojH-JO0byArwJdU_g&_nc_ht=scontent.fsgn5-3.fna&oh=0d6172a0e57c8603b66f3d543aaef3f2&oe=5D90F872", status_text: "⚠ LƯU Ý ⚠ KHÔNG NÊN cập nhật iOS 12.3 - 12.3.1 nếu không muốn gặp những tình trạng này:", des_image_name: "https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.0-9/64663849_1320159541474339_8052755623470694400_n.jpg?_nc_cat=103&_nc_oc=AQne7RGHvg9cpOjSWxrSEFuCfuXgrB62ZsPPV1_5Carv2DLPHTQC0rAboqyBAXrjock&_nc_ht=scontent.fsgn5-7.fna&oh=73b6ad9e9a5d1018ffa9a206df043182&oe=5DC214D0", like: 1000, cmt: 500)
        let user2 : post = post(user_name: "Trang Louis", profile_image_name: "https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.0-9/57503202_644172776015985_4827082764375293952_n.jpg?_nc_cat=100&_nc_oc=AQkUMh6heNHjZCh7k4wtopX1itWomL6RxuOd_H7LbjoTZegtXXXeMtPw9YaLcoESBS4&_nc_ht=scontent.fsgn5-5.fna&oh=56d9b098f8cf06d3482d65da29a2521c&oe=5D7A6B78", status_text: "⁉️ ⁉️ CÓ DÒNG KEM BODY NÀO MÀ GÂY NGHIỆN KHI BÔI KHÔNG? ⁉️\n↪️Có đấy ạ.", des_image_name: "https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.0-9/61435425_1303167033173590_9011771518010523648_n.jpg?_nc_cat=110&_nc_oc=AQnC25jceh40XiczI8ceLVa5-h6pP4CDzdDemk4MP-0JXeHZSlRIpok6eJJ8ZszasoY&_nc_ht=scontent.fsgn5-3.fna&oh=d00861a0ca7a8fd86d65c60bb741f450&oe=5DBFBC4D",like: 500, cmt: 100)
        array_temp.append(user1)
        array_temp.append(user2)
        return array_temp
    }
}

var image_cache = NSCache<AnyObject, AnyObject>()
extension UIImageView {

    
    func load_image(text: String){
        if let image_data = image_cache.object(forKey: text as AnyObject){
            self.image = image_data as! UIImage
            return
        }
        
        let activities: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activities.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        activities.color = .brown
        activities.startAnimating()
        addSubview(activities)
        let url = URL(string: text)
        do {
            let data = try Data(contentsOf: url!)
            activities.stopAnimating()
            if let image_dowload = UIImage(data: data){
                image_cache.setObject(image_dowload, forKey: text as AnyObject)
                self.image = image_dowload
            }
        } catch let err as NSError {
            print(err)
        }

    }
}
