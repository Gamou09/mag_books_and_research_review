//
//  charts.cpp
//  MyLib
//
//  Created by Martial Aguessi on 06/06/2025.
//


#include "stdafx.h"

using namespace std ;

static void writeTopBoilerPlateOfPiChart( ostream& out ){
    
    out << "<html>\n" ;
    out << "<head>\n" ;
    out << "\n" ;
    out << "<!-- Load the AJAX API -->\n" ;
    out << "<script type=\"text/javascript\"" ;
    out << "src=\"https://www.google.com/jsapi\">\"</script>\n" ;
    out << "<script type=\"text/javascript\">\n" ;
    out << "\n" ;
    out << "// Load the Visualization API\n" ;
    out << "// and the pie chart package\n" ;
    out << "google.load('visualization', '1.0', {'packages':['corechart']});\n" ;
    out << "\n" ;
    out << "// Set a callback to run when the\n" ;
    out << "// Google  Visualization API is loaded.\n" ;
    out << "google.charts.setOnLoadCallback(drawChart);\n" ;
    out << "\n" ;
    out << "// Callback that createq  and populate a data table,\n" ;
    out << "// instantiate the pie chart, passes in the data and draws it\n" ;
    out << "function drawChart() {\n" ;
    out << "\n" ;
    out << " // Create the data table\n" ;
    out << " var data = new google.visualization.DataTable();\n" ;
    out << " data.addColumn('string', 'Label') ;\n" ;
    out << " data.addColumn('number', 'Value') ;\n" ;

}

static void writeBottomBoilerPlateOfPiChart( ostream& out ){
    
    out << "\n" ;
    out << " // Set chart options\n" ;
    out << " var options = {\n" ;
    out << "  'title' : 'Pizza Toppings',\n" ;
    out << "  'width' : 400,\n" ;
    out << "  'height' : 300\n" ;
    out << " };\n" ;
    out << "\n" ;
    out << " // Instantiate and draw our chart, passing in some options\n" ;
    out << " var chart = new google.visualization.PieChart(document.getElementById('chart_div'));\n" ;
    out << " chart.draw(data, options);\n" ;
    out << "}\n" ;
    out << "\n" ;
    out << "</script>\n" ;
    out << "</head>\n" ;
    out << "<body>\n" ;
    out << "<!-- Div that will hold the pie chart -->\n" ;
    out << "<div id=\"chart_div\"></div>\n" ;
    out << "</body>\n" ;
    out << "</html>\n" ;
    out << "\n" ;
}

static void writeFixedPieChartData( ostream& out ){
    out << " data.addRows([\n" ;
    out << "  ['Bananas', 100],\n" ;
    out << "  ['Apples', 200],\n" ;
    out << "  ['Kumquats', 150]\n" ;
    out << " ]);\n" ;
}

static void writeDataOfPieChart( ostream& out,
                                 const vector<string>& labels,
                                 const vector<double>& values){
    out << "data.addRows([\n" ;
    int nLabels = (int)labels.size() ;
    
    for (int i = 0; i <nLabels ; i++) {
        string label = labels[i] ;
        double value = values[i] ;
        out << "  ['" << label <<  "', " << value << "]" ;
        if (i != nLabels - 1) {
            out <<"," ;
        }
        out <<"\n" ;
    }
    out << "]);\n" ;
}

static void testFixedPieChart(){
    ofstream out ;
    out.open("FixedPieChart.html") ;
    writeTopBoilerPlateOfPiChart(out) ;
    writeFixedPieChartData(out) ;
    writeBottomBoilerPlateOfPiChart(out) ;
    out.close() ;
}

static void testPieChartData(){
    
    // this test automates the checking
    stringstream out ;
    vector<string> labels(3) ;
    vector<double> values(3) ;
    for (int i=0; i < 3; i++) {
        stringstream ss ;
        ss << "A Label "<<i ;
        labels[i] = ss.str() ;
        INFO( labels[i] ) ;
        values[i] = (double) i ;
    }
    
    writeDataOfPieChart(out, labels, values) ;
    
    string asString = out.str() ;
    
    INFO(asString) ;
    
    stringstream expected ;
    expected << "data.addRows([\n" ;
    expected << "  ['A Label 0', 0],\n" ;
    expected << "  ['A Label 1', 1],\n" ;
    expected << "  ['A Label 2', 2]\n" ;
    expected << "]);\n" ;
    
    string expectedStr = expected.str() ;
    
    INFO(expectedStr) ;
    
    ASSERT( asString == expectedStr ) ;
}

void pieChart(const string& file,
              const vector<string>& labels,
              const vector<double>& values){
    ofstream out ;
    out.open(file.c_str());
    writeTopBoilerPlateOfPiChart( out ) ;
    writeDataOfPieChart(out, labels, values) ;
    writeBottomBoilerPlateOfPiChart( out ) ;
    out.close() ;
}

void testCharts (){
    cout << "\n-- Start Test Charts -- \n" ;
    TEST( testFixedPieChart ) ;
    TEST( testPieChartData ) ;
}
