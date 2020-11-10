#!/bin/bash
sudo yum install amazon-cloudwatch-agent -y
echo { \"logs\": { \"logs_collected\": { \"files\": { \"collect_list\": [ { \"file_path\": \"\/var\/log\/messages\", \"log_group_name\": \"practikaloggroup\", \"log_stream_name\": \"{instance_id}\" } ] } } }, \"metrics\": { \"append_dimensions\": { \"AutoScalingGroupName\": \"${aws:AutoScalingGroupName}\", \"ImageId\": \"${aws:ImageId}\", \"InstanceId\": \"${aws:InstanceId}\", \"InstanceType\": \"${aws:InstanceType}\" }, \"metrics_collected\": { \"disk\": { \"measurement\": [ \"used_percent\", \"inodes_free\" ], \"metrics_collection_interval\": 60, \"resources\": [ \"*\" ] }, \"mem\": { \"measurement\": [ \"mem_used_percent\" ], \"metrics_collection_interval\": 60 } } } } > ~/config.json
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/root/config.json -s
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start
