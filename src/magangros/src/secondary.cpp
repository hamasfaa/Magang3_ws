#include <opencv2/opencv.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "ros/ros.h"
#include "magangros/PosisiTurtle.h"
#include <iostream>
#include <vector>

using namespace cv;

std::vector<Vec2f> posisiTurtle;

void callback(const magangros::PosisiTurtle::ConstPtr& posisi) {
    posisiTurtle.push_back(Vec2f(posisi->x, posisi->y));
    ROS_INFO("Posisi turtle akhir diterima: x=%f, y=%f", posisi->x, posisi->y);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "secondary");
    ros::NodeHandle n;
    ros::Subscriber subPosisi = n.subscribe<magangros::PosisiTurtle>("posisi_turtle", 1, callback);

    while (ros::ok()) {
        std::string path = "/home/hamasfa/Magang3_ws/src/magangros/Bahan/arena_robot.png";
        Mat maskBlock;
        Mat img = imread(path);
        cvtColor(img, maskBlock, COLOR_BGR2HSV);
        inRange(maskBlock, Scalar(0, 30, 255), Scalar(255, 255, 255), maskBlock);

        std::vector<std::vector<Point>> contours;
        findContours(maskBlock, contours, RETR_EXTERNAL, CHAIN_APPROX_SIMPLE);

        ros::spinOnce();

        if (posisiTurtle.size() > 1) {
            Rect area = boundingRect(contours[0]);
            Rect area2 = boundingRect(contours[1]);
            for (int i = 1; i < posisiTurtle.size(); i++) {
                Point titik1 (posisiTurtle[i-1][0] * 45.0, img.rows - posisiTurtle[i-1][1] * 45.0);
                Point titik2 (posisiTurtle[i][0] * 45.0, img.rows - posisiTurtle[i][1] * 45.0);
                if(titik1.inside(area) || titik2.inside(area) || titik1.inside(area2) || titik2.inside(area2)){
                    continue;
                } else{
                    line(img, titik1, titik2, Scalar(0, 0, 255), 2);
                }
            }
        }

        imshow("Gambar", img);
        waitKey(10);
    }

    return 0;
}
