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
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)fetchLocation:(id)sender {
    
    [[SNLocationManager shareLocationManager] startUpdatingLocationWithSuccess:^(CLLocation *location, CLPlacemark *placemark) {
        _resultLabel.text = placemark.locality;
    } andFailure:^(CLRegion *region, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
