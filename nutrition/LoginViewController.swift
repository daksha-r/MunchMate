//
//  LoginViewController.swift
//  Nutritionn
//
//  Created by Daksha Rajagopal on 2/18/24.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        validateFields()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "home")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signup")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func validateFields() {
        if email.text?.isEmpty == true {
            print("no email text")
            return
            
        }
        if password.text?.isEmpty == true {
            print("no password text")
            return
        }
        
        login()
        
        
    }
    
    func login() {

        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self!.checkUserInfo()


        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "dietlog")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
        
    }
    /*
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
