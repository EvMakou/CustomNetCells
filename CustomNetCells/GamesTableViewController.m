//
//  GamesTableViewController.m
//  CustomNetCells
//
//  Created by supermacho on 04.10.17.
//  Copyright © 2017 student. All rights reserved.
//

#import "GamesTableViewController.h"
#import "Game.h"
#import "GameTableViewCell.h"
#import "UIImageView+AFNetworking.h"
@interface GamesTableViewController ()

@end

@implementation GamesTableViewController
@synthesize arrayOfGames;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfGames = [[NSMutableArray alloc]init];//[NSMutableArray arrayWithCapacity:5];
    
    
    
    Game* game = [[Game alloc]init];
    
    game = [[Game alloc]init];
    game.title = @"Flower type 1";
    
    game.poster = @"https://st2.depositphotos.com/4341251/6490/i/950/depositphotos_64906463-stock-photo-beautiful-flowers-background.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Flower type 2";
    
    game.poster = @"https://img1.goodfon.ru/wallpaper/big/2/a3/romashki-cvety-cvetok-buket-4109.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Flower type 3";
    
    game.poster = @"https://www.7flowers.ru/upload/images/catalogcategory/1/cache/1_353x236_image_58b81ed2e7925.png";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Flower type 4";
   
    game.poster = @"https://www.wmj.ru/imgs/2016/12/05/09/933634/7c5874a085ca4bc20eaf7c32cd65743ac0b131d0.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Flower type 5";
   
    game.poster = @"https://st2.depositphotos.com/1000848/7024/i/450/depositphotos_70243831-stock-photo-abstract-background-of-flowers.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Flower type 6";
   
    game.poster = @"https://previews.123rf.com/images/serezniy/serezniy1208/serezniy120806093/15009127-beautiful-bouquet-of-bright-wildflowers-in-basket-isolated-on-white-Stock-Photo.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Flower type 7";
   
    game.poster = @"https://flowers.ua/images/Flowers/zoom/1/0/1461.jpg";
    [self.arrayOfGames addObject:game];
    
    [self.activity startAnimating];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [arrayOfGames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellID = @"GameCell";
    
    GameTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[GameTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        NSLog(@"cell created");
    }else {
        NSLog(@"cell reused");
    }
    
    
    Game* game = (self.arrayOfGames)[indexPath.row];
    NSString *dataUrl = game.poster;
    NSURL *url = [NSURL URLWithString:dataUrl];
    
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                                  UIImage *tmpImage = [[UIImage alloc] initWithData:data];
                                                  //image.image = tmpImage;
                                                  cell.imgPoster.image = tmpImage;
                                              }];
                                              
                                          }];
    
    
    [downloadTask resume];

    
    
    cell.imgPoster.contentMode = UIViewContentModeCenter;
    cell.lblTitle.text = [NSString stringWithFormat:@"Flower type %ld", indexPath.row + 1];
    cell.lblTitle.textColor = [UIColor colorWithRed:214.0/255.0 green:57.0/255.0 blue:19.0/255.0 alpha:1.0];
//    cell.lblYear.text = game.year;
    
    
    
    
    cell.imgPoster.layer.cornerRadius = 20;
    cell.imgPoster.layer.masksToBounds = YES;
    cell.imgPoster.layer.borderWidth = 0;
    cell.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
