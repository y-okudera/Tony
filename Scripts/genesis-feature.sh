#!/usr/bin/env sh

today=`date "+%Y/%m/%d"`
current_year=`date "+%Y"`
echo $today
echo $current_year

developer_name="Yuki Okudera"
developer_company="Yuki Okudera"

read -p "new feature scene name to generate. (e.g. SearchRepo): " sceneName
read -p "module name to generate new feature scene for. (e.g. SearchRepoFeatures): " moduleName

# モジュールの存在確認
destination="${PWD}/App/Feature/$moduleName/Sources/Scene"
if [ -d "$destination" ]; then
    swift run -c release --package-path ./Tools/GenesisTool genesis generate Genesis/Feature/template.yml\
    -d "$destination"\
    -o "sceneName: $sceneName, moduleName: $moduleName, date: $today, year: $current_year, developerName: $developer_name, developerCompany: $developer_company"

    echo "${moduleName}モジュールに${sceneName}シーンのソースコードを出力しました\n${destination}/${sceneName}"
else
    swift run -c release --package-path ./Tools/GenesisTool genesis generate Genesis/Feature/template.yml\
    -d Genesis/Feature/output/$moduleName\
    -o "sceneName: $sceneName, moduleName: $moduleName, date: $today, year: $current_year, developerName: $developer_name, developerCompany: $developer_company"

    echo "モジュールが存在しないので、Genesis/Feature/output/${moduleName}/${sceneName}に出力しました"
fi
