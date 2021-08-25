//
//  MangoPickViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

class MangoPickViewController: UIViewController {

    @IBOutlet weak var eatDealButton: UIButton!
    @IBOutlet weak var storyButton: UIButton!
    @IBOutlet weak var topListButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var animationBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.changeViewByTabBar()
        
        /*
        guard let EatDealVC = self.storyboard?.instantiateViewController(identifier: "EatDealViewController") as? EatDealViewController else {
            return
        }
        for view in contentView.subviews{
            view.removeFromSuperview()
        }
        EatDealVC.willMove(toParent: self)
        contentView.frame = EatDealVC.view.bounds
        contentView.addSubview(EatDealVC.view)
        self.addChild(EatDealVC)
        EatDealVC.didMove(toParent: self)*/
    }
    
    
    
    @IBAction func topTabBarbuttonTab(_ sender: UIButton) {
        sender.isSelected = true
        if sender.tag == 0 {
            storyButton.isSelected = false
            topListButton.isSelected = false
            slideViewAnimation(moveX: 0)
        } else if sender.tag == 1{
            eatDealButton.isSelected = false
            topListButton.isSelected = false
            slideViewAnimation(moveX: self.view.frame.width/3)
        }
        else{
            eatDealButton.isSelected = false
            storyButton.isSelected = false
            slideViewAnimation(moveX: 2)
            slideViewAnimation(moveX: self.view.frame.width/3*2)
        }
    }
    
    func slideViewAnimation(moveX: CGFloat){
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5,initialSpringVelocity: 1, options: .allowUserInteraction,
                       animations: {
                        //변하기 전의 모습으로는 identity로 접근이 가능함.
                        self.animationBar.transform = CGAffineTransform(translationX: moveX, y: 0)
                       }, completion: {_ in
                       })
    }
    
    
    @IBAction func didTapEatDeal(_ sender: Any) {
        
        /*guard let EatDealVC = self.storyboard?.instantiateViewController(identifier: "EatDealViewController") as? EatDealViewController else {
            return
        }
        for view in contentView.subviews{
            view.removeFromSuperview()
        }
        EatDealVC.willMove(toParent: self)
        contentView.frame = EatDealVC.view.bounds
        contentView.addSubview(EatDealVC.view)
        self.addChild(EatDealVC)
        EatDealVC.didMove(toParent: self)*/
        
    }
    
    
    @IBAction func didTapStory(_ sender: Any) {
    }
    
    @IBAction func didTapTopList(_ sender: Any) {
    }
    
    
    func changeViewByTabBar(){
        guard let EATDealVC = self.storyboard?.instantiateViewController(identifier: "EatDealViewController") as? EatDealViewController else {
            return
        }
        for view in contentView.subviews{
            view.removeFromSuperview()
        }
        EATDealVC.willMove(toParent: self)
        contentView.frame = EATDealVC.view.bounds
        contentView.addSubview(EATDealVC.view)
        self.addChild(EATDealVC)
        EATDealVC.didMove(toParent: self)
    }
    
    


}
