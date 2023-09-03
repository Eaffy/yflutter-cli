# 将 .yflutter.sh挪到根目录
gitRepoDir="$(pwd)";
shellDir="$gitRepoDir/yflutter.sh";
# 去到根目录
cd ~;
rootDir="$(pwd)";
newShellDir="$rootDir/.yflutter.sh"
echo "gitRepoDir: $gitRepoDir, shellDir:$shellDir, rootDir=$rootDir, newShellDir=$newShellDir";
# 将 .yflutter.sh 移动到根目录,加个.防止被删掉
mv $shellDir $newShellDir;
# .zsh位置
zshPath="$rootDir/.zshrc";
# 将 yflutter 别名添加到.zshrc中，方便使用
cat>>$zshPath<<EOF
# yflutter 别名
alias yflutter="zsh $newShellDir";
EOF
# 删除git文件
rm -rf $gitRepoDir;

source $zshPath;

cd $gitRepoDir;
