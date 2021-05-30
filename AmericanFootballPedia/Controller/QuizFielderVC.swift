import UIKit
class QuizFielderVC: UIViewController {
    @IBOutlet weak var MyView: UIView!
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    var PlayerValues = [["Defense End","Defense",750,970],["Defensive Tackle","Defense",880,970],["Defense End","Defense",1139,970],["Defensive Tackle","Defense",1008,970],["Corner Back","Defense",550,875],["Corner Back","Defense",1320,875],["Outside LineBacker","Defense",816,820],["Outside LineBacker","Defense",1080,820],["Middle LineBacker","Defense",950,790],["Strong Safety","Defense",1180,705],["Free Safety","Defense",708,675],["Wide Receiver","Offense",550,1050],["Offensive Tackle","Offense",750,1050],["Offensive Guard","Offense",880,1050],["Center","Offense",948,1050],["Offensive Guard","Offense",1008,1050],["Offensive Tackle","Offense",1139,1050],["Tight End","Offense",1225,1050],["Wide Receiver","Offense",1320,1050],["Quarter Back","Offense",948,1150],["Full Back","Offense",948,1250],["Half Back","Offense",948,1350]]
    var RightAnswers : Int = 0
    var questionNumber : Int = 0
    var score : Int = 0
    var CurrentQuestion:Int = 0
    var questionshown = [Int]()
    var RightButton = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.tag = 1
        image2.tag = 2
        LoadQuestion()
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
    @IBAction func pickedAnswer(_ sender: UIButton) {
        image1.isEnabled = false
        image2.isEnabled = false
        if sender.tag == 1 {
            if(RightButton == 1)
            {
                RightAnswers = RightAnswers + 1
                image1.backgroundColor = .green
            }
            else if(RightButton == 2)
            {
                image1.backgroundColor = .red
                image2.backgroundColor = .green
            }
        }
        else if sender.tag == 2 {
            if(RightButton == 1)
            {
                image1.backgroundColor = .green
                image2.backgroundColor = .red
            }
            else if(RightButton == 2)
            {
                RightAnswers = RightAnswers + 1
                image2.backgroundColor = .green
            }
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.LoadQuestion()
        }
    }
    func LoadQuestion() {
        image1.isEnabled = true
        image2.isEnabled = true
        if questionNumber < 5 {
            image1.backgroundColor = UIColor(red: 0/255.0, green: 38/255.0, blue: 67/255.0, alpha: 1.0)
            image2.backgroundColor = UIColor(red: 0/255.0, green: 38/255.0, blue: 67/255.0, alpha: 1.0)
            questionNumber = questionNumber + 1
            CurrentQuestion = GetQuestionNumber()
            PlaceThePlayers()
            if(Int.random(in: 0..<2) == 0)
            {
                RightButton = 1
                image1.setTitle(PlayerValues[CurrentQuestion][0] as? String, for: .normal)
                image2.setTitle(PlayerValues[GetWrongNumber()][0] as? String, for: .normal)
            }
            else{
                RightButton = 2
                image2.setTitle(PlayerValues[CurrentQuestion][0] as? String, for: .normal)
                image1.setTitle(PlayerValues[GetWrongNumber()][0] as? String, for: .normal)
            }
        }
        else {
            AppDelegate.Score = RightAnswers
            AppDelegate.ScoreType = "FielderQuiz"
            weak var pvc = self.presentingViewController
            self.dismiss(animated: false) {
                pvc?.performSegue(withIdentifier: "Score", sender: nil)
            }
        }
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func GetQuestionNumber() -> Int{
        var Number = Int.random(in: 0..<PlayerValues.count)
        while (IsNumberShown(value: Number))
        {
            Number = Int.random(in: 0..<PlayerValues.count)
        }
        questionshown.append(Number)
        return Number
    }
    func GetWrongNumber() -> Int{
        var Number = Int.random(in: 0..<PlayerValues.count)
        while (Number == CurrentQuestion)
        {
            Number = Int.random(in: 0..<PlayerValues.count)
        }
        questionshown.append(Number)
        return Number
    }
    func IsNumberShown(value:Int) -> Bool{
        for index in 0..<questionshown.count
        {
            if(questionshown[index]==value)
            {
                return true
            }
        }
        return false
    }
    func PlaceThePlayers() {
        for view in self.MyView.subviews {
            view.removeFromSuperview()
        }
        let imageViewWidth = self.view.bounds.size.width - 20
        let imageViewHeight = (imageViewWidth/2000)*1900
        print(imageViewHeight)
        let PaddingTop = 0
        print(PaddingTop)
        let OriginalImageRatioHeight = 1902.0
        let OriginalImageRatioWidth = 1895.0
        MyView.isUserInteractionEnabled = true
            if(self.PlayerValues[CurrentQuestion][1] as! String == "Offense")
            {
                let PlayerButton = UIButton()
                let PlayerWidthPositionPer = Double((Double(PlayerValues[CurrentQuestion][2] as! Int)/OriginalImageRatioWidth)*100.0)
                let PlayerHeightPositionPer = Double((Double(PlayerValues[CurrentQuestion][3] as! Int)/OriginalImageRatioHeight)*100.0)
                let PlayerHieght = Double(Double(imageViewHeight/100) * PlayerHeightPositionPer)
                let PlayerWidth = Double(Double(imageViewHeight/100) * PlayerWidthPositionPer)
                PlayerButton.backgroundColor = .red
                PlayerButton.tag = CurrentQuestion
                PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                self.MyView.addSubview(PlayerButton)
                PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                PlayerButton.layer.cornerRadius = 5
                let widthContraints =  NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                let heightContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                let xContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: CGFloat(PlayerWidth))
                let yContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: CGFloat(PlayerHieght))
                NSLayoutConstraint.activate([heightContraints,widthContraints,xContraints,yContraints])
            }
            else if(self.PlayerValues[CurrentQuestion][1] as! String  == "Defense")
            {
                let PlayerButton = UIButton()
                let PlayerWidthPositionPer = Double((Double(PlayerValues[CurrentQuestion][2] as! Int)/OriginalImageRatioWidth)*100.0)
                let PlayerHeightPositionPer = Double((Double(PlayerValues[CurrentQuestion][3] as! Int)/OriginalImageRatioHeight)*100.0)
                let PlayerHieght = Double(Double(imageViewHeight/100) * PlayerHeightPositionPer)
                let PlayerWidth = Double(Double(imageViewHeight/100) * PlayerWidthPositionPer)
                PlayerButton.backgroundColor = .blue
                PlayerButton.tag = CurrentQuestion
                PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                self.MyView.addSubview(PlayerButton)
                PlayerButton.translatesAutoresizingMaskIntoConstraints = false
                PlayerButton.layer.cornerRadius = 5
                let widthContraints =  NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                let heightContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 10)
                let xContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: CGFloat(PlayerWidth))
                let yContraints = NSLayoutConstraint(item: PlayerButton, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.MyView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: CGFloat(PlayerHieght))
                NSLayoutConstraint.activate([heightContraints,widthContraints,xContraints,yContraints])
            }
            else  if(self.PlayerValues[CurrentQuestion][1] as! String  == "Umpire")
            {
                let PlayerButton = UIButton()
                PlayerButton.frame = CGRect(x: 0, y: 0, width: self.MyView.bounds.size.width, height: self.MyView.bounds.size.height);
                let PlayerWidthPositionPer = Double((Double(PlayerValues[CurrentQuestion][2] as! Int)/OriginalImageRatioWidth)*100.0)
                let PlayerHeightPositionPer = Double((Double(PlayerValues[CurrentQuestion][3] as! Int)/OriginalImageRatioHeight)*100.0)
                let PlayerHieght = Double(Double(imageViewHeight/100) * PlayerHeightPositionPer)
                let PlayerWidth = Double(Double(imageViewHeight/100) * PlayerWidthPositionPer)
                PlayerButton.backgroundColor = .white
                PlayerButton.tag = CurrentQuestion
                PlayerButton.translatesAutoresizingMaskIntoConstraints = false
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

private func sp_didUserInfoFailed(string: String) {
    print("Get Info Success")
}
