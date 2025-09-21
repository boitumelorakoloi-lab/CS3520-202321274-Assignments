#include <iostream>
#include <string>
using namespace std;


int main() {
    int litres;
    const int lekopokopoSize = 20;
    
    cout << "Enter quantity of grains in litres: ";
    cin >> litres;
    
    if (litres < 0) {
        cout << "Error: Quantity cannot be negative." << endl;
        return 1;
    }
    
    int makokopo = litres / lekopokopoSize;
    int remainder = litres % lekopokopoSize;
    
    cout << litres << " litres makes " << makokopo << " makokopo";
    cout << " with " << remainder << " litres remaining." << endl;
    
    return 0;
}