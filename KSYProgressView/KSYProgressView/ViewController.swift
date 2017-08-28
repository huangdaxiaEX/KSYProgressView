//
//  ViewController.swift
//  KSYProgressView
//
//  Created by huangdaxia on 2017/8/28.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let circle = KSYProgressView()
    let line = KSYProgressView(progressBarType: .line)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        circle.progressColor = UIColor.yellow
        line.progressColor = UIColor.orange
        
        circle.frame = CGRect(x: view.center.x - 100, y: 128, width: 200, height: 200)
        line.frame = CGRect(x: view.center.x - 140, y: 360, width: 280, height: 20)
        
        view.addSubview(circle)
        view.addSubview(line)
        
        
        let btn = UIButton(type: .plain)
        btn.backgroundColor = .green
        btn.frame = CGRect(x: view.center.x - 64, y: 420, width: 128, height: 44)
        btn.setTitle("change progress", for: .normal)
        btn.addTarget(self, action: #selector(changeProgress), for: .touchUpInside)
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func changeProgress() {
        let progress = CGFloat(Float(arc4random() % 100) / 100.0)
        
        let r = CGFloat(Float(arc4random() % 100) / 100.0)
        let g = CGFloat(Float(arc4random() % 100) / 100.0)
        let b = CGFloat(Float(arc4random() % 100) / 100.0)
        circle.update(progress: progress, color: UIColor.init(red: r, green: g, blue: b, alpha: 1), animated: true)
        line.update(progress: progress, color: UIColor.init(red: r, green: g, blue: b, alpha: 1), animated: true)
    }

}

