#!/usr/bin/env sh

today=`date "+%Y/%m/%d"`
current_year=`date "+%Y"`
echo $today
echo $current_year

developer_name="Yuki Okudera"
developer_company="Yuki Okudera"

read -p "target feature name. (e.g. SearchRepoFeatures): " featureName
read -p "sandbox initial scene name. (e.g. SearchRepo): " sceneName

sandboxName="${featureName}Sandbox"

# サンドボックスアプリの存在確認
destination="${PWD}/App/Sandbox/${sandboxName}/Sources"

echo "dest ${destination}"

if [ -d "$destination" ]; then
    echo "${sandboxName}は既に存在します\n${destination}"
else
    mkdir -p $destination

    swift run -c release --package-path ./Tools/GenesisTool genesis generate Genesis/Sandbox/template.yml\
    -d "$destination"\
    -o "featureName: $featureName, sceneName: $sceneName, date: $today, year: $current_year, developerName: $developer_name, developerCompany: $developer_company"

    cp -r ./Genesis/Sandbox/Templates/Resources ./App/Sandbox/${sandboxName}/Sources/Resources

    echo "サンドボックスアプリを生成しました\n${destination}"
fi
