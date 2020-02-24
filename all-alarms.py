#!/usr/bin/python36
import boto3
import time
client = boto3.client('cloudwatch')

# Gets all the Alarms in the region where this code is executed
# i.e Run this code on an instance in us-east-1, it will return all the alarms from us-east-1
response = client.describe_alarms()

# Get just the names of the Alarms
names = [alarm['AlarmName'] for alarm in response['MetricAlarms']]

# Send an CloudWatch API call to disable all the actions of the provided Alarm Names
# Return the result of the 'disable all alarm actions' API Call
# HTTPStatusCode': 200 = The disable all alarm actions API Call was successful!
#disable_resp = client.disable_alarm_actions(AlarmNames=names)
#print(disable_resp)


# To re-enable your CloudWatch Alarms, comment out the above 'disable_resp' 'print(disable_resp)'
# Then uncomment the below lines and if HTTPStatusCode' returns 200 then the enable all alarm actions API Call was successful!
enable_resp = client.enable_alarm_actions(AlarmNames=names)
print(enable_resp)
