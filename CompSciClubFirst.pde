//global variables here
//ArrayList<Day> schoolYear = new ArrayList<Day>();
boolean schedulePressed = false;
boolean dayPressed = false;
boolean monthPressed = false;
boolean yearPressed = false;
boolean daySelec1= false;
boolean daySelec2= false;
boolean yearSelec1= false;
boolean yearSelec2= false;
String day= "";
String month = "";
String year = "";
String scheduleChange="";
ArrayList<Day> schoolYear;
PImage logo;
String dir= "C:/Users/fuady/Documents/Processing/CompSciClubFirst/data//";

//void int SchoolYear(){
  // add every single school day from August to June
  // then take out ever single weekend and thanksgiving
//}

// if they want to change the assembly period, they can input it into the box
// and then that would update on the phones saying, 
// for example, Assembly Period (No Class Meetings)
// find some way to make someone be able to change assembly period for each year
// for example, on Thursday where different forms have different schedules.
void setup()
{
  size(1200,1200);
  logo = loadImage(dir + "SSALogo.png");
  frameRate(70);
//this can be the main function
  
}
// one can get the hours and minutes by splicing the so that you get the -2 and -1 element is the
// minutes and everything else is the hours
// figure out how to do lunch
Period[] getRegularSchedule(){
  
  Period period1 = new Period("8:15", "9:05", "period 1");
  Period period2 = new Period("9:10", "10:00", "period 2");
  Period assembly = new Period("10:05", "10:30", "assembly");
  Period period3 = new Period("10:35", "11:45", "period 3");
  Period period4A = new Period("11:50", "12:20", "period 4a");
  Period period4B = new Period("12:25", "12:40", "period 4b");
  Period period4C = new Period("12:45", "1:15", "period 4c");
  Period period5 = new Period("1:20", "2:10", "period 5");
  Period period6 = new Period("2:15", "3:00", "period 6");
  Period[] periods = {period1, period2, assembly, period3, period4A, period4B, period4C, period5, period6};
  return periods;
}


Period[] getAssembyAMSchedule(){
  Period period1 = new Period("8:15", "9:05", "period 1");
  Period period2 = new Period("9:10", "10:00", "period 2");
  Period assembly = new Period("10:05", "10:55", "assembly");
  Period period3 = new Period("11:00", "12:10", "period 3");
  Period period4A = new Period("12:15", "12:40", "period 4a");
  Period period4B = new Period("12:45", "1:05", "period 4b");
  Period period4C = new Period("1:10", "1:35", "period 4c");
  Period period5 = new Period("1:40", "2:30", "period 5");
  Period period6 = new Period("2:35", "3:25", "period 6");
  Period[] periods = {period1, period2, assembly, period3, period4A, period4B, period4C, period5, period6};
  return periods;
}


Period[] getAssembyPMSchedule(){
  Period period1 = new Period("8:15", "9:05", "period 1");
  Period period2 = new Period("9:10", "10:00", "period 2");
  Period period3 = new Period("10:05", "11:15", "period 3");
  Period period4A = new Period("11:20", "11:45", "period 4a");
  Period period4B = new Period("11:50", "12:10", "period 4b");
  Period period4C = new Period("12:15", "12:40", "period 4c");
  Period period5 = new Period("12:45", "1:35", "period 5");
  Period period6 = new Period("1:40", "2:30", "period 6");
  Period assembly = new Period("2:35", "3:25", "period 6");
  Period[] periods = {period1, period2, period3, period4A, period4B, period4C, period5, period6, assembly};
  return periods;
}


Period[] getCUPSchedule(){
  Period period1 = new Period("8:15", "8:55", "period 1");
  Period period2 = new Period("9:00", "9:40", "period 2");
  Period period3 = new Period("10:05", "10:25", "period 3");
  Period period4A = new Period("10:30", "10:55", "period 4a");
  Period period4B = new Period("11:00", "11:10", "period 4b");
  Period period4C = new Period("11:15", "11:40", "period 4c");
  Period period5 = new Period("11:45", "12:25", "period 5");
  Period period6 = new Period("12:30", "1:10", "period 6");
  Period cup = new Period("1:20", "3:45", "period 6");
  Period[] periods = {period1, period2, period3, period4A, period4B, period4C, period5, period6, cup};
  return periods;
}


