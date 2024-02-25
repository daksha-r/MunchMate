import UIKit
import Foundation
import Alamofire
var breakfastIngredients: [String] = []
var lunchIngredients: [String] = []
var dinnerIngredients: [String] = []
var otherIngredients: [String] = []
var allIngredients: [String] = []
class DietLogViewController: UIViewController {
    
    @IBOutlet var breakfast: UITextField!
    @IBOutlet var lunch: UITextField!
    @IBOutlet var dinner: UITextField!
    @IBOutlet var other: UITextField!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
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

    

    
    var call = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 1
    }

    @IBAction func prev(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "symptom")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    @IBAction func log(_ sender: Any) {
        let url = "https://trackapi.nutritionix.com/v2/natural/nutrients"
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "x-app-id": "0480781d",
            "x-app-key": "e44ae3885013f291582a379f15c451e6"
        ]
        
        // Create a dispatch group
        let group = DispatchGroup()
        
        // Function to fetch ingredients
        func fetchIngredients(forText text: String, completion: @escaping ([String]) -> Void) {
            let parameters: [String: String] = [
                "query": text,
                "include_subrecipe": "yes"
            ]
            
            AF.request(url,
                       method: .post,
                       parameters: parameters,
                       encoding: JSONEncoding.default,
                       headers: headers,
                       interceptor: nil)
                .response { response in
                    defer {
                        group.leave() // Leave the group regardless of success or failure
                    }
                    switch response.result {
                    case .success(let data):
                        if let jsonData = data,
                           let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
                           let foods = json["foods"] as? [[String: Any]],
                           let subRecipe = foods.first?["sub_recipe"] as? [[String: Any]] {
                            
                            let ingredients = subRecipe.compactMap { $0["food"] as? String }
                            completion(ingredients)
                        } else {
                            completion([])
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        completion([])
                    }
                }
        }
        
        // Enter the dispatch group
        group.enter()
        // Fetch ingredients for breakfast
        if let breakfastText = breakfast.text {
            fetchIngredients(forText: breakfastText) { ingredients in
                breakfastIngredients = ingredients
                allIngredients += ingredients
                print("Breakfast Ingredients:", breakfastIngredients)
            }
        }
        
        // Enter the dispatch group
        group.enter()
        // Fetch ingredients for lunch
        if let lunchText = lunch.text {
            fetchIngredients(forText: lunchText) { ingredients in
                lunchIngredients = ingredients
                allIngredients += ingredients
                print("Lunch Ingredients:", lunchIngredients)
            }
        }
        
        // Enter the dispatch group
        group.enter()
        // Fetch ingredients for dinner
        if let dinnerText = dinner.text {
            fetchIngredients(forText: dinnerText) { ingredients in
                dinnerIngredients = ingredients
                allIngredients += ingredients
                print("Dinner Ingredients:", dinnerIngredients)
            }
        }
        
        // Enter the dispatch group
        group.enter()
        // Fetch ingredients for other
        if let otherText = other.text {
            fetchIngredients(forText: otherText) { ingredients in
                otherIngredients = ingredients
                allIngredients += ingredients
                print("Other Ingredients:", otherIngredients)
            }
        }
        
        // Notify when all tasks are complete
        group.notify(queue: .main) {
            print(allIngredients)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "symptom")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: false)
        }
    }

    
    @IBAction func logOut(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    
}


