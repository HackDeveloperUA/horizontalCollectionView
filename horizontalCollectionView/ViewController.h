//
//  ViewController.h
//  horizontalCollectionView
//
//  Created by MD on 08.09.15.
//  Copyright (c) 2015 MD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)segmentAction:(id)sender;
- (IBAction)buttonAction:(id)sender;

@end

