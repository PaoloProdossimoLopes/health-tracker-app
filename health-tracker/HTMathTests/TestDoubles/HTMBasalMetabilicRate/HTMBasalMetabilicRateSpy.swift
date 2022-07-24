@testable import HTMath

final class HTMBasalMetabilicRateSpy: HTMBasalMetabilicRateProtocol {
    
    var modelSpy: HTMBasalMetabilicRateModel?
    
    func calculate(model: HTMBasalMetabilicRateModel) -> Double? {
        modelSpy = model
        return .zero
    }
}
