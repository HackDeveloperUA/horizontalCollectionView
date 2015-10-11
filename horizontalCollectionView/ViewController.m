//
//  ViewController.m
//  horizontalCollectionView
//
//  Created by MD on 08.09.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import "ViewController.h"
#import "ASCustomFlowLayout.h"
#import "ASCustomCollectionCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.collectionView.collectionViewLayout = (UICollectionViewLayout*)[ASCustomFlowLayout initFlowLayout];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(20, 20);
}
  

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
    static NSString *identifier = @"superCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor greenColor];
    */
    
    static NSString *identifier = @"superCell";
    ASCustomCollectionCell *cell = (ASCustomCollectionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.firstLabel.text = [NSString stringWithFormat:@"%d K",indexPath.row];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"superCell";
    ASCustomCollectionCell *cell = (ASCustomCollectionCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    cell.contentView.backgroundColor = [UIColor redColor];
    NSLog(@"IndexPath = %ld",(long)indexPath.section);
    
}

- (IBAction)segmentAction:(id)sender {
    NSLog(@"segmentAction");
}

- (IBAction)buttonAction:(id)sender {
    NSLog(@"buttonAction");

}
@end
