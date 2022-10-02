
import UIKit

class ListingVC: UIViewController {

    @IBOutlet weak var tblvwList: UITableView!
    var arrStudentData: [Student] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        arrStudentData = DatabaseHelper.sharedObject.getStudentData()
        tblvwList.delegate = self
        tblvwList.dataSource = self
    }
}

extension ListingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrStudentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingTVC", for: indexPath) as! ListingTVC
        cell.student = arrStudentData[indexPath.row ]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrStudentData = DatabaseHelper.sharedObject.deleteStudentObject(index: indexPath.row)
            tblvwList.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
