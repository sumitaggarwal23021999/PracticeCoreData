import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldAddress: UITextField!
    
    @IBOutlet weak var txtfldMobile: UITextField!
    @IBOutlet weak var txtfldCity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func btnSaveTapped(_ sender: UIButton) {
        let dict: [String: Any] = ["name": txtfldName.text ?? "", "address": txtfldAddress.text ?? "", "city": txtfldCity.text ?? "", "mobile": txtfldMobile.text ?? ""]
        DatabaseHelper.sharedObject.save(object: dict )
    }
}

