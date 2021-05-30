import UIKit
class QuizRuleVC: UIViewController {
    @IBOutlet weak var questionName: UILabel!
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var image3: UIButton!
    @IBOutlet weak var qNo: UILabel!
    let allQuestions = QuestionBanking()
    var RightAnswers : Int = 0
    var questionNumber : Int = 0
    var score : Int = 0
    var CurrentQuestion:Question = QuestionBanking().list[0]
    var questionshown = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.tag = 1
        image2.tag = 2
        image3.tag = 3
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
        image3.isEnabled = false
        if sender.tag == 1 {
            if(CurrentQuestion.answer == 1)
            {
                RightAnswers = RightAnswers + 1
                image1.backgroundColor = .green
            }
            else if(CurrentQuestion.answer == 2)
            {
                image1.backgroundColor = .red
                image2.backgroundColor = .green
            }
            else if(CurrentQuestion.answer == 3)
            {
                image1.backgroundColor = .red
                image3.backgroundColor = .green
            }
        }
        else if sender.tag == 2 {
            if(CurrentQuestion.answer == 1)
            {
                image1.backgroundColor = .green
                image2.backgroundColor = .red
            }
            else if(CurrentQuestion.answer == 2)
            {
                RightAnswers = RightAnswers + 1
                image2.backgroundColor = .green
            }
            else if(CurrentQuestion.answer == 3)
            {
                image2.backgroundColor = .red
                image3.backgroundColor = .green
            }
        }
        else if sender.tag == 3 {
            if(CurrentQuestion.answer == 1)
            {
                image1.backgroundColor = .green
                image3.backgroundColor = .red
            }
            else if(CurrentQuestion.answer == 2)
            {
                image3.backgroundColor = .red
                image2.backgroundColor = .green
            }
            else if(CurrentQuestion.answer == 3)
            {
                RightAnswers = RightAnswers + 1
                image3.backgroundColor = .green
            }
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.LoadQuestion()
        }
    }
    func LoadQuestion() {
        image1.isEnabled = true
        image2.isEnabled = true
        image3.isEnabled = true
        if questionNumber < 5 {
            image1.backgroundColor = UIColor(red: 0/255.0, green: 38/255.0, blue: 67/255.0, alpha: 1.0)
            image2.backgroundColor = UIColor(red: 0/255.0, green: 38/255.0, blue: 67/255.0, alpha: 1.0)
            image3.backgroundColor = UIColor(red: 0/255.0, green: 38/255.0, blue: 67/255.0, alpha: 1.0)
            questionNumber = questionNumber + 1
            qNo.text = "\(questionNumber ) / 5"
            CurrentQuestion = allQuestions.list[GetQuestionNumber()]
            questionName.text =  "\(CurrentQuestion.questionImageName)"
            if(CurrentQuestion.names.count == 3)
            {
                image1.setTitle(CurrentQuestion.names[0], for: .normal)
                image2.setTitle(CurrentQuestion.names[1], for: .normal)
                image3.setTitle(CurrentQuestion.names[2], for: .normal)
                image3.isHidden = false
            }
            else{
                image1.setTitle(CurrentQuestion.names[0], for: .normal)
                image2.setTitle(CurrentQuestion.names[1], for: .normal)
                image3.isHidden = true
            }
        }
        else {
            AppDelegate.Score = RightAnswers
            AppDelegate.ScoreType = "RulesQuiz"
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
        var Number = Int.random(in: 0..<allQuestions.list.count)
        while (IsNumberShown(value: Number))
        {
            Number = Int.random(in: 0..<allQuestions.list.count)
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
}

private func sp_getUsersMostLikedSuccess() {
    print("Get Info Success")
}
