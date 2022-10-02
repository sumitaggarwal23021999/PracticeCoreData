import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldAddress: UITextField!
    @IBOutlet weak var txtfldMobile: UITextField!
    @IBOutlet weak var txtfldCity: UITextField!
    
    private var editIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func btnSaveTapped(_ sender: UIButton) {
        let dict: [String: Any] = ["name": txtfldName.text ?? "", "address": txtfldAddress.text ?? "", "city": txtfldCity.text ?? "", "mobile": txtfldMobile.text ?? ""]
        if let editIndex = editIndex {
            DatabaseHelper.sharedObject.editstudent(studentData: dict, atIndex: editIndex)
        } else {
            DatabaseHelper.sharedObject.save(object: dict )
        }
    }
    
    @IBAction func btnShowListingTapped(_ sender: Any) {
        guard let listingVC = storyboard?.instantiateViewController(withIdentifier: "ListingVC") as? ListingVC else { return }
        listingVC.delegate = self
        navigationController?.pushViewController(listingVC, animated: true)
    }
}

extension ViewController: ListingVCDelegate {
    func editStudent(student: Student, atIndex: Int) {
        editIndex = atIndex
        txtfldName.text = student.name
        txtfldAddress.text = student.address
        txtfldCity.text = student.city
        txtfldMobile.text = student.mobile
    }
}

