# Tell ls to be colorful
export CLICOLOR=1
export LSCOLORS=ExGxhxDxfxhxhxhxhxcxcx
#export LSCOLORS=GxFxCxDxBxegedabagaced
#export LSCOLORS=Exfxcxdxbxegedabagacad
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export TERM="xterm-color"
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# git branch
function parse_git_branch {
 git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {

local GREEN="\[\033[1;32m\]"
local WGRAY="\[\033[00m\]"

PS1="\u@\h:\w$GREEN\$(parse_git_branch)$WGRAY\$ "
PS2='> '
PS4='+ '
}
proml

# git auto-complete
source $HOME/bin/git-complete/bin/git-completion.bash

# git alias
alias glp='git log --pretty=oneline'

# prevent java process name from appearing on doc
#export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true -Dapple.awt.UIElement=true'
if [ -f ~/.bashrc ]; 
then
   source ~/.bashrc
fi

# ssh to google compute engine
function sshto {
    echo "ssh -i /Users/seoeun/.ssh/google_compute_engine seoeun@$1"
    ssh -i /Users/seoeun/.ssh/google_compute_engine seoeun@$1
}
export -f sshto

# python3 alias
#alias python='python3'

#JAVA_HOME=$(/usr/libexec/java_home)
JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home"
#JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"
APPENGINE_HOME="$HOME/libs/appengine"
#GOOGLE_APPLICATION_CREDENTIALS="$HOME/lezhin/lezhin/gcould-service-key"
M2_HOME="$HOME/tools/maven"
MAVEN_OPTS="-XX:MaxPermSize=256m -Xms512m -Xmx1024m"
GRADLE_HOME="$HOME/tools/gradle"
HADOOP_HOME="/usr/local/hadoop"
SQOOP_HOME="/usr/local/sqoop"
HIVE_HOME="/usr/local/hive"
SPARK_HOME="/usr/local/spark"
OOZIE_HOME="$HOME/libs/oozie"
OOZIE_URL="http://localhost:11000/oozie"
FLUME_HOME="$HOME/libs/flume"
DRUID_HOME="$HOME/libs/druid"
#SCALA_HOME="/usr/local/opt/scala"
GO_HOME="/usr/local/go"

PATH=/usr/local/git/bin:$PATH:$HOME/bin:$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$GRADLE_HOME/bin
PATH=$PATH:$APPENGINE_HOME/bin
PATH=$PATH:$HADOOP_HOME/bin:$HIVE_HOME/bin:$OOZIE_HOME/bin:$GO_HOME/bin:$SQOOP_HOME/bin:$SPARK_HOME/bin
PATH=$PATH:/usr/local/mysql/bin
# aws
#PATH=$PATH:$HOME/Library/Python/3.4/bin
export JAVA_HOME 
export APPENGINE_HOME 
export HADOOP_MAPRED_HOME HIVE_HOME 
export HADOOP_MAPRED_HOME 
#export GOOGLE_APPLICATION_CREDENTIALS 
export ANT_HOME ANT_OPTS M2_HOME MAVEN_OPTS 
export OOZIE_HOME OOZIE_URL
export FLUME_HOME DRUID_HOME
# HADOOP_PREFIX is set in global profile
export PATH
export HADOOP_USER_CLASSPATH_FIRST=true
#export AWS_DEFAULT_PROFILE=appboy-prod
export AWS_DEFAULT_PROFILE=default
export SPARK_PRINT_LAUNCH_COMMAND=1
export WEB_FRONT=/Users/seoeun/mywork/lezhin/web-front

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/seoeun/libs/google-cloud-sdks/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/seoeun/libs/google-cloud-sdks/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/seoeun/libs/google-cloud-sdks/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/seoeun/libs/google-cloud-sdks/google-cloud-sdk/completion.bash.inc'
fi
