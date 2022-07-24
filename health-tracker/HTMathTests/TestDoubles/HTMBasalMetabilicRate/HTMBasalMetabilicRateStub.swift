@testable import HTMath

final class HTMBasalMetabilicRateStub: HTMBasalMetabilicRateProtocol {
    
    var calculateExpected: Double = .zero
    
    func calculate(model: HTMBasalMetabilicRateModel) -> Double? {
        return calculateExpected
    }
}
