#!/usr/bin/env sh

today=`date "+%Y/%m/%d"`
current_year=`date "+%Y"`
echo $today
echo $current_year

developer_name="Yuki Okudera"
developer_company="Yuki Okudera"

swift run -c release --package-path ./Tools/GenesisTool genesis generate Genesis/Feature/template.yml\
  -d Genesis/Feature/output/\
  -o "date: $today, year: $current_year, developerName: $developer_name, developerCompany: $developer_company"
