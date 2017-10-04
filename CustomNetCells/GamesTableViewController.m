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
    game.title = @"Doom";
    game.year = @"2016";
    game.poster = @"https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTcuEgPvjEZKly4WA4TAKGDQzVauJbxbRAyL3UZVASj8B6XQcrta8D6MFy5BP5AsGi0EVieHqYwGQC0Ipum1w2j62RWySrjDZmlruA8HHbOfH.B5c5SXxO5k0DRgoUt15TueuIlm5xT9m6wL4RM2yEiiUDIhBL9N4m4wnSL.wwPDS0-&w=200&h=300&format=jpg";
    
    [self.arrayOfGames addObject:game];
    game = [[Game alloc]init];
    game.title = @"GTA 5";
    game.year = @"2013";
    game.poster = @"https://i1.wp.com/webmuch.com/wp-content/uploads/2013/04/gta5-box-art.png?fit=460%2C563&ssl=1";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"FIFA 17";
    game.year = @"2016";
    game.poster = @"https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTcoYBrJRe6ocDBW_8MGfBUlzYTrjKUmdO25Ts6oNYyGWD0gtcTksRCQO2Q1NxRmwr2uZX2bkdkfwSnNDnc3EssjId9agR0g.vCJnn8uVyVKI5hhiqCsOOXJtazexp_zYf4siucg7eRX9v1TO7mjqK9Shn5UAXHUfgBKYwzc2CPC0c-&w=200&h=300&format=jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"The Witcher";
    game.year = @"2015";
    game.poster = @"https://upload.wikimedia.org/wikipedia/en/0/0c/Witcher_3_cover_art.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Dishonored 2";
    game.year = @"2016";
    game.poster = @"https://dishonored.bethesda.net/assets/images/dishonored-2-fb-share-8ef325c803.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Deus Ex: Mankind Divided";
    game.year = @"2016";
    game.poster = @"http://www.kritikanstvo.ru/games/d/deusexmankinddivided/covers/deusexmankinddivided_pc_560588.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Watch Dogs 2";
    game.year = @"2016";
    game.poster = @"https://ubistatic19-a.akamaihd.net/ubicomstatic/en-US/global/game-info/WD2-ubicom-gameinfo-boxart-rated-tablet-v2_Tablet_254078.jpg";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Horizon Zero Dawn";
    game.year = @"2017";
    game.poster = @"https://store.playstation.com/store/api/chihiro/00_09_000/container/AU/en/999/EP9000-CUSA01021_00-HRZ0000000000000/1505461891000/image?_version=00_09_000&platform=chihiro&w=225&h=225&bg_color=000000&opacity=100";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"uncharted 4";
    game.year = @"2017";
    game.poster = @"https://store.playstation.com/store/api/chihiro/00_09_000/container/CA/en/999/UP9000-CUSA00341_00-UNCHARTED0000000/1502827657000/image?_version=00_09_000&platform=chihiro&w=225&h=225&bg_color=000000&opacity=100";
    [self.arrayOfGames addObject:game];
    
    game = [[Game alloc]init];
    game.title = @"Mass Effect: Andromeda";
    game.year = @"2017";
    game.poster = @"https://upload.wikimedia.org/wikipedia/ru/f/fb/MEA_cover.png";
    [self.arrayOfGames addObject:game];

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
    cell.lblTitle.text = game.title;
    cell.lblYear.text = game.year;
    
    [cell.imgPoster setImageWithURL:[NSURL URLWithString:game.poster]];
    
    
    cell.imgPoster.layer.cornerRadius = 30;
    cell.imgPoster.layer.masksToBounds = YES;
    cell.imgPoster.layer.borderWidth = 0;
    cell.backgroundColor = [UIColor colorWithRed:225.0/255.0 green:254.0/255.0 blue:255.0/255.0 alpha:1.0];
    
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
