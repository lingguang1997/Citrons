//
//  CTCollectionViewStarExpertsController.m
//  Citron
//
//  Created by Zijiao Liu on 1/18/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTCollectionViewStarExpertsController.h"
#import "CTStartExpertCell.h"

@implementation CTCollectionViewStarExpertsController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self.collectionView registerClass:[CTStartExpertCell class] forCellWithReuseIdentifier:@"CTStartExpertCell"];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CTStartExpertCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CTStartExpertCell" forIndexPath:indexPath];
    [cell updateWithItem:[self.data objectAtIndex:indexPath.row]];
    return cell;
}

@end
