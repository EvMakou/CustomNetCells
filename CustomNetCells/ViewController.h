//
//  ViewController.h
//  CustomNetCells
//
//  Created by supermacho on 04.10.17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageWall;
@property (weak, nonatomic) IBOutlet UILabel *tap;

@property (strong, nonatomic) NSTimer *timer;
@end

