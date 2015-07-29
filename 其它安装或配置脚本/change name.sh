1,rename log txt *.log     #把*.log改为*.txt
2,for i in $(ls .); do mv $i $(echo $i |sed 's/\.bat/\.exe/'); done
3,添加后缀名
find . -type f |xargs -i mv {} {}.txt