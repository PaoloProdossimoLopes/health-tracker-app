struct HTMDailySpendModel {
    let activity: HTActivity
    let basal: HTMBasalMetabilicRateModel
    let bodyFat: Double?
    
    init(
        activity: HTActivity = .sedentary,
        gender: HTGender = .male,
        age: Int = 0, wight: Double = 0,
        height: Double = 0, bodyFat: Double? = nil
    ) {
        self.activity = activity
        self.basal = .init(gender: gender, age: age, wight: wight, height: height)
        self.bodyFat = bodyFat
    }
}
