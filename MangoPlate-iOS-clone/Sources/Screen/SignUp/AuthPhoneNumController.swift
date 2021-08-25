//
//  AuthEmailViewController.swift
//  MangoPlate-iOS-clone
//
//  Created by 김모경 on 2021/08/19.
//

import UIKit

protocol SendPhoneNumDelegate {
    func sendData(data: String)
}

class AuthPhoneNumController: UIViewController {

    //var tempEmail = ""
    //var tempPwd = ""
    
    var tempNum : String = ""
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneNumInput: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    var num : String?
    
    @IBAction func editPhoneNum(_ sender: Any) {
        nextBtn.backgroundColor = .orange
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        guard let phoneNum = phoneNumInput.text, !phoneNum.isEmpty else { return }
        
        tempNum = phoneNum
        
        /*
        let nextVC = EnterNameViewController(nibName: "EnterNameViewController", bundle: nil)
        
        nextVC.sentPhoneNum = phoneNum
        nextVC.sentEmail = tempEmail
        nextVC.sentPwd = tempPwd
        
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)*/
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //num = phoneNumInput.text
        
         //네비게이션 바 설정
         self.navigationController?.navigationBar.tintColor = .darkGray
         self.navigationController?.navigationBar.topItem?.title = "휴대폰 번호 인증"
         
    
        label.text = "본인 인증으로 망고플레이트에서 \n제안하는 맛집을 다양하게 즐겨보세요!"
        //텍스트필드 언더라인 설정
        phoneNumInput.borderStyle = .none
        
        let border = CALayer()
        border.frame = CGRect(x: 0, y: phoneNumInput.frame.size.height-1, width: phoneNumInput.frame.width, height: 1)
        border.backgroundColor = UIColor.lightGray.cgColor
        phoneNumInput.layer.addSublayer((border))
        
    
    }

}
