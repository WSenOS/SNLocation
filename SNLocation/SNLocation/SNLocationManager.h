//
//  SNLocationManager.h
//  wrongTopic
//
//  Created by wangsen on 16/1/16.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#warning plist文件中添加
/*
 * NSLocationAlwaysUsageDescription String 应用程序始终使用定位服务
 * NSLocationWhenInUseUsageDescription String 使用应用程序期间，可以使用定位服务
 */

//定位
typedef void(^UpdateLocationSuccessBlock) (CLLocation * location, CLPlacemark * placemark);
typedef void(^UpdateLocationErrorBlock) (CLRegion * region, NSError * error);
//地理编码:地名—>经纬度坐标
typedef void(^GeocodeSuccessBlock) (CLLocation * location, CLPlacemark * placmark, NSString * geocodingAddressName);
typedef void(^GeocodeFailureBlock) (NSError * error);
//反地理编码:经纬度坐标—>地名
typedef void(^RegeocodeSuccessBlock) (CLLocation * regeocodeLocation, CLPlacemark * placmark);
typedef void(^RegeocodeFailureBlock) (NSError * error);

@interface SNLocationManager : NSObject

+ (instancetype)shareLocationManager;

/*
 * isAlwaysUse  是否后台定位 持续定位（NSLocationAlwaysUsageDescription）
 */
@property (nonatomic, assign) BOOL isAlwaysUse;
/*
 * isRealTime 是否实时定位
 */
@property (nonatomic, assign) BOOL isRealTime;
/*
 * 精度 默认 kCLLocationAccuracyKilometer
 */
@property (nonatomic, assign) CGFloat desiredAccuracy;
/*
 * 更新距离 默认1000米
 */
@property (nonatomic, assign) CGFloat distanceFilter;


//开始定位
- (void)sn_startUpdatingLocationWithSuccess:(UpdateLocationSuccessBlock)success andFailure:(UpdateLocationErrorBlock)error;

//根据地址得到经纬度
- (void)sn_geocodeAddress:(NSString *)address andSuccess:(GeocodeSuccessBlock)success andFailure:(GeocodeFailureBlock)failure;

//根据经纬度得到地址 39.90498900,+116.40528500
- (void)sn_regeocodeLocation:(CLLocation *)location andSuccess:(RegeocodeSuccessBlock)success andFailure:(RegeocodeFailureBlock)failure;

@end
