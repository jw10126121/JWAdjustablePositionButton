//
//  ViewController.swift
//  JWAdjustablePositionButton
//
//  Created by 10126121@qq.com on 04/08/2019.
//  Copyright (c) 2019 10126121@qq.com. All rights reserved.
//

import UIKit
import JWAdjustablePositionButton
import SnapKit

class ViewController: UIViewController {
    
    lazy var leftIconButton: JWAdjustablePositionButton = {
        let view = JWAdjustablePositionButton()
        view.position = .leftImageRightText
        view.backgroundColor = UIColor.red
        view.setTitle(view.position.description, for: .normal)
        view.setImage(UIImage(named: "ButtonImage"), for: .normal)
//        view.contentSpace = 5
        return view
    }()
    
    lazy var rightIconButton: JWAdjustablePositionButton = {
        let view = JWAdjustablePositionButton()
        view.position = .leftTextRightImage
        view.backgroundColor = UIColor.red
        view.setTitle(view.position.description, for: .normal)
        view.setImage(UIImage(named: "ButtonImage"), for: .normal)
        return view
    }()
    
    lazy var topIconButton: JWAdjustablePositionButton = {
        let view = JWAdjustablePositionButton()
        view.position = .topImageBottomText
        view.backgroundColor = UIColor.red
        view.setTitle(view.position.description, for: .normal)
        view.setImage(UIImage(named: "ButtonImage"), for: .normal)
        return view
    }()
    
    lazy var bottomIconButton: JWAdjustablePositionButton = {
        let view = JWAdjustablePositionButton()
        view.position = .topTextBottomImage
        view.backgroundColor = UIColor.red
        view.setTitle(view.position.description, for: .normal)
        view.setImage(UIImage(named: "ButtonImage"), for: .normal)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(leftIconButton)
        view.addSubview(rightIconButton)
        view.addSubview(topIconButton)
        view.addSubview(bottomIconButton)

//        let screenWidth = UIScreen.main.bounds.size.width
        
        leftIconButton.snp.makeConstraints {
            $0.left.equalTo(20)
            $0.top.equalTo(80)
            $0.size.equalTo(rightIconButton)
            $0.height.equalTo(100)
//            $0.width.equalTo(100)
        }
        
        rightIconButton.snp.makeConstraints {
            $0.left.equalTo(leftIconButton.snp.right).offset(10)
            $0.right.equalTo(-20)
            $0.top.equalTo(leftIconButton)
        }
        
        topIconButton.snp.makeConstraints {
            $0.left.equalTo(leftIconButton)
            $0.top.equalTo(leftIconButton.snp.bottom).offset(10)
            $0.size.equalTo(leftIconButton)
        }
        
        bottomIconButton.snp.makeConstraints {
            $0.right.equalTo(rightIconButton)
            $0.top.equalTo(topIconButton)
            $0.size.equalTo(leftIconButton)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

