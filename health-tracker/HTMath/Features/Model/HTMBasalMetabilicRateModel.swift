struct HTMBasalMetabilicRateModel {
    let gender: HTGender
    let people: HTMPeopleModel
    
    init(gender: HTGender = .male, age: Int = 0, wight: Double = 0, height: Double = 0) {
        self.gender = gender
        self.people = .init(age: age, wight: wight, height: height)
    }
}
