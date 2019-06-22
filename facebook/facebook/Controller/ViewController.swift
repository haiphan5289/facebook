//
//  ViewController.swift
//  facebook
//
//  Created by HaiPhan on 6/21/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navibar: UINavigationBar!
    var navi_item: UINavigationItem!
    @IBOutlet weak var fb_collect: UICollectionView!
    var tab_bar: UITabBar!
    let CellWithReuseIdentifier = "cell"
    var array_user: [post] = [post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        set_up_view()
        
        fb_collect.delegate = self
        fb_collect.dataSource = self
        
        fb_collect.register(fb_cell.self, forCellWithReuseIdentifier: CellWithReuseIdentifier)
        
        //khởi tạo biến bên create post
        let post_model = post_feature()
        array_user = post_model.create_post()
    }
    
    func set_up_view(){
        navi_bar_setup_autolayout()
        fb_collect_Setup_autolayout()
        tab_bar_setup_autolayout()
    }
    
    //setup - tabbar
    func tab_bar_setup_autolayout(){
        tab_bar = UITabBar()
        tab_bar.backgroundColor = UIColor.darkGray
        let home = ViewController()
        home.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        home.tabBarItem.title = "Home"
        fb_collect.addSubview(tab_bar)
        
        tab_bar.translatesAutoresizingMaskIntoConstraints = false
        tab_bar.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tab_bar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tab_bar.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tab_bar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    //setup - autolayout navibar
    func navi_bar_setup_autolayout(){
        //setup title
        navi_item = UINavigationItem(title: "Facebook")
        self.navibar.setItems([navi_item], animated: true)
        //setup màu navi bar & view cung nhau
        UIApplication.shared.statusBarStyle = .lightContent

        //backgrounf navi bả
        navibar.barTintColor = UIColor(red: 52/255, green: 90/255, blue: 149/255, alpha: 1)
        navibar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.init(name: "HelveticaNeue", size: 25)]
//        navibar.tintColor = .white
        view.backgroundColor = UIColor(red: 52/255, green: 90/255, blue: 149/255, alpha: 1)
        //chọn thuọc tiinsh navibar
        navibar.isTranslucent = false
//        navibar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.init(name: "HelveticaNeue", size: 25)]
//        let barView = UIView(frame: CGRect(x:0, y:30, width:view.frame.width, height:UIApplication.shared.statusBarFrame.height))
//        barView.backgroundColor = UIColor.red
//        view.addSubview(barView)

    }
    
    func fb_collect_Setup_autolayout(){
        fb_collect.translatesAutoresizingMaskIntoConstraints = false
        
        fb_collect.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        fb_collect.topAnchor.constraint(equalTo: navibar.bottomAnchor, constant: 0).isActive = true
        fb_collect.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        fb_collect.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array_user.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = fb_collect.dequeueReusableCell(withReuseIdentifier: CellWithReuseIdentifier, for: indexPath) as! fb_cell
        cell.layer.borderColor = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1).cgColor
        cell.layer.borderWidth = 1
        
        //tao biên là user
        let user = self.array_user[indexPath.row]
        cell.post = self.array_user[indexPath.row]
        cell.height_status!.constant = estiamte_size_for_text(text: user.status_text!).height
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let user = self.array_user[indexPath.row]
        let height_user = estiamte_size_for_text(text: user.status_text!).height + 20 + 240
        return CGSize(width: self.view.frame.width, height: height_user)
    }
    
    //customiz width & height cho cell phụ thuộc vào text
    func estiamte_size_for_text(text: String) -> CGRect{
        let size = CGSize(width: self.view.frame.width - 16, height: 1000)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: option, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)], context: nil)
    }
    
    
}

