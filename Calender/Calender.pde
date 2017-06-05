 String foc = "Null";
 long serialVersionUID = 1L;
 
String[] monthNames = {"January", "February","March","April","May","June","July","August","September","October","November","December"};
 
int[] monthLengths = {31,28,31,30,31,30,31,31,30,31,30,31};
int D_W = 1000;
int D_H = 800;
  class Schedule{
    String displayType;
    int[] startTimes, endTimes;
    String[] periodNames;
  
    Schedule(String type){
   if(type.equals("Normal")){
    displayType = "Normal";
    periodNames = new String[]{"1","2","Assembly","3","4a","4b","4c","5","6"};
    startTimes = new int[]{815,910,1005,1035,1150,1225,1245,1320,1415};
    endTimes = new int[]{905,1000,1030,1145,1220,1240,1315,1410,1500};
   }
  }
 }
Schedule[] loadedDays;
 
 int day, month, year, shift = 0;
 String[] archTypes = {"Normal","CUP day","PM Assembly"};

//private static final int[] monthLengths = {31,28,31,30,31,30,31,31,30,31,30,31};
 
 public boolean isWeekday(int[] date){
  int dayShift = ((date[2]-2017)+(date[2]-2017)/4+date[0])%7;
  for(int i = 0; i<date[1]; i++){
   if(i!=1||date[2]%4!=0)dayShift+=monthLengths[i];
   else dayShift+=29;
  }
  if(dayShift<0)dayShift+=7;
  if(dayShift>0&&dayShift<6)return true;
  else return false;
 }
//////////////////////////////////////////
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.Time;
import java.util.Date;
//import javax.swin JFrame;
//import javax.swin JPanel;
//public class Start extends JPanel{
 

 
void setup(){
 
  size(1000, 1000);
  //Get Date
  day = 0;
  month = 0;
  year = 2017;
  shift = ((year-2017)+(year-2017)/4)%7;
  
  if(shift<0)shift+=7;
  loadedDays = loadSchedules();}
 // addMouseListener(new MouseListener(){
   @Override
  void mouseClicked(){
    int x = mouseX;
    int y = mouseY;
    if(foc.equals("Day")){
     
    }
    if(foc.equals("Null")){
     if(y>=150&&y<=250){
      if(x>D_W/2-390&&x<D_W/2-370){
       month--;
       if(month<0){
        month = 11;
        year--;
       }
       if(month!=1||year%4!=0)shift = (shift - monthLengths[month]) % 7;
       else shift = (shift - 29) % 7;
       if(shift<0)shift = shift + 7;
      }
      if(x<D_W/2+390&&x>D_W/2+370){
       if(month!=1||year%4!=0)shift = (shift + monthLengths[month]) % 7;
       else shift = (shift + 29) % 7;
       month++;
       if(month>11){
        month = 0;
        year++;
       }
      }
     }else if(y>=275&&y<=775&&x>=D_W/2-350&&x<=D_W/2+350){
      day = (y-275)/100*7+(x-D_W/2+350)/100-shift;
      //if(day>=0&&(day<monthLengths[month]||(month==1&&year%4==0&&day<29)))foc = "Day";
     }
    }else if(foc.equals("Switch")){
     
    }
    //repaint();
   }
 
   /*
   @Override
   public void mouseEntered(MouseEvent arg0) {}
   @Override
   public void mouseExited(MouseEvent arg0) {}
   @Override
   public void mousePressed(MouseEvent arg0) {}
   @Override
   public void mouseReleased(MouseEvent arg0) {}
  });
  repaint();
  */

 
  Schedule[] loadSchedules() {
  Schedule[] sched = new Schedule[31];
  for(int i = 0; i<31; i++){
   sched[i] = new Schedule("Normal");
  }
  return sched;
 }
 @Override
 /*public Dimension getPreferredSize() {
  return new Dimension(D_W, D_H);
 }*/
 void draw(){
 //@Override
 //protected void paintComponent(Graphics g) {
  //super.paintComponent(g);
  //fill(0, 0, 0);
  switch(foc){
  case "Day":
  case "Null":
 fill(0, 0, 0);
    line(D_W/2-390, 200, D_W/2-370, 150);
    line(D_W/2-390, 200, D_W/2-370, 250);
    line(D_W/2+390, 200, D_W/2+370, 150);
    line(D_W/2+390, 200, D_W/2+370, 250);
    fill(255, 255, 255);
    rect(D_W/2-350, 150, 700, 100);
    rect(D_W/2-350, 250, 700, 25);
    rect(D_W/2-350, 275, 700, 500);
    fill(0, 0, 0);
    text(year+"", D_W/2-45, 175);
     text(monthNames[month], D_W/2-50, 200);
    line(D_W/2-350, 375, D_W/2+350, 375);
    line(D_W/2-350, 475, D_W/2+350, 475);
    line(D_W/2-350, 575, D_W/2+350, 575);
    line(D_W/2-350, 675, D_W/2+350, 675);
   if(/**/true){
    for(int i = 1; i<7; i++) line(D_W/2-350+100*i, 250, D_W/2-350+100*i, 775);
   }
   else for(int i = 1; i<7; i++) line(D_W/2-350+100*i, 250, D_W/2-350+100*i, 775);
     text("Sunday", D_W/2-325, 265);
     text("Monday", D_W/2-225, 265);
     text("Tuesday", D_W/2-125, 265);
     text("Wednsday", D_W/2-25, 265);
     text("Thursday", D_W/2+75, 265);
     text("Friday", D_W/2+175, 265);
     text("Saturday", D_W/2+275, 265);
   int x = monthLengths[month];
   if(month == 1 && year%4 == 0)x = 29;
   for(int i = shift; i<shift+x; i++){
      text((i+1-shift)+"", D_W/2-345+(i%7)*100, 300+(i/7)*100);
      text(loadedDays[i-shift].displayType, D_W/2-345+(i%7)*100, 310+(i/7)*100);
   }
   if(foc.equals("Day")){
     fill(255, 255, 255);
     rect(D_W/2-345+((day+shift)%7)*100, 300+((day+shift)/7)*100, 75, archTypes.length*25);
     rect(D_W/2-345+((day+shift)%7)*100, 300+((day+shift)/7)*100, 75, archTypes.length*25);
    for(int i = 0; i<archTypes.length; i++){
       text(archTypes[i], D_W/2-345+((day+shift)%7)*100, 310+((day+shift)/7)*100+25*i);
    }
   }
   break;
  }
 }
/*void main(String[] args) {
  JFrame fr = new JFrame();
  Start pan = new Start();
  pan.setBackground(Color.WHITE);
  fr.add(pan);
  fr.pack();
  fr.setVisible(true);
  
 }
 */