//
//  File.swift
//  
//
//  Created by Joseph Mattiello on 10/4/19.
//

import Foundation
import SwiftEQ

// Example model
struct FormViewModel {
    let name: Observable<String?> = Observable()
    let companyName: Observable<String?> = Observable()
    let yearsOfExperience: Observable<Double?> = Observable()
    let isCurrentEmployer: Observable<Bool> = Observable(false)
    let approxSalary: Observable<Float?> = Observable()
    let comments: Observable<String?> = Observable()
    
    func getExperienceString() -> String {
        if let yearsOfExperience = yearsOfExperience.value {
            return "\(String(describing: yearsOfExperience)) yrs"
        }
        return "--"
    }
    
    func getSalaryString() -> String {
        if let approxSalary = approxSalary.value {
            let normalizedValue = approxSalary / 1000.0
            return "\(normalizedValue)k"
            
        }
        return "--"
    }
    
    func getPrettyString() -> String {
        return
            "Name: \(String(describing: name.value ?? "--"))\n" +
            "Company: \(String(describing: companyName.value ?? "--"))\n" +
            "Experience: \(getExperienceString())\n" +
            "Current Employer?: \((isCurrentEmployer.value ? "YES" : "NO"))\n" +
            "approx Salary: \(getSalaryString())\n" +
            "Comments: \(String(describing: comments.value ?? "--"))"
    }
}


// Example model
#if compiler(>=5.1)
struct FormViewModelWrapped {
   
    @Bound var name: String?
    @Bound var companyName: String?
    @Bound var yearsOfExperience: Double?
    @Bound var isCurrentEmployer: Bool = false
    @Bound var approxSalary: Float?
    @Bound var comments: String?
    
    func getExperienceString() -> String {
        if let yearsOfExperience = yearsOfExperience {
            return "\(String(describing: yearsOfExperience)) yrs"
        }
        return "--"
    }
    
    func getSalaryString() -> String {
        if let approxSalary = approxSalary {
            let normalizedValue = approxSalary / 1000.0
            return "\(normalizedValue)k"
            
        }
        return "--"
    }
    
    func getPrettyString() -> String {
        return
            "Name: \(String(describing: name ?? "--"))\n" +
            "Company: \(String(describing: companyName ?? "--"))\n" +
            "Experience: \(getExperienceString())\n" +
            "Current Employer?: \((isCurrentEmployer ? "YES" : "NO"))\n" +
            "approx Salary: \(getSalaryString())\n" +
            "Comments: \(String(describing: comments ?? "--"))"
    }
}
#endif
