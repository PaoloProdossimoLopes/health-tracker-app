struct HTMPeopleModel {
    let age: Double
    let wight: Double
    let height: Double
    
    init(age: Int = 0, wight: Double = 0, height: Double = 0) {
        self.age = Double(age)
        self.wight = wight
        self.height = height
    }
    
    var isValid: Bool {
        let ageIsValid = age > 0
        let wightIsValid = wight > 0
        let heightIsValid = height > 0
        return ageIsValid && wightIsValid && heightIsValid
    }
}
