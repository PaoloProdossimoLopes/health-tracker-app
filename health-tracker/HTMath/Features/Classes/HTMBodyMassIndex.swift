import Foundation

final class HTMBodyMassIndex {
    
    func calculate(model: HTMPeopleModel) -> Double? {
        let weightIsValid = model.wight > 0
        let heightIsValid = model.height > 0
        guard weightIsValid, heightIsValid else { return nil }
        
        let height = convertCentimeterToMeter(value: model.height)
        let weight = model.wight
        let result = weight / (height * height)
        
        return format(result)
    }
    
    func stage(_ index: Double) -> HTMBMIStage {
        switch index {
        case ...18.499 : return .underWeight
        case 18.500...24.999 : return .nomalWeight
        case 25.000...29.999 : return .overWeight
        case 30.000...34.999 : return .obesityOne
        case 35.000...39.999 : return .obesityTwo
        case 40... : return .obesityThree
        default: return .none
        }
    }
    
    private func convertCentimeterToMeter(value: Double) -> Double {
        return value / 100
    }
    
    func format(_ value: Double) -> Double? {
        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 3
        formatter.decimalSeparator = "."
        
        guard let formatted = formatter.string(from: value as NSNumber) else { return nil }
        return Double(formatted)
    }
}
