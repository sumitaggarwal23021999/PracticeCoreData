
import UIKit

class ListingTVC: UITableViewCell {

    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    
    var student: Student? {
        didSet {
            showData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func showData() {
        if let student = student {
            lblName.text = student.name
            lblAddress.text = student.address
            lblCity.text = student.city
            lblMobile.text = student.mobile
        }
    }

}
