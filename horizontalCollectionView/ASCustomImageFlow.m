//
//  ASCustomImageFlow.m
//  horizontalCollectionView
//
//  Created by MD on 16.09.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import "ASCustomImageFlow.h"

@implementation ASCustomImageFlow

+(UICollectionViewFlowLayout*) initFlowLayout {
    
    
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    
    flowLayout.minimumLineSpacing = 5.f;
    flowLayout.minimumInteritemSpacing = 5.f;
    flowLayout.itemSize = CGSizeMake(90.f, 90.f);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    return flowLayout;
}


@end
