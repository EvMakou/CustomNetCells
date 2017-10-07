//
//  SecondViewController.h
//  CustomNetCells
//
//  Created by supermacho on 05.10.17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) NSMutableArray* arrayOfGames;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *viewOfActivity;



- (void)loadImageForIndex:(NSInteger)index;

@end
