//
//  ViewController.swift
//  MVC
//
//  Created by Emre Eraslan on 14.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setInitViews()
    }
    private func setInitViews(){
        usernameField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
    }
    
    @objc private func validateFields(){
        loginBtn.isEnabled = usernameField.text  != "" && passwordField.text != ""
    }
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        NetworkService.shared.login(username: usernameField.text!, password: passwordField.text!) {
            succes in
            if succes{
                self.goToProfilePage()
            }else {
                print("Invalid credentials")
            }
        }
    }
    private func goToProfilePage(){
        let vc = storyboard?.instantiateViewController(identifier: "Profile") as! ProfileViewController
        present(vc,animated: true)
    }
    
    override func touchesBegan(_ touchers: Set<UITouch>,with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

