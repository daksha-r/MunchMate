import UIKit
import CoreML

class FinalViewController: UIViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 3
        
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
    //        // Example usage of findOverlappingIngredients function
    //        let symptoms = "headache"
    //        let otherIngredients = allIngredients
    //        let overlappingIngredients = findOverlappingIngredients(symptoms: symptoms, otherIngredients: otherIngredients)
    //        print("Overlapping Ingredients: \(overlappingIngredients)")
    //    }
    //
    //    func findOverlappingIngredients(symptoms: String, otherIngredients: [String]) -> [String] {
    //        // Placeholder for integrating ML model to generate ingredients based on symptoms
    //     //   let ingredientList = generateIngredientsFromMLModel(order: symptoms)
    //
    //        // Format the list of ingredients into an array
    //        let symptomIngredientsArray = ingredientList.components(separatedBy: ", ")
    //
    //        // Find overlapping ingredients with the provided list of other ingredients
    //        let overlappingIngredients = symptomIngredientsArray.filter { otherIngredients.contains($0) }
    //
    //        return overlappingIngredients
    //    }
    //
    //    // Placeholder for integrating ML model to generate ingredients based on symptoms
    //    func generateIngredientsFromMLModel(order: Int) -> [String] {
    //        func generateIngredientsFromMLModel(order: Int) -> [String] {
    //            do {
    //                let config = MLModelConfiguration()
    //                let model = try Food(configuration: config)
    //                let prediction = try model.prediction(order: Int64(order))
    //
    //                // Access the appropriate property or properties of the prediction to get the ingredients
    //                let ingredientsString = prediction.ingredients
    //
    //                // Split the ingredients string by commas to get an array of ingredients
    //                let ingredientsArray = ingredientsString.components(separatedBy: ",")
    //
    //                return ingredientsArray
    //            } catch {
    //                print("Error: \(error)")
    //                return []
    //            }
    //        }
    //
    //    }
    //
    //}
}