Period[] getDelayedOpeningSchedule(){
  Period period3 = new Period("10:15", "10:55", "period 1");
  Period period4A = new Period("11:00", "11:25", "period 4a");
  Period period4B = new Period("11:30", "11:40", "period 4b");
  Period period4C = new Period("11:45", "12:10", "period 4c");
  Period period5 = new Period("12:15", "12:55", "period 5");
  Period period6 = new Period("1:00", "1:40", "period 6");
  Period period1 = new Period("1:45", "2:25", "period 1");
  Period period2 = new Period("2:30", "3:10", "period 2");
  Period[] periods = {period1, period2, period3, period4A, period4B, period4C, period5, period6};
  return periods;
}
class Day
{
  int day; 
  int month;
  int year;
  Schedule schedule;
  public Day(int[]date, Schedule s){
    day=date[0];
    month=date[1];
    year=date[2];
    schedule=s;
  }
  public int[] getDate(){ 
    // returns and array where day,month, and year are at index 0,1,2 respectively
    return new int[]{day, month, year};
  }
}


class Schedule
{
  Period[] periods;
  String name;
  public Schedule(Period[]p, String n){
    periods=p;
    name=n;
  }
}


class Period
{
  String startTime;
  String endTime;
  String name;
  public Period(String st, String et, String n){
    this.startTime=st;
    this.endTime=et;
    this.name=n;
  }
}


