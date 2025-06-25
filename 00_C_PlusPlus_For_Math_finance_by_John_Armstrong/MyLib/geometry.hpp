//
//  geometry.hpp
//  MyLib
//
//  Created by Martial Aguessi on 21/05/2025.
//


#ifndef geometry_hpp
#define geometry_hpp

#include "stdafx.h"

// we need to redefine PI here since no link between matlib header/.cpp and geometry header/.cpp
//static const double PI = 3.141592653589 ; // need to comment to avoid redefintion

double areaCircle(double radius) ;

double circumferenceCircle(double radius) ;

// test function

void testGeometry() ;

// Class declaration
// similar to other variable, or function when you declare in header you want other to be able to use it

class CartesianPoint {
    
// allow bellow member variables to be accessible outside of the class
// by defaut it's private
public:
    // member variables
    double x;
    double y;
};

void useCartesianClass() ;

class PolarPoint {
    
public:
    double r;
    double theta;
};

CartesianPoint polarToCartesian( const PolarPoint& p) ;

class Circle{
    
public:
    /// we declare member variable and  some class methods
    double radius;
    double area() ; // notice that the declaration of the method doesn't take any paremeters
    double circumference() const; // As seen before, we can add a const keyword but it has to be consistent
    // here we use const for circumference implying that measure the circumference doesn't change the circle
} ;

#endif /* geometry_hpp */
