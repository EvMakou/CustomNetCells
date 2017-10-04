//
//  ViewController.m
//  CustomNetCells
//
//  Created by supermacho on 04.10.17.
//  Copyright © 2017 student. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *url1=@"https://it-here.ru/wp-content/uploads/2017/06/iOS-11-Wallpaper-576x1024.jpg";
    [self.imageWall setImageWithURL:[NSURL URLWithString:url1]];
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(blink) userInfo:nil repeats:YES];
}
- (void)blink {
    
    [self.tap setHidden:(!self.tap.hidden)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
