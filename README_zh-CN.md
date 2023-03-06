# HTPM for ComputerCraft: Tweaked
 <p align="center"><a><img src="https://tweaked.cc/pack.png" /></a></p>
 
本项目是为 Minecraft mod ComputerCraft: Tweaked 设计的操作系统之一，属于接触开发的早期版本。

当前版本：[`v0.1.83.10598`](#v018310598)，详见[更新日志](#更新日志)。
 

## 安装教程
 首先，你需要在游戏中放置并注册(Label)一台电脑。这台电脑将用于安装该系统。
 
 ### 安装条件
  你的电脑应该连接着一个 5×3 的显示屏，并在顶部放置调制调解器。
  > _这些要求可能会在后续版本进行改动，特别是屏幕分辨率要求。_
  
 ### 安装步骤
 
 你可以通过在终端中输入 `id` 来查看电脑的编号。
 
 ComputerCraft 的电脑内部存储在：
 `.minecraft\saves\[worldname]\computercraft\computer\[id]\`
 
 若开启了版本隔离，则是：
 `.minecraft\versions\[gamename]\saves\[worldname]\computercraft\computer\[id]\`
 
 > 其中`worldname`是你的存档名称，`gamename`是你的游戏版本名称，`id`是你查询到的电脑的id。
 
 如果没有该文件夹，可以通过在游戏中电脑上创建一个文件并保存，或者你可以手动创建该文件夹。

 只需将本项目 `computer` 中的内容复制到上述目录中即可。

 暂时不支持模组内部的 `wget`。可能会在2.0后支持。
 
## 更新日志
 ### `v0.1.83.10598`
 - 最初版本。
 - 修改了启动画面逻辑，现在不是阻塞性加载，而是在加载过程中调用更新。
 - 修改加载进度条由等号改为上色。
 - 现在加载过程中的错误会显示到屏幕上。

### `v0.1.85.10610`
 - 修改了启动时配置的加载逻辑，现在会优先加载显示器。
 - 现在支持将日志输出到文件一份。
 