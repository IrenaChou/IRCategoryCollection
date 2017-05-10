
#import "UIImage+IREx.h"

@implementation UIImage (IREx)
- (UIImage *)originalImage {
  return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
