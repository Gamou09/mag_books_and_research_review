//
//  main.cpp
//  MyLib
//
//  Created by Martial Aguessi on 21/05/2025.
//

// Angle bracket vs double quote when importing
// Anlge brackets tell the compiler that this file won't have changed since last compilation
// thus no need to compile again thefere compiler runs faster
//#include <iostream>

// one by one addition of header files
//#include "matlib.h"
//#include "geometry.hpp" // same as h file but h for c++

// simplified addition of header file using the windows convention
// this header file remove redundant typing of include header and library
#include "stdafx.h"

using namespace std ;

int main() {
    
    // Test matLib
    testMatlib();
    
    // Test geometry
    testGeometry();
    
    // test for derivatives
    testDerivatives() ;
    
    // test vector
    testVector() ;
    
    // test Pass by Ref or value, with or without const
    testPassRef() ;
    
    // Test ofstream module
    useOfstreamToWriteFile() ;
    
    // test the Write haiku function
    testWriteHaiku() ;
    
    // testing basic String fucntion
    testStringBasic() ;
    
    // test chart
    testCharts() ;
    
    // Test exercice from chapter 7
    testChap7_solutions() ;
    
    // Test use of class Cartesial
    useCartesianClass() ;
    
    // Test chap 8
    testCallOption() ; 
    
    // test Pie chart with class
    testPieChart() ;

}
