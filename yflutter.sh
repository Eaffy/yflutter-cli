#!/usr/bin/env bash

echo "⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇⬇";
echo "创建名为的$1 flutter 工程";
flutter create $1
# 进入工程根目录
cd $1
echo "安装flutter依赖";
flutter pub add cupertino_icons;
flutter pub add shared_preferences;
flutter pub add ios_platform_images;
flutter pub add go_router;
# 到 iOS 目录安装依赖
cd ios/ && pod install;
# 回到根目录
cd ..;
# 从 github 下载模板文件
gcl https://github.com/Eaffy/yflutter-cli.git;
rm -rf lib
mv ../yflutter-cli/lib lib
rm -rf ../yflutter-cli
cd lib
# 修改AppName为工程名
arr=(`echo $1 | tr '_' ' '`)
result=''
for var in ${arr[@]}
do
     firstLetter=`echo ${var:0:1} | awk '{print toupper($0)}'`
     echo $firstLetter
     otherLetter=${var:1}
     echo $otherLetter
     result=$result$firstLetter$otherLetter
     echo $result
done
appName=result
sed -i '' "s/AppName/$appName/g" main.dart
echo "⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆⬆"
