
#import "UIImage+IREx.h"

@implementation UIImage (IREx)
- (UIImage *)originalImage {
  return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+(UIImage *)originalImageWithName:(NSString *)name
{
    //ios7
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0) {
        return [[self imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else
    {
        return [self imageNamed:name];
    }
}

+(UIImage *)resizedImage:(NSString *)name
{
    return [self resizedImage:name leftScale:0.5 topScale:0.5];
}

+(UIImage *)resizedImage:(NSString *)name leftScale:(CGFloat)leftScale topScale:(CGFloat)topScale
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*leftScale topCapHeight:image.size.height*topScale];
}

+( UIImage *)getEllipseImageWithImage:( UIImage *)originImage
{
    CGFloat padding = 5 ; // 圆形图像距离图像的边距
    
    UIColor * epsBackColor = [ UIColor clearColor]; // 图像的背景色
    
    CGSize originsize = originImage. size ;
    
    CGRect originRect = CGRectMake ( 0 , 0 , originsize. width , originsize. height );
    
    UIGraphicsBeginImageContext (originsize);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext ();
    
    // 目标区域。
    
    CGRect desRect =  CGRectMake (padding, padding,originsize. width -(padding* 2 ), originsize. height -(padding* 2 ));
    
    // 设置填充背景色。
    
    CGContextSetFillColorWithColor (ctx, epsBackColor. CGColor );
    
    UIRectFill (originRect); // 真正的填充
    
    // 设置椭圆变形区域。
    
    CGContextAddEllipseInRect (ctx,desRect);
    
    CGContextClip (ctx); // 截取椭圆区域。
    
    [originImage drawInRect :originRect]; // 将图像画在目标区域。
    
    UIImage * desImage = UIGraphicsGetImageFromCurrentImageContext ();
    
    UIGraphicsEndImageContext ();
    
    return desImage;
    
}

+(CGSize)downloadImageSizeWithURL:(id)imageURL
{
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil)
        return CGSizeZero;
    
//    NSString *absoluteString = URL.absoluteString;
    
#ifdef dispatch_main_sync_safe
    if([[SDImageCache sharedImageCache] diskImageExistsWithKey:absoluteString])
    {
        UIImage* image = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:absoluteString];
        if(!image)
        {
            NSData* data = [[SDImageCache sharedImageCache] performSelector:@selector(diskImageDataBySearchingAllPathsForKey:) withObject:URL.absoluteString];
            image = [UIImage imageWithData:data];
        }
        if(image)
        {
            return image.size;
        }
    }
#endif
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
    NSString* pathExtendsion = [URL.pathExtension lowercaseString];
    
    CGSize size = CGSizeZero;
    if([pathExtendsion isEqualToString:@"png"]){
        size =  [self downloadPNGImageSizeWithRequest:request];
    }
    else if([pathExtendsion isEqual:@"gif"])
    {
        size =  [self downloadGIFImageSizeWithRequest:request];
    }
    else{
        size = [self downloadJPGImageSizeWithRequest:request];
    }
    if(CGSizeEqualToSize(CGSizeZero, size))
    {
        NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
        UIImage* image = [UIImage imageWithData:data];
        if(image)
        {
#ifdef dispatch_main_sync_safe
            [[SDImageCache sharedImageCache] storeImage:image recalculateFromImage:YES imageData:data forKey:URL.absoluteString toDisk:YES];
#endif
            size = image.size;
        }
    }
    return size;
}


+(CGSize)downloadPNGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 8)
    {
        int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        [data getBytes:&w3 range:NSMakeRange(2, 1)];
        [data getBytes:&w4 range:NSMakeRange(3, 1)];
        int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
        int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
        [data getBytes:&h1 range:NSMakeRange(4, 1)];
        [data getBytes:&h2 range:NSMakeRange(5, 1)];
        [data getBytes:&h3 range:NSMakeRange(6, 1)];
        [data getBytes:&h4 range:NSMakeRange(7, 1)];
        int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
+(CGSize)downloadGIFImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(data.length == 4)
    {
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0, 1)];
        [data getBytes:&w2 range:NSMakeRange(1, 1)];
        short w = w1 + (w2 << 8);
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(2, 1)];
        [data getBytes:&h2 range:NSMakeRange(3, 1)];
        short h = h1 + (h2 << 8);
        return CGSizeMake(w, h);
    }
    return CGSizeZero;
}
+(CGSize)downloadJPGImageSizeWithRequest:(NSMutableURLRequest*)request
{
    [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if ([data length] <= 0x58) {
        return CGSizeZero;
    }
    
    if ([data length] < 210) {// 肯定只有一个DQT字段
        short w1 = 0, w2 = 0;
        [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
        [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
        short w = (w1 << 8) + w2;
        short h1 = 0, h2 = 0;
        [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
        [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
        short h = (h1 << 8) + h2;
        return CGSizeMake(w, h);
    } else {
        short word = 0x0;
        [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
        if (word == 0xdb) {
            [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
            if (word == 0xdb) {// 两个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            } else {// 一个DQT字段
                short w1 = 0, w2 = 0;
                [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                short w = (w1 << 8) + w2;
                short h1 = 0, h2 = 0;
                [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                short h = (h1 << 8) + h2;
                return CGSizeMake(w, h);
            }
        } else {
            return CGSizeZero;
        }
    }
}

-(id)diskImageDataBySearchingAllPathsForKey:(id)key{return nil;}


@end
