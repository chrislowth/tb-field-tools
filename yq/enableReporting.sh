#! /bin/bash

file="$1"
yq="$HOME/bin/yq"

if [ "$file" = "" ]; then
  echo "Usage: enableReport.sh FILENAME.yaml"
  exit 2
fi

if [ ! -f "$file" ]; then
  echo "File $file not found"
  exit 2
fi

if [ ! -x "$yq" ]; then
  echo "'$yq' not found"
  exit 2
fi

adminPass=$($yq r $file spec.grafana.adminPassword)
if [ "$adminPass" = "" ]; then
  adminPass="postgresAdminPassword"
fi

userPass=$($yq r $file 'spec.grafana."grafana.ini".database.password')
if [ "$userPass" = "" ]; then
  userPass="postgresUserPassword"
fi

ip=$($yq r $file spec.global.externalTimescaleDBIP)
if [ "$ip" = "" ]; then
  ip=$($yq r $file spec.global.externalDbIP)
fi

echo "Enter the Progres server IP address .."
if [ "$ip" != "" ]; then
  echo "(default is: '$ip')"
  echo -n ">> "
  read in || exit 2
  if [ "$in" != "" ]; then
    ip="$in"
  fi
fi

echo ""
echo "Enter an Admin Password for the Postgres DB .."
if [ "$adminPass" != "" ]; then
  echo "(default is: '$adminPass')"
  echo -n ">> "
  read in || exit 2
  if [ "$in" != "" ]; then
    adminPass="$in"
  fi
fi

echo ""
echo "Enter a User Password for the Postgres DB .."
if [ "$userPass" != "" ]; then
  echo "(default is: '$userPass')"
  echo -n ">> "
  read in || exit 2
  if [ "$in" != "" ]; then
    userPass="$in"
  fi
fi

cat <<-END > /tmp/$$.yq
- command: update
  path: spec.reporting.enabled
  value: true
- command: update
  path: spec.timescaledb.enabled
  value: true
- command: update
  path: spec.extractor.enabled
  value: true
- command: update
  path: spec.grafana.enabled
  value: true
- command: update
  path: spec.reporting.enabled
  value: true
- command: update
  path: spec.properties.extractor.grafanaAdminPassword
  value: "$adminPass"
- command: update
  path: spec.grafana.adminPassword
  value: "$adminPass"
- command: update
  path: spec.grafana."grafana.ini".database.password
  value: "$userPass"
- command: update
  path: spec.grafana."grafana.ini".database.type
  value: "postgres"
- command: update
  path: spec.global.externalTimescaleDBIP
  value: "$ip"
END

$yq w -i -s /tmp/$$.yq "$file"

rm -f /tmp/$$.yq
