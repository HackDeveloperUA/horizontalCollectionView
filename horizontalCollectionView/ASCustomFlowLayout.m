//
//  ASCustomFlowLayout.m
//  horizontalCollectionView
//
//  Created by MD on 08.09.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import "ASCustomFlowLayout.h"

@implementation ASCustomFlowLayout


+(UICollectionViewFlowLayout*) initFlowLayout {
    
   

    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];


    flowLayout.minimumLineSpacing = 5.f;
    flowLayout.minimumInteritemSpacing = 5.f;
    flowLayout.itemSize = CGSizeMake(70.f, 70.f);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

 
    return flowLayout;
}





@end
