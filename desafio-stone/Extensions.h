//
//  NSObject_Extensions.h
//  desafio-stone
//
//  Created by Lucas M Soares on 09/05/16.
//  Copyright © 2016 Lucas M Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <YLGIFImage/YLImageView.h>
#import <YLGIFImage/YLGIFImage.h>

@interface UIColor (ColorFromHex)

- (UIColor *)colorFromHex:(NSString *)hexString;

@end

@implementation UIColor (ColorFromHex)

- (UIColor *)colorFromHex:(NSString *)hexString; {
    
    @try {
        
        NSString *sRed = [hexString substringWithRange:NSMakeRange(1, 2)];
        NSString *sGreen = [hexString substringWithRange:NSMakeRange(3, 2)];
        NSString *sBlue = [hexString substringWithRange:NSMakeRange(5, 2)];
        
        unsigned long long iRed = (UInt64)strtoull([sRed UTF8String], NULL, 16);
        unsigned long long iGreen = (UInt64)strtoull([sGreen UTF8String], NULL, 16);
        unsigned long long iBlue = (UInt64)strtoull([sBlue UTF8String], NULL, 16);
        
        UIColor *color = [UIColor colorWithRed: iRed / 255.0f
                                         green: iGreen / 255.0f
                                          blue: iBlue / 255.0f alpha:1];
        return color;
    }
    @catch (NSException * e) {
        
        NSLog(@"Valores incorretos foram passados para o método getColorFromHexString.\nExemplo: '#A1B2C3'");
        
        return [UIColor blackColor];
    }
}

@end

@interface UIView (LoadingView)

@property (nonatomic, strong) UIView *loadingView;

- (void)addLoading;
- (void)removeLoading;

@end

static void *loadingViewPropertyKey = &loadingViewPropertyKey;

@implementation UIView (LoadingView)

- (UIView *)loadingView {

    return objc_getAssociatedObject(self, loadingViewPropertyKey);
}

- (void)setLoadingView:(UIView *)loadingView {
    
    objc_setAssociatedObject(self, loadingViewPropertyKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addLoading {
    
    self.loadingView = [[UIView alloc] init];
    self.loadingView.frame = self.frame;
    self.loadingView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
    
    int size = 150;
    int x = self.frame.size.width/ 2 - size / 2;
    int y = self.frame.size.height/ 2 - size / 2;
    
    YLImageView *imageView = [[YLImageView alloc] initWithFrame:CGRectMake(x, y, size, size)];
    imageView.image = [YLGIFImage imageNamed:@"pikachu.gif"];
    
    [self.loadingView addSubview:imageView];
    [self addSubview:self.loadingView];
}

- (void)removeLoading {

    [self.loadingView removeFromSuperview];
}

@end

@interface UIImage (ImageWithSize)

- (UIImage *)imageWithSize:(UIImage *)image scaledToSize:(CGSize)newSize;

@end

@implementation UIImage (ColorFromHex)

- (UIImage *)imageWithSize:(UIImage *)image scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
