//
//  MonteCarloPricer.hpp
//  MyLib
//
//  Created by Martial Aguessi on 30/06/2025.
//

#ifndef MonteCarloPricer_hpp
#define MonteCarloPricer_hpp

#include "stdafx.h"

class MonteCarloPricer {
    
public:
    /* Constructor */
    MonteCarloPricer() ;
    
    /* Number of scenarios */
    int nScenarios;
    
    /* Price a call option */
    double price (const CallOption& callOption,
                  const BlackScholesModel& bsm) ;
};

void testMonteCarloPricer() ;

#endif /* MonteCarloPricer_hpp */
