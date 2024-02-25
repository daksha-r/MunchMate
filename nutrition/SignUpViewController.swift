//
//  SignUpViewController.swift
//  Nutritionn
//
//  Created by Daksha Rajagopal on 2/18/24.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBAction func back(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func signUp() {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
        }
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let vc = storyboard.instantiateViewController(withIdentifier: "home")
      vc.modalPresentationStyle = .overFullScreen
      present(vc, animated: true)
        
        
        
    }

    @IBAction func signUpTapped(_ sender: UIButton) {
        if email.text?.isEmpty == true {
            print("No text in email field")
    
            return
        }
        if password.text?.isEmpty == true {
            print("No text in password field")
            return
            }
              
        signUp()
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
