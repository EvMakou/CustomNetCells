//
//  SecondViewController.m
//  CustomNetCells
//
//  Created by supermacho on 05.10.17.
//  Copyright © 2017 student. All rights reserved.
//

#import "SecondViewController.h"
#import "Game.h"
#import "GameTableViewCell.h"

@interface SecondViewController ()
//- (void)milk:(NSInteger)i;
@property (nonatomic, strong) NSMutableArray* imageUrls;

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSMutableArray* allImages;
@end

@implementation SecondViewController

@synthesize arrayOfGames;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayOfGames = [[NSMutableArray alloc]init];//[NSMutableArray arrayWithCapacity:5];
    self.allImages = [[NSMutableArray alloc] init];
    self.imageUrls = [[NSMutableArray alloc] init];
   // self.imageUrls = @[@"https://st2.depositphotos.com/4341251/6490/i/950/depositphotos_64906463-stock-photo-beautiful-flowers-background.jpg",@"https://img1.goodfon.ru/wallpaper/big/2/a3/romashki-cvety-cvetok-buket-4109.jpg", @"https://www.7flowers.ru/upload/images/catalogcategory/1/cache/1_353x236_image_58b81ed2e7925.png", @"https://www.wmj.ru/imgs/2016/12/05/09/933634/7c5874a085ca4bc20eaf7c32cd65743ac0b131d0.jpg", @"https://st2.depositphotos.com/1000848/7024/i/450/depositphotos_70243831-stock-photo-abstract-background-of-flowers.jpg",@"https://previews.123rf.com/images/serezniy/serezniy1208/serezniy120806093/15009127-beautiful-bouquet-of-bright-wildflowers-in-basket-isolated-on-white-Stock-Photo.jpg", @"https://flowers.ua/images/Flowers/zoom/1/0/1461.jpg"];
    
    NSArray* imageArray = [NSArray arrayWithObjects:@"https://st2.depositphotos.com/4341251/6490/i/950/depositphotos_64906463-stock-photo-beautiful-flowers-background.jpg",@"https://img1.goodfon.ru/wallpaper/big/2/a3/romashki-cvety-cvetok-buket-4109.jpg", @"https://www.7flowers.ru/upload/images/catalogcategory/1/cache/1_353x236_image_58b81ed2e7925.png", @"https://www.wmj.ru/imgs/2016/12/05/09/933634/7c5874a085ca4bc20eaf7c32cd65743ac0b131d0.jpg", @"https://st2.depositphotos.com/1000848/7024/i/450/depositphotos_70243831-stock-photo-abstract-background-of-flowers.jpg",@"https://previews.123rf.com/images/serezniy/serezniy1208/serezniy120806093/15009127-beautiful-bouquet-of-bright-wildflowers-in-basket-isolated-on-white-Stock-Photo.jpg", @"https://flowers.ua/images/Flowers/zoom/1/0/1461.jpg", nil];
    [self.imageUrls addObjectsFromArray:imageArray];
    NSLog(@"count of images %ld",self.imageUrls.count);

    
    [self.activity startAnimating];
    
    [self.tableView setHidden:YES];
    self.currentIndex = 0;
    [self loadImageForIndex:self.currentIndex];
//    self.currentIndex = [self milk:self.currentIndex];
//    NSLog(@"%ld",self.currentIndex);
    
}

- (NSInteger)milk:(NSInteger)i {
    i++;
    return i;
}

- (void)loadImageForIndex:(NSInteger)index
{
    if (index >= self.imageUrls.count) {
        NSLog(@"Download finished");
        
        // прячешь спинер и показываешь таблицу
        
        [self.activity stopAnimating];
        [self.tableView setHidden:NO];
        [self.tableView reloadData];
        return;
    }
    
    NSURL *imageUrl = [NSURL URLWithString:self.imageUrls[index]];//self.imageUrls[index];
    NSLog(@"1 ------- %ldarray count, 2 ========= %ldindex",self.imageUrls.count, index);
    NSLog(@"%@",imageUrl);
    NSURLSessionDataTask* dataTask = [[NSURLSession sharedSession] dataTaskWithURL:imageUrl completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
            if (!error) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                UIImage* image = [UIImage imageWithData:data];
                [self.allImages addObject:image];
                
                self.currentIndex++;
                [self loadImageForIndex:self.currentIndex];
                NSLog(@"COUNT OD ALLIMAGES%ld", self.allImages.count);
            }];
        }
        else {
            NSLog(@"Download failed: %@", error);
        }
    }];

    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"//////////////------------------------>>>>>>>>>>>>>>> %ld",self.allImages.count);
    return [self.allImages count];
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
    
    NSLog(@"count of images %ld",self.allImages.count);
    
    UIImage* tmpImage = [[UIImage alloc]init];
    tmpImage = self.allImages[indexPath.row];
    cell.imgPoster.image = tmpImage;
    
    cell.imgPoster.contentMode = UIViewContentModeCenter;
    //cell.lblTitle.text = game.title;
    cell.lblTitle.textColor = [UIColor colorWithRed:214.0/255.0 green:57.0/255.0 blue:19.0/255.0 alpha:1.0];
    
    cell.lblTitle.text = [NSString stringWithFormat:@"Flower type %ld", indexPath.row + 1];
    
    
    
    
    cell.imgPoster.layer.cornerRadius = 20;
    cell.imgPoster.layer.masksToBounds = YES;
    cell.imgPoster.layer.borderWidth = 0;
    cell.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    return cell;

}



@end
