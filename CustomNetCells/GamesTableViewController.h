//
//  GamesTableViewController.h
//  CustomNetCells
//
//  Created by supermacho on 04.10.17.
//  Copyright © 2017 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamesTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) NSMutableArray* arrayOfGames;
//@property (weak, nonatomic) IBOutlet UIImageView *imageGame;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;



@end
