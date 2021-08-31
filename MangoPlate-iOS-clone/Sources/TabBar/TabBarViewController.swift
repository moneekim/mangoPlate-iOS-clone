//
//  TabBarViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/20.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet var containerMainView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBarStackView: UIStackView!
    
    @IBOutlet weak var searchRestuarantImage: UIButton!
    @IBOutlet weak var searchRestuarantLabel: UIButton!
    
    @IBOutlet weak var mangoPickImage: UIButton!
    @IBOutlet weak var mangoPickLabel: UIButton!
    
    @IBOutlet weak var plusImage: UIButton!
    
    @IBOutlet weak var theNewsImage: UIButton!
    @IBOutlet weak var theNewsLabel: UIButton!

    @IBOutlet weak var myProfileImage: UIButton!
    @IBOutlet weak var myProfileLabel: UIButton!
    
    @IBOutlet weak var animationBar: UIView!
    
    
    var tabBarItemImage : [UIButton] = [UIButton]()
    var tabBarItemLabel : [UIButton] = [UIButton]()
    //let transition =  CircularTransition()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItemImage = [self.searchRestuarantImage , self.mangoPickImage , self.theNewsImage, self.myProfileImage]
        self.tabBarItemLabel = [self.searchRestuarantLabel , self.mangoPickLabel , self.theNewsLabel, self.myProfileLabel]
        
        changeViewToSearchRestuarantView(containerView: contentView)
        
        selectedStatusTabBarButton(selectedTabBarImage: self.searchRestuarantImage, selectedTabBarLabel: self.searchRestuarantLabel)
        
        self.plusImage.layer.cornerRadius = self.plusImage.frame.width/2

    }
    
    @IBAction func searchRestuarantButtonTab(_ sender: Any) {
        changeViewToSearchRestuarantView(containerView: contentView)
        slideViewAnimation(moveX: 0)
        //self.tabBarItemImage = UIImage("selectedStatusTabBarButton")백엔드
        selectedStatusTabBarButton(selectedTabBarImage: self.searchRestuarantImage, selectedTabBarLabel: self.searchRestuarantLabel)
    }
    
    @IBAction func mangoPickButtonTab(_ sender: Any) {
        changeViewToMangoPickView(containerView: contentView)
        slideViewAnimation(moveX: self.view.frame.width/5)
        selectedStatusTabBarButton(selectedTabBarImage: self.mangoPickImage, selectedTabBarLabel: self.mangoPickLabel)
    }
    
    @IBAction func theNewsButtonTab(_ sender: Any) {
        changeViewToTheNewsView(containerView: contentView)
        slideViewAnimation(moveX: self.view.frame.width/5*3)
        selectedStatusTabBarButton(selectedTabBarImage: self.theNewsImage, selectedTabBarLabel: self.theNewsLabel)
    }
    
    @IBAction func profileButtonTab(_ sender: Any) {
        changeViewToLoginProfileView(containerView: contentView)
        slideViewAnimation(moveX: self.view.frame.width/5*4)
        selectedStatusTabBarButton(selectedTabBarImage: self.myProfileImage, selectedTabBarLabel: self.myProfileLabel)
    }

    @IBAction func plusButtonTab(_ sender: Any) {
        changeViewToPlusView(containerView: contentView)
        slideViewAnimation(moveX: self.view.frame.width/5*2)
        //selectedStatusTabBarButton(selectedTabBarImage: self.myProfileImage, selectedTabBarLabel: self.myProfileLabel)
    }
    
    // MARK:커스텀 탭바 버튼들의 isSelect 바꾸는 함수
    func selectedStatusTabBarButton(selectedTabBarImage : UIButton, selectedTabBarLabel : UIButton){
        tabBarItemImage = tabBarItemImage.map { button in
            button.isSelected = false
            return button
        }
        tabBarItemLabel = tabBarItemLabel.map { button in
            button.isSelected = false
            return button
        }
        selectedTabBarImage.isSelected = true
        selectedTabBarLabel.isSelected = true
    }
    
    
