# IRCategoryCollection
整合category

此库只是整合Category，方便多个项目重复使用
有些category是由其它作者提供的，由于时间过长，有些原文链接已经找不到了，

原文链接：
**UIButton+IRImageTitleSpacing**： https://github.com/mokong/MKButtonStyle
*原文名字叫 UIButton+ImageTitleSpacing* 为了避免重复发生，添加了IR前缀


大致包括如下：

NSString
---
**字符串【NSString】**：
* 【 **IRVerify** 】验证
* 【 **IRDate** 】日期转换
* 【 **IRPinYin** 】转换成拼音
* 【 **IRTrans** 】与十六进制和Ascii转换

**IRVerify验证主要包括如下验证**：
* 身份证合法性
* 手机号的合法性
* 银行卡号的合法性
* 数字字符串是否为整数
* 数字字符串是否为浮点型
* 金额的合法性【保留两位小数】


UIButton
---
**UIButton**：
* 【 **IRImageTitleSpacing** 】设置button的titleLabel和imageView的布局样式，及间距

NSDictionary/NSArray
---
**NSDictionary/NSArray**：
* 【 **IRLOG** 】控制台打印中文

UIColor
---
**UIColor**：
* 【 **IRExtend** 】十六进制的颜色值转为objective-c的颜色

UIView
---
**UIView**：
* 【 **IRLayoutMethods** 】

**UIViewController**：
* 【 **IRNavigationBarBackgrounTransparent** 】状态栏是否显示背景色

UIImage
---
**UIImage**：
* 【 **IREx** 】[去除图片渲染效果](http://irenachou.github.io/2016/09/21/16-09-21-imageWithRenderingMode/)
* 【 **IRQRCode** 】通过二维码字符串生成可扫描的二维码图片，[具体详情](http://irenachou.github.io/2016/11/08/16-11-08-qrcodecreate/)
* 【 **IRGradientColor** 】通过颜色及渐变方向生成渐变图片，[具体使用](http://irenachou.github.io/2016/03/01/gradientColor/)


NSDate
---
**NSDate**：
* 【 **IRString** 】获取当天日期字符串【2017-06-13】


IRQuicklyCreated
---
**UILabel**：
* 【 **label_textWhite_Center_WithText** 】创建文本为白色居中的Label
