import UIKit
class TypeTVC: UITableViewCell {
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var info: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

private func sp_getUsersMostFollowerSuccess() {
    print("Get User Succrss")
}
