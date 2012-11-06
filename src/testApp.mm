#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);

	ofSetFrameRate(30);

    //Device Id of front camera is 1.
    //Device Id pf back camera is 0.
    grabber.setDeviceID(1);
	grabber.initGrabber(grab_height, grab_height, OF_PIXELS_BGRA);
	tex.allocate(grabber.getWidth(), grabber.getHeight(), GL_RGB);
	
    //changed order slightly to work better for mapping
    asciiCharacters =  string("  ..,,,'''``--_:;^^**""=+<>iv%&xclrs)/){}I?!][1taeo7zjLunT#@JCwfy325Fp6mqSghVd4EgXPGZbYkOA8U$KHDBWNMR0Q");
    
    font.loadFont("Courier New Bold.ttf", fontSize);
    font.setLineHeight(fontLineSize);
    
    ofEnableAlphaBlending();

}

//--------------------------------------------------------------
void testApp::update(){
	ofBackground(0,0,0);
	
	grabber.update();	
    tex.loadData(grabber.getPixels() , grabber.getWidth(), grabber.getHeight(), GL_RGB);
}

//--------------------------------------------------------------
void testApp::draw(){	
	
	ofSetColor(255);
	tex.draw(0, 0, tex.getWidth() / 4, tex.getHeight() / 4);

    
    unsigned char * src = grabber.getPixels();
    ofSetHexColor(0xffffff);
	
    int brightness;
    int character;
    char temp;
    string tempStr;
    
    for (int i = 0; i < grabber.getWidth(); i+= fontLineSize){
        for (int j = 0; j < grabber.getHeight(); j+= fontSize){
            brightness = (src[(j*(int)grabber.getWidth() + i) * 3] +
                          src[(j*(int)grabber.getWidth() + i) * 3 + 1] +
                          src[(j*(int)grabber.getWidth() + i) * 3 + 2]) / 3;
            
			//we do powf to do a curved rather than a linear mapping of the values
            character = powf( ofMap(brightness, 0,255, 0, 1), 2.5) * (float)asciiCharacters.size();
            temp = asciiCharacters[character];
            tempStr = "";
            tempStr += temp;
            font.drawString(tempStr, i, j);
        }
    }

}

//--------------------------------------------------------------
void testApp::exit(){
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::lostFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
    
}


