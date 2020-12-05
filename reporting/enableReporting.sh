#! /bin/bash

# enableReporting.sh - edit Turbonomic operator yaml file to turn on embedded
# reporting features.
# 
# Copyright (C) 2020, Chris Lowth
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
fi
echo -n ">> "
read in || exit 2
if [ "$in" != "" ]; then
	ip="$in"
fi

echo ""
echo "Enter an Admin Password for the Postgres DB .."
if [ "$adminPass" != "" ]; then
  echo "(default is: '$adminPass')"
fi
echo -n ">> "
read in || exit 2
if [ "$in" != "" ]; then
	adminPass="$in"
fi

echo ""
echo "Enter a User Password for the Postgres DB .."
if [ "$userPass" != "" ]; then
  echo "(default is: '$userPass')"
fi
echo -n ">> "
read in || exit 2
if [ "$in" != "" ]; then
	userPass="$in"
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
