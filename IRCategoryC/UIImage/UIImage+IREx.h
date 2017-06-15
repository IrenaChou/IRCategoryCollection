

#import <UIKit/UIKit.h>

@interface UIImage (IREx)

- (UIImage *)originalImage;

/**
 返回没有渲染的原始图片

 @param name 文件名
 @return 文件名
 */
+(UIImage *)originalImageWithName:(NSString *)name;


/**
 返回能够自由拉伸不变形的图片

 @param name 文件名
 @return 一个新图片
 */
+(UIImage *)resizedImage:(NSString *)name;


/**
 返回能够自由拉伸不变形的图片

 @param name 返回能够自由拉伸不变形的图片
 @param leftScale 左边需要保护的比例（0~1）
 @param topScale 顶部需要保护的比例（0~1）
 @return 一个新图片
 */
+(UIImage *)resizedImage:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale;


/**
 返回一个圆形图片

 @param originImage originImage 原始图片
 @return 圆形图片
 */
+( UIImage *)getEllipseImageWithImage:( UIImage *)originImage;


+(CGSize)downloadImageSizeWithURL:(id)imageURL;


@end
