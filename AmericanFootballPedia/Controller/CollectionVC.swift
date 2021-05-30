import UIKit
class CollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    @IBOutlet weak var collectionView: UICollectionView!
    var FootballNameArray = ["History", "About American Football", "Rules & Regulations","Players Position", "Equipment and Gears"]
    var imgArray = ["FootballGuy1", "FootballGuy", "rules_head", "Keeper", "FootballGuy2"]
    var FootballInfoLabel = ["The sport of American football itself was relatively new in 1892. Its roots stemmed from two sports, soccer and rugby, which had enjoyed long-time popularity in many nations of the world. On November 6, 1869, Rutgers and Princeton played what was billed as the first college football game.", "An American football game is played with a ball called a football. The sport is played on a grass (or artificial turf) field. The field is exactly 360 feet (110 m) long and 160 feet (49 m) wide. The end zones, one at each end of the field, are 10 yards (9.1 m) long.","To a newcomer, American football can look overly complex. However, the fundamentals of the game are very easy to understand and follow. Here is our guide to the basic rules of the game, including the flow of play and the methods of scoring. It should equip you with enough information to enable you to enjoy watching or even playing American football, while you learn the more in depth nuances of the game.", "In American football, the specific role that a player takes on the field is referred to as their position. Under the modern rules of American football, both teams are allowed 11 players on the field at one time and have unlimited free substitutions, meaning that they may change any number of players during any dead ball situation.[a] This has resulted in the development of three task-specific platoons of players within any single team: the offense (the team with possession of the ball, which is trying to score), the defense (the team trying to prevent the other team from scoring, and to take the ball from them), and the so-called 'special teams' (who play in all kicking situations). Within these three separate platoons, various positions exist depending on the jobs that the players are doing.","Basic equipment worn by most football players include helmet, shoulder pads, gloves, shoes, and thigh and knee pads, a mouthguard, and a jockstrap or compression shorts with or without a protective cup."]
    override func viewDidLoad() {
        super.viewDidLoad()
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "abc", for: indexPath) as! CCVC
        cell.label.text = FootballNameArray[indexPath.row]
        cell.img.image = UIImage(named: "\(imgArray[indexPath.row])")
        cell.infoLabel.text = FootballInfoLabel[indexPath.row]
        cell.btn.tag = indexPath.row
        cell.btn.addTarget(self, action: #selector(pressButton(sender:)), for: .touchUpInside)
        return cell
    }
    @objc func pressButton(sender: UIButton){
        let pressed = sender.tag
        if pressed == 0 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "InfoVC") as? InfoVC
            self.present(vc!, animated: false, completion: nil)
        }else if pressed == 2 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "RulesVC") as? RulesVC
            self.present(vc!, animated: false, completion: nil)
        }else if pressed == 3 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "FielderVC") as? FielderVC
            self.present(vc!, animated: false, completion: nil)
        }else if pressed == 4 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TypeVC") as? TypeVC
            self.present(vc!, animated: false, completion: nil)
        }
        else if pressed == 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "Info1VC") as? Info1VC
            self.present(vc!, animated: false, completion: nil)
        }
    }
}

private func sp_getUserName() {
    print("Continue")
}
