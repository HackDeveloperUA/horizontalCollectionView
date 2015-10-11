//
//  TVC2.m
//  horizontalCollectionView
//
//  Created by MD on 16.09.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import "TVC2.h"
#import "ASImageCustomCell.h"
#import "ASCustomFlowLayout.h"


static CGSize CGSizeResize(CGSize size) {
    
    
    //size.width *= height / size.height;
    //size.height = height;
    //return size;
    
    CGFloat targetHeight = 55.0f;
    CGFloat scaleFactor = targetHeight / size.height;
    CGFloat targetWidth = size.width * scaleFactor;
    
    return CGSizeMake(targetWidth, targetHeight);
}




@interface TVC2 () <UICollectionViewDataSource, UICollectionViewDelegate ,
                    UICollectionViewDelegateFlowLayout ,UIScrollViewDelegate>

@property (strong, nonatomic) NSArray* dataArray;

@property (strong, nonatomic) UICollectionView* testCollection;
@end

@implementation TVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    

   // self.collectionView.delegate = self;
   // self.collectionView.dataSource = self;
    
   // self.secondCollectionView.delegate = self;
   // self.secondCollectionView.dataSource = self;
    
   // -[UIScrollViewDelegate scrollViewDidEndDragging: willDecelerate:]
    
    
    self.dataArray = [NSArray array];
    NSArray* tmp = [NSArray arrayWithObjects: @"00.jpg", @"01.jpg", @"02.jpg",   @"03.jpg",
                    @"04.jpg",  nil];
    
    
    self.dataArray = tmp;//@[@"1", @"2",@"16",@"newStl8",@"newStl12"];
    
    self.collectionView.collectionViewLayout = (UICollectionViewLayout*)[ASCustomFlowLayout initFlowLayout];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    //[self.collectionView reloadData];
}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    
    if ([UICollectionView isSubclassOfClass:[UIScrollView class]]) {
        
        
        if ([(UICollectionView*)scrollView isEqual:self.collectionView]) {
            
            if ((scrollView.contentOffset.x + scrollView.frame.size.width) >= scrollView.contentSize.width) {
                NSLog(@"Подгружаю !");
            }
            NSLog(@"Ебать collectionView");
        }
        
        
        if ([(UICollectionView*)scrollView isEqual:self.secondCollectionView]) {
            
            
            NSLog(@"Ебать secondCollectionView");
        }
    }
    
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    NSLog(@"class %@",[collectionView class]);
    NSLog(@"subclass %@",[[collectionView class] superclass]);
    
    
    if ([[collectionView class] isSubclassOfClass:[ASImageCustomCell class]]) {
        
        NSLog(@"Я в охуе ");
 
    }
    
    
    if ([collectionView isKindOfClass:[ASImageCustomCell class]]) {
        NSLog(@"Я в охуе ");
    }
    
    /////
    if ([collectionView isEqual:self.collectionView])
        {  return [self.dataArray count]; }
    
    
    if ([collectionView isEqual:self.secondCollectionView])
        {  return 100; }
  
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    
    if ([collectionView isEqual:self.collectionView]) {
    UIImage* image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    CGSize newSize = CGSizeResize(image.size);
    
    return CGSizeResize(image.size);
    }
    
    
    return CGSizeMake(80, 80);
}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
    //NSLog(@"cellForItemAtIndexPath");

    if ([collectionView isEqual:self.collectionView]) {
        
        static NSString *identifier = @"imageCell";
        ASImageCustomCell *cell = (ASImageCustomCell*)
        [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        
        cell.customImage.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
        self.testCollection = cell;

        return cell;
    }
    
    if ([collectionView isEqual:self.secondCollectionView]) {
        
        static NSString *identifier = @"blueCell";
        UICollectionView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        
        cell.backgroundColor = [UIColor blueColor];
        
        
        self.testCollection = cell;
        
        return cell;
    }
    
    
    
    
    return nil;
}






@end
