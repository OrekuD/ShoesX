//
//  AppViewModal.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 10/06/2023.
//

import Foundation

struct CountryData: Hashable {
    var name: String;
    var code: String;
    var flag: String;
}

class AppViewModel: ObservableObject {
    @Published var countries: [CountryData] = [];
    @Published var country: CountryData? = nil;
    
    init() {
        country = nil
        countries = getCountries();
    }
    
    func getCountries() -> [CountryData] {
        var data: [CountryData] = []
        for code in NSLocale.isoCountryCodes  {
            
            let flag = String.emojiFlag(for: code)
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])

            if let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) {
                data.append(CountryData(name: name, code: code, flag: flag!))
                if code == Locale.current.language.region?.identifier {
                    country = CountryData(name: name, code: code, flag: flag!)
                }
            }
            
        }
        return data
    }
    
    func setCountry(data: CountryData) {
        country = data
    }
}

extension String {
    static func emojiFlag(for countryCode: String) -> String! {
        func isLowercaseASCIIScalar(_ scalar: Unicode.Scalar) -> Bool {
            return scalar.value >= 0x61 && scalar.value <= 0x7A
        }
        func regionalIndicatorSymbol(for scalar: Unicode.Scalar) -> Unicode.Scalar {
            precondition(isLowercaseASCIIScalar(scalar))
            // 0x1F1E6 marks the start of the Regional Indicator Symbol range and corresponds to 'A'
            // 0x61 marks the start of the lowercase ASCII alphabet: 'a'
            return Unicode.Scalar(scalar.value + (0x1F1E6 - 0x61))!
        }
        let lowercasedCode = countryCode.lowercased()
        guard lowercasedCode.count == 2 else { return nil }
        guard lowercasedCode.unicodeScalars.reduce(true, { accum, scalar in accum && isLowercaseASCIIScalar(scalar) }) else { return nil }

        let indicatorSymbols = lowercasedCode.unicodeScalars.map({ regionalIndicatorSymbol(for: $0) })
        return String(indicatorSymbols.map({ Character($0) }))
    }
}

