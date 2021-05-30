import UIKit
class Info1VC: UIViewController {
    @IBOutlet weak var MainAddingView: UIStackView!
    var MatterArray = [["\n\nGame Play\n\n","heading"],["FIELD0","image"], ["\n\nFootball, An American football game is played with a ball called a football. The sport is played on a grass (or artificial turf) field. The field is exactly 360 feet (110 m) long and 160 feet (49 m) wide. The end zones, one at each end of the field, are 10 yards (9.1 m) long. The players wear protective equipment, including a helmet with face mask, shoulder pads, thigh pads, and often a mouth guard. A team has four chances, or 'downs', to advance the ball 10 yards (9.1 m) while the opposing team tries to stop it. Certain players advance the ball by carrying or throwing it. Teams can score by advancing the ball to the other team's end zone or by kicking the ball through a goalpost placed at the back of the end zone. American football is carefully regulated by time and rules, which are enforced by officials, who also determine when a team scores. A college or professional football game is 60 minutes long, and is divided into 15-minute quarters. In some high schools, the quarters are 12 minutes long, and games for younger children are often shorter still. After the first two quarters, the teams rest during halftime. In NFL football, if the game is tied after the four quarters, the two teams compete in at least one more 15-minute period called overtime. During overtime, the first team to score points is usually the winner. However, under the current rules, first used for the 2011 postseason, if the team that has the ball first ends its possession by scoring a field goal, the other team has a chance to score. If that team does not score, or if it scores a touchdown, the game ends. If it scores a field goal, the game continues, and the next team to score wins. During the regular season, only one overtime period is played—if neither team scores, or if both teams score field goals when they first have the ball, the game ends in a tie. During the playoffs, the game will continue with as many overtime periods as needed to decide a winner. If the game is tied after each team has had the ball once in overtime, the first team to score wins. In NCAA football overtime, which is based on the system used for high school football in most U.S. states, the teams take turns trying to score. The game ends when one team scores, and the other team fails to score as many points during its chance.","content"],["\n\nField\n\n","heading"],["FIELD1","image"],["\n\nAmerican football is played on a field 120 yards (110 m) long by 53.3 yards (48.7 m) wide. Most of the game is played on 100 yards (91 m) in the middle. It is divided by 20 lines drawn every 5 yards (4.6 m). The field has two other sets of markings, running between the two end zones along the length of the field, known as 'hashmarks'. All plays must start between the hashmarks—if the last play ended outside the hashmarks, the ball is moved to the nearest hashmark. At the ends of the field there are scoring areas, called the end zones. There are also two yellow poles on the end of each field called uprights. Sometimes, if the team can not score a touchdown they might want to kick it through the uprights for three points. The uprights are also used for scoring one point after a team scored a touchdown. ","content"], ["\n\nPlayers\n\n","heading"], ["FIELD2","image"], ["\n\nThere are many types of players on a football team. For the offensive part of the team, a quarterback throws the football to wide receivers while offensive linemen block to protect him from defensive players. The offensive linemen also block when a running back runs to advance the football. Players on the Defensive line, a linebacker, and defensive backs (cornerbacks and American football safeties) attempt to tackle the offensive player who carries the football. Some team members only play during certain times. These players belong to the Special Teams. The kicker can kick the ball to the other team or between the uprights, while the placeholder holds the ball steady. The kick returner runs the ball down the field in an attempt to score points after catching the ball.","content"], ["\n\nScoring\n\n","heading"],["FIELD3","image"], ["\n\nTouchDown (6 points)\n\n","heading"],["\n\nA touchdown is achieved when a player has legal possession of the ball and the ball crosses an imaginary vertical plane above the opposing team's goal line. After a touchdown, the scoring team attempts a try for 1 or 2 points (see below). A successful touchdown is signaled by an official extending both arms vertically above the head.","content"], ["\n\nField goal (3 points)\n\n","heading"],["\n\nA field goal is scored when the ball is place kicked between the goal posts behind the opponent's end zone. The most common type of kick used is the place kick. For a place kick, the ball must first be snapped to a placeholder, who holds the ball upright on the ground with his fingertip so that it may be kicked. Three points are scored if the ball crosses between the two upright posts and above the crossbar and remains over.","content"],["\n\nExtra point (1 or 2 points)\n\n","heading"],["Immediately following a touchdown, the scoring team can attempt to kick the ball between the goal posts for 1 extra point. The team can also run or pass the ball into the end zone for 2 points. This is not done very often although it does happen.","content"],["\n\nSafety (2 points)\n\n","heading"],["\n\nA safety is scored if a player causes the ball to become dead in his own end zone. When this happens two points are awarded to the opposing (usually defending) team. This can happen if a player is either downed or goes out of bounds in the end zone while carrying the ball. It can also happen if he fumbles the ball, and it goes out of bounds in the end zone. A safety is also awarded to the defensive team if the offensive team commits a foul which is enforced in its own end zone.","content"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()
    }
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0/255.0, green: 0/255.0, blue: 128/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 128/255.0, green: 0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    func updateTextView(){
        for index in 0..<MatterArray.count
        {
            if(MatterArray[index][1] == "heading")
            {
                let view = UILabel()
                view.textColor = .white
                view.text = MatterArray[index][0]
                view.numberOfLines = 0
                view.font = view.font.withSize(22)
                view.bold1()
                view.textAlignment = .center
                MainAddingView.addArrangedSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            else if (MatterArray[index][1] == "content"){
                let view = UILabel()
                view.textColor = .white
                view.text = MatterArray[index][0]
                view.numberOfLines = 0
                view.font = view.font.withSize(15)
                MainAddingView.addArrangedSubview(view)
                view.textAlignment = .justified
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            else if(MatterArray[index][1] == "image")
            {
                let view = UIImageView()
                view.image = UIImage(named: MatterArray[index][0])
                view.autoresizingMask = []
                view.contentMode = .scaleAspectFit
                MainAddingView.addArrangedSubview(view)
                self.view.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant:250))
            }
        }
    }
@IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
extension UILabel{
    func bold1() -> UILabel {
        if let descriptor = self.font.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits.traitBold){
            self.font = UIFont(descriptor: descriptor, size: 0)
        }
        return self
    }
}

private func sp_getUsersMostLiked() {
    print("Check your Network")
}
