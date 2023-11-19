//
//  ViewController.swift
//  kakaoLogin
//
//  Created by Oh Chi Hyun on 2023/11/19.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {
    @IBOutlet weak var resultField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func kakaoAccountLoginButtonDidTap(_ sender: UIButton) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                self.resultField.text = error.asAFError?.errorDescription
            }
            else {
                print("loginWithKakaoAccount() success.")

                //do something
                self.kakaoGetUserInfo()
                self.printKakaoTokenInfo()
                _ = oauthToken
                
            }
        }
    }
    

    @IBAction func kakaoLoginButtonDidTap(_ sender: UIButton) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    self.resultField.text = error.asAFError?.errorDescription
                }
                else {
                    print("loginWithKakaoTalk() success.")

                   //let idToken = oAuthToken.idToken ?? ""
                   //let accessToken = oAuthToken.accessToken
                    self.kakaoGetUserInfo()
                    _ = oauthToken
                   
                }
            }
        } else {
            self.resultField.text = "카카오 로그인 가능 상태가 아닙니다."
        }
    }
    
    @IBAction func logoutButtonDidTap(_ sender: UIButton) {
        // 로그아웃
        UserApi.shared.logout {(error) in
            if let error = error {
                self.resultField.text = error.asAFError?.errorDescription
            }
            else {
                print("logout() success.")
                self.resultField.text = "로그아웃 성공"
            }
        }
    }
    
    @IBAction func disconnectLinkButtonDidTap(_ sender: UIButton) {
        UserApi.shared.unlink {(error) in
            if let error = error {
                self.resultField.text = error.asAFError?.errorDescription
            }
            else {
                print("unlink() success.")
                self.resultField.text = "연결끊기 성공"
            }
        }
    }
    
    
    
    private func printKakaoTokenInfo() {
        UserApi.shared.accessTokenInfo {(accessTokenInfo, error) in
            if let error = error {
                self.resultField.text = error.asAFError?.errorDescription
            }
            else {
                print("accessTokenInfo() success.")                //do something
                
                
                _ = accessTokenInfo
            }
        }
    }
    
    private func kakaoGetUserInfo() {
        UserApi.shared.me() { (user, error) in
            if let error = error {
                self.resultField.text = error.asAFError?.errorDescription
            }
            
            let userNickName = user?.kakaoAccount?.profile?.nickname
            let userProfile = user?.kakaoAccount?.profile?.profileImageUrl
            
            let contentText =
            "user nickName : \(userNickName)\n userProfile : \(userProfile)"
            
            print("user - \(user)")
            
            if userNickName == nil {
                self.kakaoRequestAgreemenfit()
                return
            }
            self.resultField.text = contentText
        }
    }
        
        /// 추가 항목 동의받기
        private func kakaoRequestAgreemenfit() {
            // 추가 항목 동의 받기(사용자가 동의하지않은 항목에 대한 추가 동의 요청
            UserApi.shared.me() { (user, error) in
                if let error = error {
                    self.resultField.text = error.asAFError?.errorDescription
                }
                else {
                    if let user = user {
                        var scopes = [String]()
                        if (user.kakaoAccount?.profileNeedsAgreement == true) { scopes.append("profile") }
                        if (user.kakaoAccount?.emailNeedsAgreement == true) { scopes.append("account_email") }
                        if (user.kakaoAccount?.birthdayNeedsAgreement == true) { scopes.append("birthday") }
                        if (user.kakaoAccount?.birthyearNeedsAgreement == true) { scopes.append("birthyear") }
                        if (user.kakaoAccount?.genderNeedsAgreement == true) { scopes.append("gender") }
                        if (user.kakaoAccount?.phoneNumberNeedsAgreement == true) { scopes.append("phone_number") }
                        if (user.kakaoAccount?.ageRangeNeedsAgreement == true) { scopes.append("age_range") }
                        if (user.kakaoAccount?.ciNeedsAgreement == true) { scopes.append("account_ci") }
                        
                        if scopes.count > 0 {
                            print("사용자에게 추가 동의를 받아야 합니다.")

                            // OpenID Connect 사용 시
                            // scope 목록에 "openid" 문자열을 추가하고 요청해야 함
                            // 해당 문자열을 포함하지 않은 경우, ID 토큰이 재발급되지 않음
                            // scopes.append("openid")
                            
                            //scope 목록을 전달하여 카카오 로그인 요청
                            UserApi.shared.loginWithKakaoAccount(scopes: scopes) { (_, error) in
                                if let error = error {
                                    print(error)
                                }
                                else {
                                    UserApi.shared.me() { (user, error) in
                                        if let error = error {
                                            print(error)
                                        }
                                        else {
                                            print("me() success.")
                                            
                                            //do something
                                            _ = user
                                        }
                                    }
                                }
                            }
                        }
                        else {
                            print("사용자의 추가 동의가 필요하지 않습니다.")
                        }
                    }
                }
            }
        }
}
extension DefaultStringInterpolation {
  mutating func appendInterpolation<T>(_ optional: T?) {
    appendInterpolation(String(describing: optional))
  }
}
