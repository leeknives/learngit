1,rename log txt *.log     #��*.log��Ϊ*.txt
2,for i in $(ls .); do mv $i $(echo $i |sed 's/\.bat/\.exe/'); done
3,��Ӻ�׺��
find . -type f |xargs -i mv {} {}.txt