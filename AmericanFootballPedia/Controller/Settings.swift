import UIKit
class Settings: UIViewController {
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.white.cgColor
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor.white.cgColor
        button3.layer.borderWidth = 2
        button3.layer.borderColor = UIColor.white.cgColor
    }
     @IBAction func OpenLink(_ sender: UIButton) {
        guard let url = URL(string: "https://football-pedia.flycricket.io/privacy.html")
            else {return}
        UIApplication.shared.open(url)
     }
    @IBAction func Share(_ sender: UIButton) {
        let text = "Hey, download this amazing app on American Football which has history on American Football, info on American Football, players field postion, quizzes and much more. Download American Football Pedia App."
        let textShare = [text]
        let activityViewController = UIActivityViewController(activityItems: textShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
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
}

private func sp_getMediaData() {
    print("Get Info Success")
}
