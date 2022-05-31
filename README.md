# zerotier_planet

#### 介绍
全自动安装zerotier做为planet的脚本

redhat系列安装 例如centos如下脚本
zertotier_planet.sh
ubuntu系列 例如debain执行如下脚本
zertotier_planet_debain.sh

执行成功后 找到脚本同一目录下的文件 planet
替换客户端的planet 
重启客户端或者重启机器
加入 id 
然后ztncui登录刷新授权。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。

**配置文件**  
Linux配置文件 /var/lib/zerotier-one/  
Windows 下缺省在 `C:\ProgramData\ZeroTier\One\`  

**卸载：**  
删除ztncui  
rpm -e ztncui-0.8.7-1.x86_64  
删除zerotier-one服务  
sudo rpm -e zerotier-one  
删除zerotier-one文件夹，该文件夹存储了address地址，删除后再次安装会获得新的address地址  
sudo rm -rf /var/lib/zerotier-one/  
