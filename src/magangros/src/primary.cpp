#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "turtlesim/Pose.h"
#include "magangros/PosisiTurtle.h"
#include <iostream>
#include <termios.h>
#include <unistd.h>
#include <stdio.h>

magangros::PosisiTurtle posisiTurtle;


//Untuk mengambil input tanpa menekan tombol enter seperti conio.h di windows
int getch() {
    struct termios oldattr, newattr;
    int ch;
    tcgetattr( STDIN_FILENO, &oldattr );
    newattr = oldattr;
    newattr.c_lflag &= ~( ICANON | ECHO );
    tcsetattr( STDIN_FILENO, TCSANOW, &newattr );
    ch = getchar();
    tcsetattr( STDIN_FILENO, TCSANOW, &oldattr );
    return ch;
}

void posisiCallback(const turtlesim::Pose::ConstPtr& posisi)
{
    posisiTurtle.x = posisi->x;
    posisiTurtle.y = posisi->y;
    ROS_INFO("Posisi X: %f, Posisi Y: %f", posisiTurtle.x, posisiTurtle.y);
    ROS_INFO("Kecepatan Linear: %f, Kecepatan Angular: %f", posisi->linear_velocity, posisi->angular_velocity);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "primary");
    ros::NodeHandle n;
    ros::Publisher pubGerak = n.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 1);
    ros::Publisher pubPosisi = n.advertise<magangros::PosisiTurtle>("posisi_turtle", 1);
    ros::Subscriber subPosisi = n.subscribe<turtlesim::Pose>("/turtle1/pose", 1, posisiCallback);

    double areaXMin = 1.333333; //1,3
    double areaXMax = 9.777778; //9,7
    double areaYMin = 6.222222; //6,2
    double areaYMax = 9.777778; //9,7

    double area2XMin = 1.333333; //1,3
    double area2XMax = 9.777778; //9,7
    double area2YMin = 1.333333; //1,3
    double area2YMax = 4.888889; //4,9

    while (ros::ok()) {
    char perintahSebelum='w';
    char perintah = getch();

    geometry_msgs::Twist twist;

    double x = posisiTurtle.x;
    double y = posisiTurtle.y;


       
    if ((x >= areaXMin && x <= areaXMax && y >= areaYMin && y <= areaYMax) ||
        (x >= area2XMin && x <= area2XMax && y >= area2YMin && y <= area2YMax)) {
        ROS_INFO("ERROR");
        //ketika turtle mendeteksi terdapat area terlarang, maka turtle akan melakukan perintah kebalikan
        switch (perintahSebelum)
        {
        case 'w':
            twist.linear.x = -1.0;
            break;
        case 's':
            twist.linear.x = 1.0;
            break;
        case 'a':
            twist.angular.z = -1.0;
            break;
        case 'd':
            twist.angular.z = 1.0;
            break;
        default:
            continue;
        }
    } else{
        perintahSebelum = perintah;

        switch (perintah) {
        case 'w':
            twist.linear.x = 1.0;
            break;
        case 's':
            twist.linear.x = -1.0;
            break;
        case 'a':
            twist.angular.z = 1.0;
            break;
        case 'd':
            twist.angular.z = -1.0;
            break;
        default:
            continue;
        }
    }

    pubGerak.publish(twist);
    ros::spinOnce();  
    pubPosisi.publish(posisiTurtle); 
    }  
    return 0;
}