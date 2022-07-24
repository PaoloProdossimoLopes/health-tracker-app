final class HTMDailySpend {
    
    var basal: HTMBasalMetabilicRateProtocol
    
    init(basal: HTMBasalMetabilicRateProtocol = HTMBasalMetabilicRate()) {
        self.basal = basal
    }
    
    func calculate(model: HTMDailySpendModel) -> Double? {
        guard let basalRate = basal.calculate(model: model.basal), basalRate > 0 else { return nil }
        return model.activity.coeficient * basalRate
    }
}
