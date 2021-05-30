import UIKit
class Score: UIViewController {
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var LearnMore: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.white.cgColor
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor.white.cgColor
        button3.layer.borderWidth = 2
        button3.layer.borderColor = UIColor.white.cgColor
        ScoreText1.text = String(AppDelegate.Score)
        ScoreText2.text = "You Score:\n"+String(AppDelegate.Score)+"/5"
        if(AppDelegate.ScoreType == "RulesQuiz")
        {
           LearnMore.isHidden = true
        }
    }
    @IBOutlet weak var ScoreText2: UILabel!
    @IBOutlet weak var ScoreText1: UILabel!
    @IBAction func PlayAgain(_ sender: UIButton) {
        if(AppDelegate.ScoreType == "RulesQuiz")
        {
            weak var pvc = self.presentingViewController
            self.dismiss(animated: false) {
                pvc?.performSegue(withIdentifier: "QuizRuleVC", sender: nil)
            }
        }
        else{
            weak var pvc = self.presentingViewController
            self.dismiss(animated: false) {
                pvc?.performSegue(withIdentifier: "QuizFielderVC", sender: nil)
            }
        }
    }
    @IBAction func Home(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func LearnMore(_ sender: UIButton) {
            weak var pvc = self.presentingViewController
            self.dismiss(animated: false) {
                pvc?.performSegue(withIdentifier: "FielderVC", sender: nil)
            }
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

private func sp_getUserName() {
    print("Get Info Failed")
}
