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

@property (nonatomic, strong) NSMutableArray* imageUrls;

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSMutableArray* allImages;
@property (nonatomic, strong) NSMutableArray* allImagesFake;
@end

@implementation SecondViewController

@synthesize arrayOfGames;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayOfGames = [[NSMutableArray alloc]init];//[NSMutableArray arrayWithCapacity:5];
    self.allImages = [[NSMutableArray alloc] init];
    self.allImagesFake = [[NSMutableArray alloc] init];
    self.imageUrls = [[NSMutableArray alloc] init];
    NSArray* imageArray = [NSArray arrayWithObjects:@"https://st2.depositphotos.com/4341251/6490/i/950/depositphotos_64906463-stock-photo-beautiful-flowers-background.jpg",@"https://img1.goodfon.ru/wallpaper/big/2/a3/romashki-cvety-cvetok-buket-4109.jpg", @"https://www.7flowers.ru/upload/images/catalogcategory/1/cache/1_353x236_image_58b81ed2e7925.png", @"https://www.wmj.ru/imgs/2016/12/05/09/933634/7c5874a085ca4bc20eaf7c32cd65743ac0b131d0.jpg", @"https://st2.depositphotos.com/1000848/7024/i/450/depositphotos_70243831-stock-photo-abstract-background-of-flowers.jpg",@"https://previews.123rf.com/images/serezniy/serezniy1208/serezniy120806093/15009127-beautiful-bouquet-of-bright-wildflowers-in-basket-isolated-on-white-Stock-Photo.jpg", @"https://flowers.ua/images/Flowers/zoom/1/0/1461.jpg", nil];
    
    
    
    [self.imageUrls addObjectsFromArray:imageArray];
    NSLog(@"count of images %ld",self.imageUrls.count);

    
    [self.activity startAnimating];
    
    [self.tableView setHidden:YES];
    self.currentIndex = 0;
    [self loadImageForIndex:self.currentIndex];


   // self.tableView.editing = YES;
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                        target:self
                                                                                action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    
     [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"addCell"];
    
}


- (void) actionEdit:(UIBarButtonItem* ) sender  {
    BOOL isEditing = self.tableView.editing;
    [self.tableView setEditing:!isEditing animated:NO];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
    if (self.tableView.editing) {
        item = UIBarButtonSystemItemDone;
    }
    UIBarButtonItem* editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;

    
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
                [self.allImagesFake addObject:image];
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

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"//////////////------------------------>>>>>>>>>>>>>>> %ld",self.allImages.count);
    return [self.allImages count] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        static NSString* addCell = @"addCell";
        GameTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:addCell forIndexPath:indexPath];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.text = @"Add Flower";
        cell.backgroundColor = [UIColor blueColor];
        return cell;
        
    }else {
    
    
    
    static NSString* cellID = @"GameCell";
    
    
    
    GameTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    NSLog(@"count of images %ld",self.allImages.count);
    
    UIImage* tmpImage = self.allImages[indexPath.row - 1];
    
    cell.imgPoster.image = tmpImage;
    
    cell.imgPoster.contentMode = UIViewContentModeCenter;
    
    cell.lblTitle.textColor = [UIColor colorWithRed:214.0/255.0 green:57.0/255.0 blue:19.0/255.0 alpha:1.0];
    
    cell.lblTitle.text = [NSString stringWithFormat:@"Flower type %ld", indexPath.row];
    
    
    
    
    cell.imgPoster.layer.cornerRadius = 20;
    cell.imgPoster.layer.masksToBounds = YES;
    cell.imgPoster.layer.borderWidth = 0;
    //cell.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    return cell;
    }

}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    return indexPath.row > 0;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    //[self.allImages exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    
    NSString* string = [self.allImages objectAtIndex:sourceIndexPath.row - 1];
    NSMutableArray* tempArray = [NSMutableArray arrayWithArray:self.allImages];
    [tempArray removeObject:string];
    [tempArray insertObject:string atIndex:destinationIndexPath.row - 1];
    
    self.allImages = tempArray;
    
    NSLog(@"Changed array %@",self.allImages);
    
}


#pragma mark - UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString* string = [self.allImages objectAtIndex:indexPath.row - 1];
        NSMutableArray* tempArray = [NSMutableArray arrayWithArray:self.allImages];
        [tempArray removeObject:string];
        
        self.allImages = tempArray;
        
        
//        [tableView beginUpdates];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
//        [tableView endUpdates];
        
            [self.tableView reloadData];
    }
    
}


- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    
    if (proposedDestinationIndexPath.row == 0) {
        return sourceIndexPath;
    } else {
        return proposedDestinationIndexPath;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    int x = arc4random() % 7;
    
    if (indexPath.row == 0) {
        [self.allImages addObject:self.allImagesFake[x]];
        [self.tableView reloadData];
    }
    
    
    
    
}

@end
