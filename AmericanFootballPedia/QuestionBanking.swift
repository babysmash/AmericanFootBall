import Foundation
class QuestionBanking {
    var list = [Question]()
    init() {
        list.append(Question(imageName: "What Native American language was Super Bowl XXX the first to be broadcast in?", correctAnswer: 2, choicesName: ["Athabaskan","Navajo","Cherokee"]))
        list.append(Question(imageName: "2. What Cowboy's 99-yard run from scrimmage put him in the NFL football record book in 1983?", correctAnswer: 1, choicesName: ["Tony Dorsett’s","One Day International","ODI"]))
        list.append(Question(imageName: "3. What team hired the NFL's first professional cheerleading squad, in 1972?", correctAnswer: 1, choicesName: ["The Dallas Cowboys","Miami Dolphins","Washington Redskins"]))
        list.append(Question(imageName: "4. Who was the first athlete to rap at a Pro Bowl musical gala, in 1995?", correctAnswer: 3, choicesName: ["SnoopDog","Eminem","Deion Sanders"]))
        list.append(Question(imageName: "How many of the five Dallas teams Tom Landry took to Super Bowls were victorious?", correctAnswer: 3, choicesName: ["3","5","2"]))
        list.append(Question(imageName: "What teams played in the first all-California Super Bowl?", correctAnswer: 3, choicesName: ["The Denver Broncos and The Cincinnati Bengal’s.","The San Francisco 49ers and San Diego Chargers","The New York. Giants and The Buffalo Bills."]))
        list.append(Question(imageName: "What team has been drubbed in Super Bowls by scores of 27-10, 39-20, 42-10, and 55-10?", correctAnswer: 2, choicesName: ["The Denver Broncos","The San Francisco 49ers","he New York Giants"]))
        list.append(Question(imageName: "What NFL team introduced the no-huddle offense during the 1980s?", correctAnswer: 3, choicesName: ["ODI","T20","The Cincinnati Bengal’s."]))
        list.append(Question(imageName: "What quarterback got stuck with the given names Yelberton Abraham?", correctAnswer: 1, choicesName: ["Y.A Little","ODI","Test Match"]))
        list.append(Question(imageName: "10.  What Baltimore Colts great led the NFL in passing in the 1960s, with 26548 yards?", correctAnswer: 3, choicesName: ["Johnny Unitas","Umpire","Wicket Keeper"]))
    }
}

private func sp_checkNetWorking(string: String) {
    print("Get Info Success")
}
