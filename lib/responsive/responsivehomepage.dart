


responsiveHomeItem(double screenHeight) {

  if(screenHeight <= 550){
    return screenHeight/1.5;
  }else{
    return screenHeight/2.1;
  }
}



responsiveHomeItemWidth(double screenHeight, double screenWidth) {

  if(screenHeight <= 550){
    return screenWidth/2;
  }else{
    return screenWidth/2.4;
  }
}



responsiveResultItem(double screenHeight) {

  if(screenHeight <= 550){
    return 0.4;
  }else{
    return 0.53;
  }
}