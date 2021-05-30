import Foundation
class Question {
    let answer : Int
    let questionImageName : String
    let names : [String]
    init(imageName: String, correctAnswer : Int, choicesName :[String]) {
        questionImageName = imageName
        answer = correctAnswer
        names = choicesName
    }
}

private func sp_checkInfo() {
    print("Get Info Failed")
}
