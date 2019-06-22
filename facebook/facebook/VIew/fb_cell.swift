//
//  fb_cell.swift
//  facebook
//
//  Created by HaiPhan on 6/21/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class fb_cell: UICollectionViewCell {
    
    var post: post? {
        didSet{
            guard let user = post?.user_name, let img_name = post?.profile_image_name, let status = post?.status_text, let name_des = post?.des_image_name, let so_like = post?.like, let so_cmt = post?.cmt else {
                return
            }
            user_name_object(text: user)
//            profile_image.image = UIImage(named: img_name)
            profile_image.load_image(text: img_name)
            des.text = status
//            image_des.image = UIImage(named: name_des)
            image_des.load_image(text: name_des)
            setup_text_like_comment(like: so_like, comment: so_cmt)
        }
    }
    
    var profile_image: UIImageView!
    var user_name: UILabel!
    var des : UITextView!
    var image_des: UIImageView!
    var likescommentlabel: UILabel!
    var lines_view: UIView!
    var likes_button: UIButton!
    var commnet_button: UIButton!
    var share_button: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup_view()
    }
    
    func setup_view(){
        profile_image_setup_autolayout()
        user_name_setup_autolayout()
        des_setup_autolayout()
        
        lines_view_setup_autolayout()
        likescommentlabel_setup_autolayout()
        image_des_setup_autolayout()
        likes_button_setup_autolayout()
        commnet_button_setup_autolayout()
        share_button_setup_autolayout()
        
        
    }
    
    //setup - share buttpn
    func share_button_setup_autolayout(){
        share_button = UIButton(type: .system)
        share_button.setTitle("Share", for: .normal)
        share_button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        share_button.tintColor = UIColor(red: 151/255, green: 161/255, blue: 171/255, alpha: 1)
        share_button.setImage(UIImage(named: "share"), for: .normal)
        share_button.contentMode = .scaleAspectFill
        lines_view.addSubview(share_button)
        
        share_button.translatesAutoresizingMaskIntoConstraints = false
        share_button.leftAnchor.constraint(equalTo: commnet_button.rightAnchor, constant: 0).isActive = true
        share_button.topAnchor.constraint(equalTo: lines_view.topAnchor, constant: 0).isActive = true
        share_button.widthAnchor.constraint(equalTo: lines_view.widthAnchor, multiplier: 1/3).isActive = true
        share_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //setup - comment button
    func commnet_button_setup_autolayout(){
        commnet_button = UIButton(type: .system)
        commnet_button.setTitle("Comments", for: .normal)
        commnet_button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        commnet_button.tintColor = UIColor(red: 151/255, green: 161/255, blue: 171/255, alpha: 1)
        commnet_button.setImage(UIImage(named: "comments"), for: .normal)
        commnet_button.contentMode = .scaleAspectFill
        lines_view.addSubview(commnet_button)
        
        commnet_button.translatesAutoresizingMaskIntoConstraints = false
        commnet_button.leftAnchor.constraint(equalTo: likes_button.rightAnchor, constant: 0).isActive = true
        commnet_button.topAnchor.constraint(equalTo: lines_view.topAnchor, constant: 0).isActive = true
        commnet_button.widthAnchor.constraint(equalTo: lines_view.widthAnchor, multiplier: 1/3).isActive = true
        commnet_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //setup -likes button
    func likes_button_setup_autolayout(){
        likes_button = UIButton(type: .system)
        likes_button.setTitle("Likes", for: .normal)
        likes_button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        likes_button.tintColor = UIColor(red: 151/255, green: 161/255, blue: 171/255, alpha: 1)
        likes_button.setImage(UIImage(named: "like"), for: .normal)
        likes_button.contentMode = .scaleAspectFill
        //        likes_button.backgroundColor = UIColor.green
        lines_view.addSubview(likes_button)
        
        likes_button.translatesAutoresizingMaskIntoConstraints = false
        likes_button.leftAnchor.constraint(equalTo: lines_view.leftAnchor, constant: 0).isActive = true
        likes_button.topAnchor.constraint(equalTo: lines_view.topAnchor, constant: 0).isActive = true
        likes_button.widthAnchor.constraint(equalTo: lines_view.widthAnchor, multiplier: 1/3).isActive = true
        likes_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    //setup - line view
    func lines_view_setup_autolayout(){
        lines_view = UIView()
        //        lines_view.backgroundColor = UIColor.darkGray
        addSubview(lines_view)
        
        lines_view.translatesAutoresizingMaskIntoConstraints = false
        lines_view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        lines_view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        lines_view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        lines_view.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    //setup - likescommentlabel
    func likescommentlabel_setup_autolayout(){
        likescommentlabel = UILabel()

        likescommentlabel.font = UIFont.boldSystemFont(ofSize: 12)
        likescommentlabel.textColor = UIColor(red: 151/255, green: 161/255, blue: 171/255, alpha: 1)
        likescommentlabel.textAlignment = .left
        addSubview(likescommentlabel)
        
        likescommentlabel.translatesAutoresizingMaskIntoConstraints = false
        likescommentlabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        likescommentlabel.bottomAnchor.constraint(equalTo: lines_view.topAnchor, constant: 8).isActive = true
        likescommentlabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        likescommentlabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setup_text_like_comment(like: Int, comment: Int){
        likescommentlabel.text = "\(like) Likes    \(comment) Comments"
    }
    
    //setup - image
    func image_des_setup_autolayout(){
        image_des = UIImageView()
        image_des.backgroundColor = UIColor.black
        image_des.isUserInteractionEnabled = true
        image_des.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handle_zoo_image)))
        addSubview(image_des)
        
        image_des.translatesAutoresizingMaskIntoConstraints = false
        image_des.topAnchor.constraint(equalTo: des.bottomAnchor, constant: 8).isActive = true
        image_des.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        image_des.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        image_des.bottomAnchor.constraint(equalTo: likescommentlabel.topAnchor, constant: 8).isActive = true
    }
    var image_view_frame: CGRect!
    var zoom_image: UIImageView!
    var back_ground: UIView!
    var image_view: UIImageView!
    @objc func handle_zoo_image(tap: UITapGestureRecognizer){
        image_view = tap.view as! UIImageView
        image_view_frame = image_view.superview?.convert(image_view.frame, to: nil)
        zoom_image = UIImageView()
        zoom_image.frame = image_view_frame
        zoom_image.image = image_view.image
        
        if let key_win = UIApplication.shared.keyWindow {
            back_ground = UIView()
            back_ground.frame = CGRect(x: 0, y: 0, width: key_win.frame.width, height: key_win.frame.height)
            back_ground.backgroundColor = UIColor.black
            back_ground.alpha = 1
            back_ground.isUserInteractionEnabled = true
            back_ground.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handle_zoom_in_image)))
            key_win.addSubview(back_ground)
            key_win.addSubview(zoom_image)
//            key_win.addSubview(image_view)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                print(self.zoom_image.frame.height)
                print(self.self.zoom_image.frame.width)
                var height = self.zoom_image.frame.height / self.zoom_image.frame.width * key_win.frame.width
                if height > 500 {
                    height = 450
                }
                self.zoom_image.frame = CGRect(x: 0, y: 0, width: key_win.frame.width, height: height)
                self.zoom_image.center = key_win.center
            }, completion: nil)
        }
    }
    
    @objc func handle_zoom_in_image(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.zoom_image.frame = self.image_view.frame
            self.zoom_image.removeFromSuperview()
            self.back_ground.alpha = 0
        }, completion: nil)
    }
    
    //setup - des
    var width_status: NSLayoutConstraint?
    var height_status: NSLayoutConstraint?
    func des_setup_autolayout(){
        des = UITextView()
        des.text = "222222222222222222222222222222222222"
        des.font = UIFont.boldSystemFont(ofSize: 14)
        addSubview(des)
        
        des.translatesAutoresizingMaskIntoConstraints = false
        des.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        des.topAnchor.constraint(equalTo: user_name.bottomAnchor, constant: 8).isActive = true
        width_status = des.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -8)
        width_status?.isActive = true
        height_status = des.heightAnchor.constraint(equalToConstant: 30)
        height_status?.isActive = true
    }
    
    //setup - username
    func user_name_setup_autolayout(){
        user_name = UILabel()
        //        user_name.text = "Phan Thanh Hải" + "\n" + "FFFFFFFFFFFFFFFFFFFFFFFFFFF"
        
        
        addSubview(user_name)
        
        user_name.translatesAutoresizingMaskIntoConstraints = false
        user_name.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        user_name.leftAnchor.constraint(equalTo: profile_image.rightAnchor, constant: 8).isActive = true
        user_name.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        user_name.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    //setup font của user name
    func user_name_object(text:String){
        user_name.font = UIFont.boldSystemFont(ofSize: 16)
        user_name.numberOfLines = 2
        
        //setup thuộc tinh text 1
        let attributeString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        
        attributeString.append(NSMutableAttributedString(string: "\nDecember 18", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
        let para = NSMutableParagraphStyle()
        para.lineSpacing = 4
        let lenght = attributeString.string.count
        attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: para, range: NSRange(location: 0, length: lenght))
        user_name.attributedText = attributeString
    }
    
    //setup - prodile image
    func profile_image_setup_autolayout(){
        profile_image = UIImageView()
//        profile_image.image = UIImage(named: "profile")
        addSubview(profile_image)
        
        profile_image.translatesAutoresizingMaskIntoConstraints = false
        profile_image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profile_image.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        profile_image.widthAnchor.constraint(equalToConstant: 44).isActive = true
        profile_image.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