void draw() {
  
  background(255, 221, 153);
    image(logo, 750, 50, 400, 400);
  fill(255, 255, 255);
  rect(650, 100, 100, 50);
  fill(2, 25, 255);
  text("Submit", 655, 110);


  fill(255, 255, 255);
  rect(50, 100, 100, 50);
  fill(2, 25, 255);
  text("Select Day", 55, 110);
  text(day, 55, 130);
  
  fill(255, 255, 255);
  rect(200, 100, 100, 50);
  fill(2, 25, 255);
  text("Select Month", 205, 110);
  text(month, 205, 130);
  
  fill(255, 255, 255);
  rect(350, 100, 100, 50);
  fill(2, 25, 255);
  text("Select Year", 355, 110);
  text(year, 355, 130);
  fill(255, 255, 255);
  rect(500, 100, 100, 50);
  fill(2, 25, 255);
  text("Select Schedule", 505, 110);
  text(scheduleChange, 505, 130);
   
   if(dayPressed==true){
    int dayY = 175;
    fill(255, 255, 255);
     rect(50, dayY, 35, 35);
     fill(2, 25, 255);
     text("0", 55, 185);
     
     fill(255, 255, 255);
     rect(50, dayY+40, 35, 35);
     fill(2, 25, 255);
     text("1", 55, 225);
     
     fill(255, 255, 255);
     rect(50, dayY+80, 35, 35);
     fill(2, 25, 255);
     text("2", 55, 265);
     
     fill(255, 255, 255);
     rect(50, dayY+120, 35, 35);
     fill(2, 25, 255);
     text("3", 55, 305);
     
     fill(255, 255, 255);
     rect(100, dayY, 35, 35);
     fill(2, 25, 255);
     text("0", 105, 185);
     
     fill(255, 255, 255);
     rect(100, dayY+40, 35, 35);
     fill(2, 25, 255);
     text("1", 105, 225);
     
     fill(255, 255, 255);
     rect(100, dayY+80, 35, 35);
     fill(2, 25, 255);
     text("2", 105, 265);
     
     fill(255, 255, 255);
     rect(100,dayY+120, 35, 35);
     fill(2, 25, 255);
     text("3", 105, 305);
     
     fill(255, 255, 255);
     rect(100, dayY+160, 35, 35);
     fill(2, 25, 255);
     text("4", 105, 345);
     
     fill(255, 255, 255);
     rect(100, dayY+200, 35, 35);
     fill(2, 25, 255);
     text("5", 105, 385);
     
     fill(255, 255, 255);
     rect(100, dayY+240, 35, 35);
     fill(2, 25, 255);
     text("6", 105, 425);
     
     fill(255, 255, 255);
     rect(100, dayY+280, 35, 35);
     fill(2, 25, 255);
     text("7", 105, 465);
     
     fill(255, 255, 255);
     rect(100, dayY+320, 35, 35);
     fill(2, 25, 255);
     text("8", 105, 505);

  
    fill(255, 255, 255);
     rect(100, dayY+360, 35, 35);
     fill(2, 25, 255);
     text("9", 105, 545);

    
   }
   if(schedulePressed){
     int scheduleY= 175;
     String[] scheduleNames = new String[]{
       "Regular Schedule",
       "Morning Assembly",
       "Late Assembly",
       "Early Dismissal",
       "Delayed Opening",
       "Tuesday"
     };
     for(int i = 0; i < scheduleNames.length; i++){
      fill(255, 255, 255);
      rect(500, scheduleY+i*75, 100, 50);
      fill(2, 25, 255);
      text(scheduleNames[i], 502, 30+scheduleY+i*75);
    
     }
    
   }
   if(yearPressed){
     int yearY= 175;
     fill(255, 255, 255);
     rect(350, yearY, 35, 35);
     fill(2, 25, 255);
     text("1", 355, 185);
     yearY+= 40;
     fill(255, 255, 255);
     rect(350, yearY, 35, 35);
     fill(2, 25, 255);
     text("2", 355, 225);
     yearY+= 40;
     fill(255, 255, 255);
     rect(350, yearY, 35, 35);
     fill(2, 25, 255);
     text("3", 355, 265);
     yearY= 175;
      fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("0", 405, 185);
     yearY+= 40;
     
     fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("1", 405, 225);
     yearY+= 40;
     fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("2", 405, 265);
     yearY+= 40;
     fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("3", 405, 305);
     yearY+= 40;
     fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("4", 405, 345);
     yearY+= 40;
     fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("5", 405, 385);
     yearY+= 40;
     fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("6", 405, 425);
     yearY+= 40;
     fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("7", 405, 465);
     yearY+= 40;
     fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("8", 405, 505);
     yearY+= 40;
  
    fill(255, 255, 255);
     rect(400, yearY, 35, 35);
     fill(2, 25, 255);
     text("9", 405, 545);
     yearY+= 40;
   }
   if(monthPressed == true){
     int monthY = 175;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("August", 205, 190);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("September", 205, 265);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("October", 205, 340);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("November", 205, 415);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("December", 205, 490);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("January", 205, 565);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("February", 205, 640);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("March", 205, 715);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("April", 205, 790);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("May", 205, 865);
    monthY+=75;
    fill(255, 255, 255);
    rect(200, monthY, 100, 50);
    fill(2, 25, 255);
    text("June", 205, 940);
   }/*else{
     return;
   }*/
   if(yearSelec2 == true && yearSelec1 == true){
    yearPressed = false;
    yearSelec2 = false;
    yearSelec1 =false;
  }
   if(daySelec2 == true && daySelec1 == true){
    dayPressed = false;
    daySelec2 = false;
    daySelec1 =false;
  }
    
    
  
}
void mouseClicked() {
  if(mouseX > 650 && mouseX <750 && mouseY>100 && mouseY <150){
      submit();
  }
  if(mouseX> 50 && mouseX <150 && mouseY>100 && mouseY <150){
      dayPressed = true;
  }
  if(mouseX> 200 && mouseX <300 && mouseY>100 && mouseY <150){
      monthPressed = true;
  }
  if(mouseX> 350 && mouseX <450 && mouseY>100 && mouseY <150){
      yearPressed = true;
  }
  if(mouseX> 500 && mouseX <600 && mouseY>100 && mouseY <150){
      schedulePressed = true;
  }
  if(yearPressed){
    if(mouseX > 350 && mouseX < 385&& yearSelec1 == false){
      if(mouseY > 175 && mouseY < 210){
        year=year + "1";
        yearSelec1= true;
  
       }
       if(mouseY > 215 && mouseY < 250){
         //day, tens position = 1
          year= year+ "2";
         yearSelec1= true;
       }
       if(mouseY > 255 && mouseY < 290){
          //day, tens position = 2
          year= year+"3";
          yearSelec1= true;
        }
    }
        if(mouseX> 400 && mouseX< 435 && yearSelec1==true && yearSelec2 == false){
      if(mouseY > 175 && mouseY < 210){
        yearSelec2 = true;
                year= year +"0";
      }
      if(mouseY > 215 && mouseY < 250){
         yearSelec2 = true;
        year= year+ "1";
      }
      if(mouseY > 255 && mouseY < 290){
         yearSelec2 = true;
          year+="2";
               }
      if(mouseY> 295 && mouseY< 330){
        yearSelec2 = true;
        year= year+"3";
      }
      if(mouseY> 335 && mouseY< 365){
        yearSelec2 = true;
        year= year+ "4";
      }
      if(mouseY> 370 && mouseY< 405){
        yearSelec2 = true;
        year= year +"5";
      }
      if(mouseY> 410 && mouseY< 445){
        yearSelec2 = true;
        year= year +"6";
      }
      if(mouseY> 450 && mouseY< 485){
        yearSelec2 = true;
        year= year +"7";
      }
      if(mouseY> 490 && mouseY< 525){
        yearSelec2 = true;
        year= year +"8";
       }
       if(mouseY> 530 && mouseY< 565){
        yearSelec2 = true;
       year= year +"9";
       }
     }
     else{
      return;
      }
  }
  if(schedulePressed == true && mouseX > 500 && mouseX < 600){
      if(mouseY > 175 && mouseY < 225){
        schedulePressed = false; 
        scheduleChange = "regular";
      }
      if(mouseY >250 && mouseY < 300){
         schedulePressed = false; 
        scheduleChange = "morningAssembly";
      }
      if(mouseY > 325 && mouseY < 375){
         schedulePressed = false; 
        scheduleChange = "lateAssembly";
      }
      if(mouseY > 400 && mouseY < 450 ){
         schedulePressed = false; 
        scheduleChange = "earlyDismissal";
      }
      if(mouseY > 475 && mouseY < 525 ){
         schedulePressed = false; 
        scheduleChange = "delayedOpening";
      }
      if(mouseY > 550 && mouseY < 600 ){
         schedulePressed = false; 
        scheduleChange = "cupDay";
      }
      if(mouseY > 625 && mouseY < 675){
         schedulePressed = false; 
        scheduleChange = "tuesday";
        
      }
  }
  if(dayPressed){
    if(mouseX> 50 && mouseX< 85 && daySelec1 == false){
      if(mouseY > 175 && mouseY < 210){
       day+="0";
       println("day1");
        daySelec1= true;
  
       }
       if(mouseY > 215 && mouseY < 250){
         //day, tens position = 1
         day= day + "1";
         daySelec1= true;
       }
       if(mouseY > 255 && mouseY < 290){
          //day, tens position = 2
        day= day + "2";
          daySelec1= true;
        }
        if(mouseY> 295 && mouseY< 330){
          //day, tens position = 3
           day =  day +"3";
          daySelec1= true;
        }
    }
    if(mouseX> 100 && mouseX< 135 && daySelec1==true && daySelec2 == false){
      if(mouseY > 175 && mouseY < 210){
        daySelec2 = true;
        
                day= day + "0";
                println(day);
      }
      if(mouseY > 215 && mouseY < 250){
         daySelec2 = true;
        day = day + "1";
      }
      if(mouseY > 255 && mouseY < 290){
         daySelec2 = true;
         day+="2";
               }
      if(mouseY> 295 && mouseY< 330){
        daySelec2 = true;
        day+="3";
      }
      if(mouseY> 335 && mouseY< 365){
        daySelec2 = true;
        day+="4";
      }
      if(mouseY> 370 && mouseY< 405){
        daySelec2 = true;
        day+="5";
      }
      if(mouseY> 410 && mouseY< 445){
        daySelec2 = true;
        day+="6";
      }
      if(mouseY> 450 && mouseY< 485){
        daySelec2 = true;
        day+="7";
      }
      if(mouseY> 490 && mouseY< 525){
        daySelec2 = true;
        day+="8";
       }
       if(mouseY> 530 && mouseY< 565){
        daySelec2 = true;
       day+="9";
       }
     }
     else{
      return;
      }
    }
    if(monthPressed == true && mouseX > 200 && mouseX < 300){
      if(mouseY > 175 && mouseY < 225){
         monthPressed = false; 
        month = "8";
        println(month);
      }
      if(mouseY >250 && mouseY < 300){
         monthPressed = false; 
        month = "9";
      }
      if(mouseY > 325 && mouseY < 375){
         monthPressed = false; 
        month = "10";
      }
      if(mouseY > 400 && mouseY < 450 ){
         monthPressed = false; 
        month = "11";
      }
      if(mouseY > 475 && mouseY < 525 ){
         monthPressed = false; 
        month = "12";
      }
      if(mouseY > 550 && mouseY < 600 ){
         monthPressed = false; 
        month = "1";
      }
      if(mouseY > 625 && mouseY < 675){
         monthPressed = false; 
        month = "2";
      }
      if(mouseY > 700 && mouseY < 750 ){
         monthPressed = false; 
        month = "3";
      }
      if(mouseY >775  && mouseY < 825 ){
         monthPressed = false; 
        month = "4";
      }
      if(mouseY >850 && mouseY <900 ){
         monthPressed = false; 
        month = "5";
      }
      if(mouseY >925 && mouseY < 975){
         monthPressed = false; 
        month = "6";
      }
      
    }
  }
void submit(){
  println(year);
  println(day);
  println(month);
  println(scheduleChange);
  day= "";
  year = "";
  month ="";
  scheduleChange = "";
  
  // in submit we need to get all of the data from the dropdown menu 
}