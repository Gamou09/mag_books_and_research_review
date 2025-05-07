//
//  main.cpp
//  System Divers
//
//  Created by Martial Aguessi on 07/05/2025.
//

#include <iostream>
using namespace std;

int main() {
    cout << "Checking the memory size of each variable on system --> " ;
    cout << "Size of int: " << sizeof(int) << " bytes\n";
    cout << "Size of float: " << sizeof(float) << " bytes\n";
    cout << "Size of double: " << sizeof(double) << " bytes\n";
    cout << "Size of char: " << sizeof(char) << " bytes\n";
    cout << "Size of long: " << sizeof(long) << " bytes\n";
    cout << "Size of long long: " << sizeof(long long) << " bytes\n";
    cout << "Size of bool: " << sizeof(bool) << " bytes\n";
    return 0;
}
