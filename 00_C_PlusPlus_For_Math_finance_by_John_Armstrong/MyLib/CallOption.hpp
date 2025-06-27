//
//  CallOption.hpp//
//  Created by Martial Aguessi on 25/06/2025.
//

#ifndef CallOption_hpp
#define CallOption_hpp

#include "stdafx.h"

// Significant benefit opf seperating the the Model to the Options
// the option is the contract and doesn't change when market changed even though its price may vary
class CallOption{

public:
    // default constructor
    CallOption();
    
    // constructor with parameter
    CallOption(double strike, double maturity) ;
    
    // member variable
    double strike;
    double maturity ;
    
    // member function aka method
    double payoff ( double stockAtMaturity) const ;
    double price ( const BlackScholesModel& bsm) const ;
} ;

void testCallOption() ;

#endif /* CallOption_hpp */
