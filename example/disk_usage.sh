IP=$(hostname -I);
HOSTNAME=$(hostname);
LIMIT=85;
#SLACK_URL=XXXXXX
SLACK_URL=XXXXXX

root_disk_used=$(df / | grep ^/ | awk '{print $5}');
root_disk_used=${root_disk_used::-1};
test $LIMIT -lt $root_disk_used && curl -X POST --data-urlencode "payload={\"channel\": \"#svc_metatron_infra_monitoring\", \"username\": \"waug_watch\", \"text\": \"Usage of disk is in danger. IP: $IP($HOSTNAME) ROOT_DISK_USAGE: $root_disk_used % <https://ap-northeast-2.console.aws.amazon.com/ec2/v2/home?region=ap-northeast-2#Instances:search=$IP |Click here to go AWS EC2 Instance > \", \"icon_emoji\": \":sunrise:\"}" $SLACK_URL;

mount_disk_used=$(df /hadoop | grep ^/ | awk '{print $5}');
mount_disk_used=${mount_disk_used::-1};
test -z $mount_disk_used || test $LIMIT -lt $mount_disk_used && curl -X POST --data-urlencode "payload={\"channel\": \"#svc_metatron_infra_monitoring\", \"username\": \"waug_watch\", \"text\": \"Usage of disk is in danger. IP: $IP($HOSTNAME) MOUNT_DISK_USAGE: $mount_disk_used % <https://ap-northeast-2.console.aws.amazon.com/ec2/v2/home?region=ap-northeast-2#Instances:search=$IP |Click here to go AWS EC2 Instance > \", \"icon_emoji\": \":sunrise:\"}" $SLACK_URL;
