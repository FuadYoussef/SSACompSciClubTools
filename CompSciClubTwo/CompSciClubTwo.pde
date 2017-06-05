ArrayList<Day> schoolYear = new ArrayList<Day>();
boolean schedulePressed = false;
boolean dayPressed = false;
boolean monthPressed = false;
boolean yearPressed = false;
boolean daySelec1= false;
boolean daySelec2= false;
boolean yearSelec1= false;
boolean yearSelec2= false;
boolean customDay = false;
boolean customDayEntered = false;
boolean titleScreen = true;
boolean enterYearBoolean = false;
boolean startDateEntered = false;
String startDate = "";
String endDate = "";
String customDayName = "";
String scheduleChange="Regular Schedule";
PImage logo;
String foc = "sel";
int submitted = 0;
int notWeekday = 0;
final String[] monthNames = {"January", "February","March","April","May","June","July","August","September","October","November","December"};
final int[] monthLengths = {31,28,31,30,31,30,31,31,30,31,30,31};
final int D_W = 1000;
final int D_H = 800;
final String[] scheduleTypes = {"Regular Schedule", "Morning Assembly","Late Assembly","Early Dismissal","Delayed Opening","Cup Day","Tuesday", "Break", "Snow Day", "Day 0", "Custom Day"};
int[] date = {day()-1,month()-1,year()};
int shift = 0;
String dir= "C:/Users/fuady/Documents/Processing/CompSciClubFirst/data//";
//So there is an issue when copying apostrophes into processing. It will give you an error message when you do so what you need to do is just replace all of them once you’ve copied it
void initSchoolYear(){
 // add every single school day from August to June
 // then take out ever single weekend and thanksgiving
 return;
}
// if they want to change the assembly period, they can input it into the box
// and then that would update on the phones saying,    
// for example, Assembly Period (No Class Meetings)
// find some way to make someone be able to change assembly period for each year
// for example, on Thursday where different forms have different schedules.
void setup()
{
  int[] day = {1,2,2019};
  day = toDate(toInt(day));
  println(day[0]);
  println(day[1]);
  println(day[2]);
//this can be the main function
 shift = ((date[2]-2017)+(date[2]-2017)/4)%7;
 if(shift<0)shift+=7;
 for(int i = 0; i<date[1]; i++){
  if(i!=1||date[2]%4!=0)shift+=monthLengths[i];
  else shift+=29;
  shift%=7;
 }
 size(1110,900);
 logo = loadImage(dir + "SSALogo.png");
 frameRate(60);
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
void selRect(int xPos, int yPos, int xSize, int ySize){
  if(mouseX > xPos && mouseX < xPos+xSize && mouseY > yPos && mouseY < yPos+ySize)
  fill(192,192,192);
  else
  fill(255,255,255);
  rect(xPos, yPos, xSize, ySize);
}
void drawTitleScreen(){
  background(255, 221, 153);
  textSize(44);
  fill(0,0,0);
  text("Please select an option below.", 200, 100);
  textSize(20);
  text("Create New School Year", 105, 505);
  text("Edit Existing School Year", 705, 505);
  if(mouseX > 100 && mouseX < 400 && mouseY> 450 && mouseY< 600){
       fill(180,  190, 200);
     }else{
       fill(255, 255, 255);
     }
  rect(100, 450, 300, 150);
  if(mouseX > 700 && mouseX < 1000 && mouseY> 450 && mouseY< 600){
       fill(180,  190, 200);
     }else{
       fill(255, 255, 255);
     }
  rect(700, 450, 300, 150);
  fill(0,0,0);
  textSize(20);
  text("Create New School Year", 105, 530);
  text("Edit Existing School Year", 705, 530);
}
void enterYear(){
  fill(255, 255, 255);
  rect(300, 300, 500, 300);
  fill(0, 0, 0);
  text("Type in a start and end date. \nPress enter when you are done inputing a date" ,310, 320);
  text("Start Date (mm/dd/yy):" ,310, 420);
  text("End Date (mm/dd/yy):" ,310, 520);
  text(endDate ,550, 520);
  text(startDate ,550, 420);
}
void draw() {
  if(titleScreen){
    drawTitleScreen();
    if(enterYearBoolean){
      enterYear();
    }
  }else{
background(255, 221, 153);
textSize(32);
fill(255,255,255);
text("Shady Side Administrative Tool", 150, 50 );
fill(0, 0, 0);
textSize(24);
text("INSTRUCTIONS", 80, 775);
textSize(18);
text("Select a day, month, year, and schedule type by clicking the respective buttons and selecting their desired values. \n Once you are done selecting a day, click submit to add it to the calender. \n To view the calender, click \"View Calender\", to edit more days, click \"Edit Schedule\"", 80, 800);
textSize(11);
if(foc.equals("sel")){
 image(logo, 795, 50, 300, 300);
 selRect(650,100,100,50);
 fill(2, 25, 255);
 if(submitted>0){
   text("Submitted!", 670, 130);
   submitted--;
 }else{
   if(notWeekday>0){
   fill(255, 25, 2);
   text("Day is not", 670, 125);
   text("a weekday", 670, 135);
   notWeekday--;
   }else{
   text("Submit", 680, 130);
   }
 }
 selRect(5, 5, 100, 50);
 fill(2, 25, 255);
 text("View Calender", 20, 33);
 
 selRect(50, 100, 100, 50);
 fill(2, 25, 255);
 text("Select Day", 70, 115);
 text(date[0]+1, 90, 135);
 
 selRect(200, 100, 100, 50);
 fill(2, 25, 255);
 text("Select Month", 215, 115);
 text(monthNames[date[1]], 225, 135);
 
 selRect(350, 100, 100, 50);
 fill(2, 25, 255);
 text("Select Year", 370, 115);
 text(date[2], 385, 135);
 
 selRect(500, 100, 100, 50);
 fill(2, 25, 255);
 text("Select Schedule", 505, 115);
 if(customDay){ text(customDayName, 505, 135);}else{
 text(scheduleChange, 505, 135);}
  if(dayPressed){
  for(int i = 0; i<4; i++){
    selRect(50, 175+i*37, 35, 35);
    fill(2, 25, 255);
    text(i, 65, 195+i*37);
  }
  for(int i = 0; i<10; i++){
    selRect(100, 175+i*37, 35, 35);
    fill(2, 25, 255);
    text(i, 115, 195+i*37);
  }
  }
  if(schedulePressed){
   for(int i = 0; i<scheduleTypes.length; i++){
   selRect(500, 175+i*52, 100, 50);
   fill(2, 25, 255);
   text(scheduleTypes[i], 502, 200+i*52);
   }
  }
  if(yearPressed){
  for(int i = 0; i<4; i++){
    selRect(350, 175+i*37, 35, 35);
    fill(2, 25, 255);
    text(i, 365, 195+i*37);
  }
  for(int i = 0; i<10; i++){
    selRect(400, 175+i*37, 35, 35);
    fill(2, 25, 255);
    text(i, 415, 195+i*37);
  }
  }
  if(monthPressed){
  int trueMonth = 3;
  for(int i = 0; i<12; i++){
    selRect(200, 175+i*47, 100, 45);
    fill(2, 25, 255);
    text(monthNames[trueMonth], 205, 200+i*47);
    trueMonth++;
    if(trueMonth>11)trueMonth = 0;
  }
  }
  if(yearSelec2 && yearSelec1){
   yearPressed = false;
   yearSelec2 = false;
   yearSelec1 = false;
 }
  if(daySelec2&& daySelec1){
   dayPressed = false;
   daySelec2 = false;
   daySelec1 = false;
 }
 if(customDay && customDayEntered == false){
   fill(255, 255, 255);
   rect(300, 300, 300 ,300);
   fill(0,0,0);
   textSize(24);
   text("Please Type Day Name", 310, 325);
   text(customDayName, 310, 365);
   
 }
}else if(foc.equals("cal")){
  boolean sixWeek = (shift+monthLengths[date[1]]>35);
  selRect(5, 5, 100, 50);
  fill(2, 25, 255);
  text("Edit Schedule", 23, 33);//Select Button
  fill(255,255,255);
  rect(D_W/2-300, 100, 700, 100);//Calender Label
  rect(D_W/2-300, 200, 700, 25);//Week Label
  if(!sixWeek)rect(D_W/2-300, 225, 700, 500);//Days
  if(sixWeek)rect(D_W/2-300, 225, 700, 600);//Days
  fill(0,0,0);
  line(D_W/2-340, 150, D_W/2-320, 100);//Top of Left Arrow
  line(D_W/2-340, 150, D_W/2-320, 200);//Bottom of Left Arrow
  line(D_W/2+440, 150, D_W/2+420, 100);//Top of Right Arrow
  line(D_W/2+440, 150, D_W/2+420, 200);//Bottom of Right Arrow
  //line(D_W/2-350, 375, D_W/2+350, 375);
  //line(D_W/2-350, 475, D_W/2+350, 475);
  //line(D_W/2-350, 575, D_W/2+350, 575);
  //line(D_W/2-350, 675, D_W/2+350, 675);
  if(sixWeek){
  //line(D_W/2-350, 725, D_W/2+350, 775);
  for(int i = 1; i<7; i++)line(D_W/2-300+100*i, 200, D_W/2-300+100*i, 825);
  }else{
  for(int i = 1; i<7; i++)line(D_W/2-300+100*i, 200, D_W/2-300+100*i, 725);
  }
  text(date[2]+"", D_W/2-45, 125);//Year
  text(monthNames[date[1]], D_W/2-50, 150);//Month
  text("Sunday", D_W/2-275, 215);
  text("Monday", D_W/2-175, 215);
  text("Tuesday", D_W/2-75, 215);
  text("Wednsday", D_W/2+25, 215);
  text("Thursday", D_W/2+125, 215);
  text("Friday", D_W/2+225, 215);
  text("Saturday", D_W/2+325, 215);
  int x = monthLengths[date[1]];
  if(date[1] == 1 && date[2]%4 == 0)x = 29;
  for(int i = shift; i<shift+x; i++){
   selRect(D_W/2-300+(i%7)*100,225+(i/7)*100,100,100);
   fill(0,0,0);
   text((i+1-shift)+"", D_W/2-295+(i%7)*100, 250+(i/7)*100);
   //text(loadedDays[i-shift], D_W/2-345+(i%7)*100, 310+(i/7)*100);
  }
 }
  }
}
void keyPressed(){
  if(customDay){
     if(keyCode == RETURN || keyCode == ENTER){
      customDayEntered = true;
  }if(customDay){
    if(customDayName.length()>1 && (keyCode == BACKSPACE || keyCode == DELETE)){
      customDayName = customDayName.substring(0, customDayName.length()-1);
    }
  else{
    customDayName += key;
  }
  }
  }
  if(enterYearBoolean && !startDateEntered){
    if( startDate.length()>=1 && (keyCode == BACKSPACE || keyCode == DELETE)){
     startDate = startDate.substring(0, startDate.length()-1);
    }
  else{
     startDate+= key;
  }
  }
  if(startDateEntered){
    if(startDateEntered && endDate.length()>=1 && (keyCode == BACKSPACE || keyCode == DELETE)){
     endDate = endDate.substring(0, endDate.length()-1);
    }
  else{
     endDate+= key;
  }
  }
 
 if(keyCode == RETURN || keyCode == ENTER){     
    if(startDateEntered){
          enterYearBoolean = false;
          startDateEntered = false;
          titleScreen = false;
      }
       if(enterYearBoolean){
          startDateEntered = true;
      }
  }

}

void mouseClicked() {
  if(titleScreen){
    if(mouseX > 100 && mouseX < 400 && mouseY> 450 && mouseY< 600){
        enterYearBoolean= true;
     }
     else if(mouseX > 700 && mouseX < 1000 && mouseY> 450 && mouseY< 600){
       titleScreen = false;
     }
  }
 
 if(mouseX > 5 && mouseX < 105 && mouseY > 5 && mouseY < 55){
   if(foc.equals("sel")){
   foc = "cal";
   clear();
   return;
   }
   if(foc.equals("cal")){
   foc = "sel";
   clear();
   return;
   }
 }
if(foc.equals("sel")){
 if(mouseX > 650 && mouseX < 750 && mouseY > 100 && mouseY < 150){
   if(isWeekday(date)){
   submitted = 120;
   submit();
   }else{
   println("Date is not a weekday");
   notWeekday = 120;
   }
 }
 if(mouseX > 50 && mouseX < 150 && mouseY > 100 && mouseY < 150){
   dayPressed = !dayPressed;
 }
 if(mouseX > 200 && mouseX < 300 && mouseY > 100 && mouseY < 150){
   monthPressed = !monthPressed;
 }
 if(mouseX > 350 && mouseX < 450 && mouseY > 100 && mouseY < 150){
   yearPressed = !yearPressed;
 }
 if(mouseX > 500 && mouseX < 600 && mouseY > 100 && mouseY < 150){
   schedulePressed = !schedulePressed;
   customDay = false;
 }
 if(yearPressed){
   if(mouseX > 350 && mouseX < 385 && mouseY > 175 && mouseY < 323){
   date[2]=date[2]%10+2000+10*((mouseY-175)/37);
   yearSelec1 = true;
   }
   if(mouseX > 400 && mouseX< 435 && mouseY > 175 && mouseY < 545){
   date[2]=date[2]-date[2]%10+(mouseY-175)/37;
   yearSelec2 = true;
   }
 }
 if(schedulePressed && mouseX > 500 && mouseX < 600 && mouseY > 175 && mouseY < 175+scheduleTypes.length*52){
   if(mouseY>700 && mouseY < 750){
     customDayEntered = false;
     if(customDay == true){
       customDay = false;
     }else{
       customDay = true;
     }
   }
   if(customDay == false){
   scheduleChange = scheduleTypes[(mouseY-175)/52];

   }else{
     scheduleChange = customDayName;
    
   }
   schedulePressed = false;
 }
 if(dayPressed){
   if(mouseX > 50 && mouseX < 85 && mouseY > 175 && mouseY < 323){
   date[0]=date[0]%10+10*((mouseY-175)/37);
   daySelec1 = true;
   }
   if(mouseX > 100 && mouseX< 135 && mouseY > 175 && mouseY < 545){
   date[0]=date[0]-date[0]%10+(mouseY-175)/37-1;
   if(date[0]==-1)date[0] = 0;
   daySelec2 = true;
   }
   if(date[0]>30){
   date[0]=30;
   }
 }
 if(monthPressed && mouseX > 200 && mouseX < 300 && mouseY > 175 && mouseY < 739){
   int monthNum = ((mouseY-175)/47+3)%12;
   if(monthNum>11)monthNum-=12;
   date[1]=monthNum;
   monthPressed = false;
  }
}else if(foc.equals("cal")){
  if(mouseY>=95&&mouseY<=200){
  /*if(mouseX>D_W/2-390&&mouseX<D_W/2-370){*/
 if(mouseX>= 130 && mouseX <=200){
    date[1]--;
    if(date[1]<0){
      date[1] = 11;
      date[2]--;
    }
    if(date[1]!=1||date[2]%4!=0)shift = (shift - monthLengths[date[1]]) % 7;
    else shift = (shift - 29) % 7;
    if(shift<0)shift = shift + 7;
  }
 /* if(mouseX<D_W/2+390&&mouseX>D_W/2+370){*/
    if(mouseX>= 900 && mouseX <=950){
    if(date[1]!=1||date[2]%4!=0)shift = (shift + monthLengths[date[1]]) % 7;
    else shift = (shift + 29) % 7;
    date[1]++;
    if(date[1]>11){
      date[1] = 0;
      date[2]++;
    }
  }
  }
  if(mouseY>=225&&mouseX>=D_W/2-350&&mouseX<=D_W/2+350){
  int day = (mouseY-225)/100*7+(mouseX-D_W/2+350)/100-shift;
  if(day>=0&&(day<monthLengths[date[1]]||(date[1]==1&&date[2]%4==0&&day<29)))date[0] = day;
  foc = "sel";
  }
}
}
boolean submit(){
 if(date[1]!=1||date[2]%4!=0){
   if(date[0]>=monthLengths[date[1]])
   date[0]=monthLengths[date[1]]-1;
 }else{
   if(date[0]>28)
   date[0]=28;
 }
 println(date[2]);
 println(date[0]);
 println(date[1]);
 println(scheduleChange);
 if(!isWeekday(date)){
   return false;
 }
 //schoolYear.set(getDayNumber(),)) change this
 return true;
 // in submit we need to get all of the data from the dropdown menu
}
//////////////////////////////////////////
public boolean isWeekday(int[] datet){
 int dayShift = ((datet[2]-2017)+(datet[2]-2017)/4+datet[0])%7;
 for(int i = 0; i<datet[1]; i++){
  if(i!=1||datet[2]%4!=0)dayShift+=monthLengths[i];
  else dayShift+=29;
  dayShift%=7;
 }
 if(dayShift<0)dayShift+=7;
 if(dayShift!=0&&dayShift!=6)return true;
 else return false;
}
int toInt(int[] day){//Converts date to int
  int retDay = (day[2]-2017)*365+(day[2]-2017)/4+day[0];
  for(int i = 0; i<day[1]; i++){
  if(i!=1||day[2]%4!=0)retDay+=monthLengths[i];
  else retDay+=29;
  }
  return retDay+1;
}
int[] toDate(int num){//Converts int to date
  int leapCount = 1;
  int[] day = {0,0,2017};
  while(num>=365||(leapCount==0&&num>=366)){
  if(leapCount==1){
    num-=366;
  }else{
    num-=365;
  }
  day[2]++;
  leapCount++;
  leapCount%=4;
  }
  int checkMonth = 0;
  while(num>monthLengths[checkMonth]||(checkMonth==1&&day[2]%4==0&&num>29)){
  num-=monthLengths[checkMonth];
  day[1]++;
  checkMonth++;
  }
  day[0]=num;
  return day;
}