import UIKit

var remainingToDos: [String] = []

class CheckViewController: UITableViewController {
    
    @IBAction func page(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "output")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    var toDos: [String] = allIngredients
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
            title = "Check"
        navigationController?.isNavigationBarHidden = false
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "toDoCell")
        // Set remainingToDos to the global toDos array
        remainingToDos = toDos
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return remainingToDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textToDisplay = remainingToDos[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = textToDisplay
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the item from the array
            let deletedItem = toDos.remove(at: indexPath.row)
            // Update remainingToDos with the current items in toDos
            remainingToDos = toDos
            // Remove the item from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // You can use the deletedItem for any other processing if needed
            print(remainingToDos)
        }
    }
}
