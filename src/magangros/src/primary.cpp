#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "turtlesim/Pose.h"
#include "magangros/PosisiTurtle.h"
#include <iostream>

magangros::PosisiTurtle posisiTurtle;

void posisiCallback(const turtlesim::Pose::ConstPtr& posisi)
{
    posisiTurtle.x = posisi->x;
    posisiTurtle.y = posisi->y;
    ROS_INFO("Posisi turtle kiriman akhir: x=%f, y=%f", posisiTurtle.x, posisiTurtle.y);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "primary");
    ros::NodeHandle n;
    ros::Publisher pubGerak = n.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 1);
    ros::Publisher pubPosisi = n.advertise<magangros::PosisiTurtle>("posisi_turtle", 1);
    ros::Subscriber subPosisi = n.subscribe<turtlesim::Pose>("/turtle1/pose", 1, posisiCallback);

    while (ros::ok()) {
    char perintah;
    std::cin >> perintah;

    geometry_msgs::Twist twist;

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

    pubGerak.publish(twist);
    ros::spinOnce();  
    pubPosisi.publish(posisiTurtle); 
    }  
    return 0;
}
