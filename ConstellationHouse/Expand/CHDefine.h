//
//  CHDefine.h
//  ConstellationHouse
//
//  Created by shuni on 2018/8/6.
//  Copyright © 2018年 shuni. All rights reserved.
//

#ifndef CHDefine_h
#define CHDefine_h

/**
 *  极光推送Key
 */
#define kJPushAppKey @"91445ad5c26e6c03e298ab1c"

/**
 *  强弱对象引用
 */
#define WEAKSELF __weak typeof(self) weakSelf = self;
#define STRONGSELF __strong typeof(weakSelf) strongSelf = weakSelf;

/**
 *  模式：测试 true，上线 false
 */
#define DEBUG_MODE false

#if (DEBUG_MODE)
#define DebugLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DebugLog( s, ... )
#endif

#define DebugLogFUNC DebugLog(@"%s",__FUNCTION__)

/**
 *  单例
 */
//单例声明
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;
//单例实现
#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

/**
 *  Standard UserDefaults
 */
#define kStandardUserDefaults                   [NSUserDefaults standardUserDefaults]
#define kStandardUserDefaultsObject(_KEY)       [kStandardUserDefaults objectForKey:_KEY]
#define kSaveStandardUserDefaults(_O,_K)        [kStandardUserDefaults setObject:_O forKey:_K]
#define kRemoveStandardUserDefaults(_K)         [kStandardUserDefaults removeObjectForKey:_K]
#define kStandardUserDefaultsSync               [kStandardUserDefaults synchronize]

/**
 *  UIColor
 */

#define kColorWithRGB(_R,_G,_B)                 ((UIColor *)[UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:1.0])
#define kColorWithRGBA(_R,_G,_B,_A)             ((UIColor *)[UIColor colorWithRed:_R/255.0 green:_G/255.0 blue:_B/255.0 alpha:_A])
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbValue, _A) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:_A]

/**
 *  Screen size
 */
#define kScreenWidth                            [UIScreen mainScreen].bounds.size.width
#define kScreenHeight                           [UIScreen mainScreen].bounds.size.height
#define kNAVPortraitStatusHeight                [UIApplication sharedApplication].statusBarFrame.size.height //状态栏高度

/**
 *  App info
 */
#define kAppDisplayName                         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define kAppVersion                             [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define kAppIdentifier                          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]
#define kAppBuildVersion                        [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]

#endif /* CHDefine_h */
