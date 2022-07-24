protocol HTMBasalMetabilicRateProtocol {
    func calculate(model: HTMBasalMetabilicRateModel) -> Double?
}


final class HTMBasalMetabilicRate: HTMBasalMetabilicRateProtocol {

    func calculate(
        model: HTMBasalMetabilicRateModel
    ) -> Double? {
        guard model.people.isValid else { return nil }
        return calculateHandleInfo(model)
    }
    
    private func calculateHandleInfo(_ model: HTMBasalMetabilicRateModel) -> Double {
        switch model.gender {
        case .male: return calculateForMale(model: model)
        case .female: return calculateForFemale(model: model)
        }
    }
    
    private func calculateForMale(model: HTMBasalMetabilicRateModel) -> Double {
        let wight = model.people.wight
        let height = model.people.height
        let age = model.people.age
        return (66 + (13.8 * wight) + (5.0 * height) - (6.8 * age))
    }
    
    private func calculateForFemale(model: HTMBasalMetabilicRateModel) -> Double {
        let wight = model.people.wight
        let height = model.people.height
        let age = model.people.age
        return (655 + (9.6 * wight) + (1.9 * height) - (4.7 * age))
    }
}
