#include "ofMain.h"
#include "testApp.h"
#include "Global.h"

#include <iostream>

int main(){
    
    grab_height = 1024;
    grab_width = 768;
    ofSetupOpenGL(grab_width, grab_height, OF_FULLSCREEN);
    ofRunApp(new testApp);
    
}
