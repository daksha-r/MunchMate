//
//  ProfileViewController.swift
//  nutrition
//
//  Created by Daksha Rajagopal on 2/25/24.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "home")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "dietlog")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "symptom")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        case 3:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "output")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        case 4:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "profile")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 4
        // Do any additional setup after loading the view.
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
