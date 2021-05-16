//
//  ViewController.swift
//  swiftAndOC
//
//  Created by xuzaihu on 2020/10/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Swift页面"
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("点击跳转", for: .normal)
        button.setTitleColor(.black, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
    }
    
    @objc func didClickButton() {
        let myVC = MyViewController()
        myVC.myTest()
        navigationController?.pushViewController(myVC, animated: true)
    }


}

