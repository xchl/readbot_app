# ReadBot

## 介绍

ReadBot是一个RSS阅读器，支持：
1. AI对内容进行摘要，目前是调用ChatGPT，最长支持15K长度内容摘要
2. 自动提取网页正文，支持阅读模式(仿照JS版本的Readability实现了[简化的Dart版本](https://github.com/RosenX/readability))
3. 支持收藏
4. 支持订阅源分组管理
5. 支持按订阅源筛选内容
6. 支持内容同步服务器，定期删除本地缓存

## 目标

ReadBot的目标是能对最近一段时间的内容进行摘要汇总，生成目录，方便阅读。

## 使用技术

- Flutter
