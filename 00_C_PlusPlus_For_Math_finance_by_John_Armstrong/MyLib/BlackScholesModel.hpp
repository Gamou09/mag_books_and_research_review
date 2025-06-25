//
//  BlackScholesModel.hpp
//  MyLib
//
//  Created by Martial Aguessi on 25/06/2025.
//

#ifndef BlackScholesModel_hpp
#define BlackScholesModel_hpp

#include "stdafx.h"

class BlackScholesModel {
    
public:
    // the member variables are only those associated with the model not the financial contract
    // very important for the class integrity
    double stockPrice ;
    double volatility;
    double riskFreeRate;
    double date; // date will be measure in year since 0 A.D e.g 01/01/2014 will be 2014.0 - For real prod, consider proper date
};

#endif /* BlackScholesModel_hpp */
