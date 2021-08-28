#!/bin/bash
sudo yum update -y
sudo su
amazon-linux-extras install docker
service docker start
docker pull caldux/node-on-ec2-example
docker run -d --rm -p 80:80 caldux/node-on-ec2-example