import UIKit

var disease_list: [String] = []
var person_diseases: [String] = []

class SymptomViewController: UIViewController {
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var migraine: UISwitch!
    @IBOutlet var stomachache: UISwitch!
    @IBOutlet var high_blood_pressure: UISwitch!
    @IBOutlet var coronary_artery: UISwitch!
    @IBOutlet var type_2_diabetes: UISwitch!
    @IBOutlet var esophagus_inflammation: UISwitch!
    @IBOutlet var cardiomyopathy: UISwitch!
    @IBOutlet var amnesia: UISwitch!
    @IBOutlet var unspecified_joint_pain: UISwitch!
    @IBOutlet var hypothyroidism: UISwitch!
    @IBOutlet var constipation: UISwitch!
    @IBOutlet var edema: UISwitch!
    @IBOutlet var celiac_disease: UISwitch!
    @IBOutlet var psoriasis: UISwitch!
    
    @IBAction func final(_ sender: Any) {
        createArr(diseaseSwitch: migraine, disease_name: "Migraine")
        createArr(diseaseSwitch: stomachache, disease_name: "Stomachache")
        createArr(diseaseSwitch: high_blood_pressure, disease_name: "High Blood Pressure")
        createArr(diseaseSwitch: coronary_artery, disease_name: "Coronary Artery Disease" )
        createArr(diseaseSwitch: type_2_diabetes, disease_name: "Type 2 Diabetes")
        createArr(diseaseSwitch: esophagus_inflammation, disease_name: "Esophagus Inflammation")
        createArr(diseaseSwitch: cardiomyopathy, disease_name: "Cardiomyopathy")
        createArr(diseaseSwitch: amnesia, disease_name: "Amnesia")
        createArr(diseaseSwitch: unspecified_joint_pain, disease_name: "Unspecified Joint Pain")
        createArr(diseaseSwitch: hypothyroidism, disease_name: "Hypothyroidism")
        createArr(diseaseSwitch: constipation, disease_name: "Constipation")
        createArr(diseaseSwitch: edema, disease_name: "Edema")
        createArr(diseaseSwitch: celiac_disease, disease_name: "Celiac Disease")
        createArr(diseaseSwitch: psoriasis, disease_name: "Psoriasis")
        print(person_diseases)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "output")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 2
        
    }
    
    func createArr(diseaseSwitch: UISwitch, disease_name: String) {
        if diseaseSwitch.isOn {
            person_diseases.append(disease_name)
        }
    }
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "home")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: false)
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "dietlog")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: false)
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "symptom")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: false)
        case 3:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "output")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: false)
        case 4:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "profile")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: false)
        default:
            break
        }
    }

}
