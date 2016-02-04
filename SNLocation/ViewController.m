//
//  ViewController.m
//  SNLocation
//
//  Created by wangsen on 16/1/16.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "ViewController.h"
#import "SNLocationManager.h"
@interface ViewController ()
@property (nonatomic, weak) IBOutlet UILabel * resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //地址获取经纬度
    [[SNLocationManager shareLocationManager] sn_geocodeAddress:@"北京市" andSuccess:^(CLLocation *location, CLPlacemark *placmark, NSString *geocodingAddressName) {
        NSLog(@"%@",location);
    } andFailure:^(NSError *error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
    //经纬度获取地址
    //39.90498900,+116.40528500
    CLLocationCoordinate2D coor = CLLocationCoordinate2DMake(39.90498900, 116.40528500);
    CLLocation * location = [[CLLocation alloc] initWithLatitude:coor.latitude longitude:coor.longitude];
    [[SNLocationManager shareLocationManager] sn_regeocodeLocation:location andSuccess:^(CLLocation *regeocodeLocation, CLPlacemark *placmark) {
        NSLog(@"%@",placmark.locality);
    } andFailure:^(NSError *error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}

- (IBAction)fetchLocation:(id)sender {
    //定位
    [[SNLocationManager shareLocationManager] sn_startUpdatingLocationWithSuccess:^(CLLocation *location, CLPlacemark *placemark) {
        _resultLabel.text = placemark.locality;
    } andFailure:^(CLRegion *region, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
