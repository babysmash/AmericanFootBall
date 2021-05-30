import UIKit
class FielderVC: UIViewController {
    @IBOutlet weak var MyView: UIView!
    @IBOutlet weak var CurrentPlayerName: UILabel!
    var PlayerValues = [["Defense End","Defense",750,970],["Defensive Tackle","Defense",880,970],["Defense End","Defense",1139,970],["Defensive Tackle","Defense",1008,970],["Corner Back","Defense",550,875],["Corner Back","Defense",1320,875],["Outside LineBacker","Defense",816,820],["Outside LineBacker","Defense",1080,820],["Middle LineBacker","Defense",950,790],["Strong Safety","Defense",1180,705],["Free Safety","Defense",708,675],["Wide Receiver","Offense",550,1050],["Offensive Tackle","Offense",750,1050],["Offensive Guard","Offense",880,1050],["Center","Offense",948,1050],["Offensive Guard","Offense",1008,1050],["Offensive Tackle","Offense",1139,1050],["Tight End","Offense",1225,1050],["Wide Receiver","Offense",1320,1050],["Quarter Back","Offense",948,1150],["Full Back","Offense",948,1250],["Half Back","Offense",948,1350]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        PlaceThePlayers()
        super.viewWillAppear(animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0/255.0, green: 38/255.0, blue: 67/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 251/255.0, green: 155/255.0, blue: 117/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    func PlaceThePlayers() {
            let imageViewWidth = self.view.bounds.size.width - 20
            let imageViewHeight = (imageViewWidth/2000)*1900
            print(imageViewHeight)
            let PaddingTop = 0
            print(PaddingTop)
            var OriginalImageRatioHeight = 1902.0
            var OriginalImageRatioWidth = 1895.0
        MyView.isUserInteractionEnabled = true
            for index in 0..<self.PlayerValues.count {
                if(self.PlayerValues[index][1] as! String == "Offense")
                {
                    let PlayerButton = UIButton()
                    if(PlayerValues[index][0] as! String == "Wicket Keeper")
                    {
                        PlayerButton.layer.borderWidth = 2
                        PlayerButton.layer.borderColor = UIColor.black.cgColor
                    }
                    let PlayerWidthPositionPer = Double((Double(PlayerValues[index][2] as! Int)/OriginalImageRatioWidth)*100.0)
                    let PlayerHeightPositionPer = Double((Double(PlayerValues[index][3] as! Int)/OriginalImageRatioHeight)*100.0)
                    let PlayerHieght = Double(Double(imageViewHeight/100) * PlayerHeightPositionPer)
                    let PlayerWidth = Double(Double(imageViewHeight/100) * PlayerWidthPositionPer)
                    PlayerButton.backgroundColor = .red
                    PlayerButton.tag = index
                    PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                    let tap = UITapGestureRecognizer(target: self, action: #selector(FielderVC.didButtonClick))
                    PlayerButton.isUserInteractionEnabled = true
                    PlayerButton.addGestureRecognizer(tap)
                    self.MyView.addSubview(PlayerButton)
                    PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                    PlayerButton.layer.cornerRadius = 5
                    let widthContraints =  NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                    let heightContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                    let xContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: CGFloat(PlayerWidth))
                    let yContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: CGFloat(PlayerHieght))
                    NSLayoutConstraint.activate([heightContraints,widthContraints,xContraints,yContraints])
                }
                else if(self.PlayerValues[index][1] as! String  == "Defense")
                {
                    let PlayerButton = UIButton()
                    let PlayerWidthPositionPer = Double((Double(PlayerValues[index][2] as! Int)/OriginalImageRatioWidth)*100.0)
                    let PlayerHeightPositionPer = Double((Double(PlayerValues[index][3] as! Int)/OriginalImageRatioHeight)*100.0)
                    let PlayerHieght = Double(Double(imageViewHeight/100) * PlayerHeightPositionPer)
                    let PlayerWidth = Double(Double(imageViewHeight/100) * PlayerWidthPositionPer)
                    PlayerButton.backgroundColor = .blue
                    PlayerButton.tag = index
                    PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                    let tap = UITapGestureRecognizer(target: self, action: #selector(FielderVC.didButtonClick))
                    PlayerButton.isUserInteractionEnabled = true
                    PlayerButton.addGestureRecognizer(tap)
                    self.MyView.addSubview(PlayerButton)
                    PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                    PlayerButton.layer.cornerRadius = 5
                    let widthContraints =  NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                    let heightContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                    let xContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: CGFloat(PlayerWidth))
                    let yContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: CGFloat(PlayerHieght))
                    NSLayoutConstraint.activate([heightContraints,widthContraints,xContraints,yContraints])
                }
                else  if(self.PlayerValues[index][1] as! String  == "Umpire")
                {
                    let PlayerButton = UIButton()
                    PlayerButton.frame = CGRect(x: 0, y: 0, width: self.MyView.bounds.size.width, height: self.MyView.bounds.size.height);
                    let PlayerWidthPositionPer = Double((Double(PlayerValues[index][2] as! Int)/OriginalImageRatioWidth)*100.0)
                    let PlayerHeightPositionPer = Double((Double(PlayerValues[index][3] as! Int)/OriginalImageRatioHeight)*100.0)
                    let PlayerHieght = Double(Double(imageViewHeight/100) * PlayerHeightPositionPer)
                    let PlayerWidth = Double(Double(imageViewHeight/100) * PlayerWidthPositionPer)
                    PlayerButton.backgroundColor = .white
                    PlayerButton.tag = index
                    PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                    let tap = UITapGestureRecognizer(target: self, action: #selector(FielderVC.didButtonClick))
                    PlayerButton.isUserInteractionEnabled = true
                    PlayerButton.addGestureRecognizer(tap)
                    self.MyView.addSubview(PlayerButton)
                    PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                    PlayerButton.layer.cornerRadius = 5
                    let widthContraints =  NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                    let heightContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                    let xContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: CGFloat(PlayerWidth))
                    let yContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: CGFloat(PlayerHieght))
                    NSLayoutConstraint.activate([heightContraints,widthContraints,xContraints,yContraints])
                }
        }
    }
    @objc func didButtonClick(_ sender: UITapGestureRecognizer) {
        RemoveAllButtonBorder()
        var button = sender.view as! UIButton
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        CurrentPlayerName.text = PlayerValues[sender.view?.tag ?? 0][0] as! String
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func RemoveAllButtonBorder()
    {
        for subview in self.MyView.subviews
        {
            var Button = subview as! UIButton
            Button.layer.borderWidth = 0
            Button.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
extension UIImageView {
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0
        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
    }

private func sp_getMediaData(isLogin: String) {
    print("Get User Succrss")
}
