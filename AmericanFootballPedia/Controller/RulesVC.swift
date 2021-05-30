import UIKit
class RulesVC: UIViewController {
    @IBOutlet weak var MainAddingView: UIStackView!
    var MatterArray = [["\n\nBasic American Football Rules","heading\n\n"],["FIELD4","image"],["\n\nTo a newcomer, American football can look overly complex. However, the fundamentals of the game are very easy to understand and follow. Here is our guide to the basic rules of the game, including the flow of play and the methods of scoring. It should equip you with enough information to enable you to enjoy watching or even playing American football, while you learn the more in depth nuances of the game.\n\n","content"],["FIELD5","image"],["\n\nThe Game\n\n","heading"],["\n\n1. Normal play consists of two teams of 11 players on field (one on offence the other on defence) competing during four 15 minute quarters.\n\n","content"],["\n\n2. There are usually three ‘time-outs’ per half for each team, with a 12 minutes half-time interval.","content"],["\n\n3. The purpose of the game is to move the ball into the opposition's ‘end zone’, either by running with the ball until tackled, or by passing the ball to a teammate downfield, towards the end zone.","content"],["\n\n4. Although there are only 11 players from each side on the field at any one time, a team is actually made up of 45 players. The key player on each side is the quarterback who attempts to dictate play.","content"],["\n\nDOWNS\n\n","heading"],["\n\n1. Downs are the part of the game which often needlessly confuses newcomers. They are actually fairly straightforward. In a nutshell, the rule is as follows:","content"],["\n\n2. The team in possession of the ball (offence) needs to move the ball forward by at least 10 yards while they are on offence. This is why the pitch has clearly marked yardage lines on it.","content"],["\n\n3. They have four chances, or downs, to gain those 10 yards and if they advance the ball that far, the count resets and the team earns another set of four downs to try go a further 10 yards.","content"],["\n\n4. If the offensive team fails to move these 10 yards within four downs, possession is then given up and the defensive side gets their turn to play offense. Teams will usually kick for a field goal or downfield to the defending team on the fourth down to try and salvage some points before they lose possession.","content"],["\n\nScoring in American football","heading"],["\n\nThe ultimate aim in American football is similar to pretty much every other sport out there − to score more points than the opposition. Scoring is worked out in the game as follows:\n\n","heading"],["\n\n1. Touchdown (6 Points)","heading"],["\n\nA touchdown is scored when a team crosses the opposition's goal line with the ball, or catches or collects the ball in the end zone.\n\n ","content"],["\n\n2. Field Goal (3 Points)","heading"],["\n\nA team will usually attempt these on the fourth down - if the kicker is close enough to the end zone to kick the ball through between the upright posts.\n\n","content"],["\n\n3. Extra Point (1 Or 2 Points)","heading"],["\n\nAn extra point is earned by kicking the ball through the uprights after a touchdown (it’s similar to a conversion in rugby). Two points are earned by taking the ball into the end zone again, but since it is more difficult, most teams opt to take the 1pt.\n\n","content"],["\n\n4. Safety (2 Points)","heading"],["\n\nThe defensive team can gain 2 pts if they tackle a member of the offensive team with the ball in their own end zone. We hope this guide has armed you with the necessary tools to get to grips with the game. As with any other sport, football has numerous other elements and rules in addition to the ones outlined here, but by understanding the flow of the game and the scoring, you should be able to at least enjoy and understand it as you fill in the gaps.\n\n","content"]]
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
                view.bold2()
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
    func bold2() -> UILabel {
        if let descriptor = self.font.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits.traitBold){
            self.font = UIFont(descriptor: descriptor, size: 0)
        }
        return self
    }
}

private func sp_getUsersMostLiked() {
    print("Get Info Success")
}
