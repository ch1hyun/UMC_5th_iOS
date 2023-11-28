//
//  ViewController.swift
//  loginMission
//
//  Created by Oh Chi Hyun on 2023/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = "로그인 서비스"
    }

    
    @IBAction func joinButtonDidTap(_ sender: UIButton) {
        if (checkInputs() == false) {
            return
        }
        let id = idTextField.text
        let pw = pwTextField.text
        
        if let object = UserDefaults.standard.object(forKey: (id)!) {
            resultLabel.text = "이미 \((id)!)의 아이디가 존재합니다."
            return
        }
        
        UserDefaults.standard.set((pw)!, forKey: (id)!)
        
        resultLabel.text = "회원가입 성공\n아이디 : \((id)!)\n비밀번호 : \((pw)!)"
        idTextField.text = ""
        pwTextField.text = ""
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        if (checkInputs() == false) {
            return
        }
        let id = idTextField.text
        let pw = pwTextField.text
        
        if let object = UserDefaults.standard.object(forKey: (id)!) {
            if pw == pwTextField.text {
                resultLabel.text = "로그인에 성공하였습니다. \n로그인 아이디 : \((id)!)"
                idTextField.text = ""
                pwTextField.text = ""
                return
            }
            
            resultLabel.text = "비밀번호가 틀렸습니다."
            return
        }
        
        resultLabel.text = "아이디가 존재하지 않습니다."
        UserDefaults.standard.
    }
    
    
    
    private func checkInputs() -> Bool {
        if (idTextField.text == "") {
            resultLabel.text = "아이디를 입력하세요"
            return false
        }
        
        if (pwTextField.text == "") {
            resultLabel.text = "비밀번호를 입력하세요"
            return false
        }
        
        return true
    }
}