//    func changeViewToProfileView(){
//        changeViewToLoginProfileView()
//    }
    
    
    func slideViewAnimation(moveX: CGFloat){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5,initialSpringVelocity: 0.7, options: .allowUserInteraction,
                       animations: {
                        //변하기 전의 모습으로는 identity로 접근이 가능함.
                        self.animationBar.transform = CGAffineTransform(translationX: moveX, y: 0)
                       }, completion: {_ in
                       })
    }
}



/*
// MARK: 플러스화면 이동에 필요한 함수 모음
extension TabBarViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! PlusViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
        secondVC.xButtonMidY = plusImage.frame.midY
        secondVC.screenHeight = self.contentView.bounds.size.height
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = CGPoint(x: self.contentView.bounds.size.width/2, y: self.contentView.bounds.size.height - plusImage.frame.midY)
        //print(self.contentView.bounds.size.height)
        transition.circleColor = plusImage.backgroundColor!
        
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = CGPoint(x: self.contentView.bounds.size.width/2, y: self.contentView.bounds.size.height - plusImage.frame.midY)
        transition.circleColor = plusImage.backgroundColor!
        
        return transition
    }
}
*/


extension TabBarViewController{
    
    // MARK: Custom TabBar 화면전환
    func changeViewToSearchRestuarantView(containerView: UIView){
        guard let SearchVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "HomeViewController") as? HomeViewController else {
            return
        }
        for view in containerView.subviews{
            view.removeFromSuperview()
        }
        SearchVC.willMove(toParent: self)
        containerView.frame = SearchVC.view.bounds
        containerView.addSubview(SearchVC.view)
        self.addChild(SearchVC)
        SearchVC.didMove(toParent: self)
    }
    
    func changeViewToMangoPickView(containerView: UIView){
        guard let mangoPickVC = UIStoryboard(name: "MangoPick", bundle: nil).instantiateViewController(identifier: "MangoPickViewController") as? MangoPickViewController else {
            return
        }
        for view in containerView.subviews{
            view.removeFromSuperview()
        }
        mangoPickVC.willMove(toParent: self)
        containerView.addSubview(mangoPickVC.view)
        self.addChild(mangoPickVC)
        mangoPickVC.didMove(toParent: self)
    }
    
    func changeViewToPlusView(containerView: UIView){
        guard let plusVC = UIStoryboard(name: "Plus", bundle: nil).instantiateViewController(identifier: "PlusViewController") as? PlusViewController else {
            return
        }
        for view in containerView.subviews{
            view.removeFromSuperview()
        }
        plusVC.willMove(toParent: self)
        containerView.addSubview(plusVC.view)
        self.addChild(plusVC)
        plusVC.didMove(toParent: self)
    }
    
    func changeViewToTheNewsView(containerView: UIView){
        guard let theNewsVC = UIStoryboard(name: "News", bundle: nil).instantiateViewController(identifier: "NewsViewController") as? NewsViewController else {
            return
        }
        for view in containerView.subviews{
            view.removeFromSuperview()
        }
        theNewsVC.willMove(toParent: self)
        containerView.addSubview(theNewsVC.view)
        self.addChild(theNewsVC)
        theNewsVC.didMove(toParent: self)
    }
    
    /*
    func changeViewToUnLoginProfileView(containerView: UIView){
        guard let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {
            return
        }
        for view in containerView.subviews{
            view.removeFromSuperview()
        }
        profileVC.willMove(toParent: self)
        containerView.addSubview(profileVC.view)
        self.addChild(profileVC)
        profileVC.didMove(toParent: self)
    }*/
    
    func changeViewToLoginProfileView(containerView: UIView){
        
        guard let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(identifier: "ProfileViewController") as? ProfileViewController else {
            return
        }
        
        for view in containerView.subviews{
            view.removeFromSuperview()
        }
        profileVC.willMove(toParent: self)
        containerView.addSubview(profileVC.view)
        self.addChild(profileVC)
        profileVC.didMove(toParent: self)
    }
    
}

