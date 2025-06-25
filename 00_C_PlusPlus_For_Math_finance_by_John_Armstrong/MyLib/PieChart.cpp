//
//  PieChart.cpp
//  MyLib
//
//  Created by Martial Aguessi on 25/06/2025.
//

#include "stdafx.h"

using namespace std ;

void PieChart::setTitle(const string& t){
    title = t ;
}

// By setting labels and values as private in the declaration
// it is now impossibles for these two vectos to contain a different number of elements.
// because only addEntry add an element and do it for both everytime
void PieChart::addEntry(const string& label, double value){
    labels.push_back(label) ;
    values.push_back(value) ;
}

