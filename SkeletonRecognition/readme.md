#使用说明
##1.SDK安装
- **win7**以上系统，**VS2010** (高于2010不支持)
- 资料下载：<http://www.k4w.cn/news/1.html>
 + Kinect for Windows SDK 1.8
 + Kinect for Windows developer toolkit 1.8
- 如果电脑上已安装OpenNI，NITE等软件，请先卸载后安装。安装好后如下图：
</br>
</br>
![tempPic](https://github.com/lylalala/kinectForSkeleton/raw/master/SkeletonRecognition/tempPic.png)
</br>

##2.效果
* 可以得到人体20多个关键点的三维坐标
* 下图是转换为二维坐标后的显示
</br>
</br>
![Skeleton](https://github.com/lylalala/kinectForSkeleton/raw/master/SkeletonRecognition/Skeleton.png)
</br>

##3.输出文件
* 输出文件记录关键点的坐标
</br>

| time | position | x1 | y1 | x | y | z |
| -----|:----:| ----:|
| 2837473 | HEAD | 161 | 37 | 0.008273 | 0.492263 | 1.697776|

* 其中x1和y1是处理后的二维坐标，x,y和z是原始三维坐标