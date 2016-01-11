//
//  CTStarExpertController.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTStarExpertController.h"
#import "CTStartExpertCell.h"

static NSString * const kCellResuseIdentifier = @"CTStartExpertCell";

@implementation CTStarExpertController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self.collectionView registerClass:[CTStartExpertCell class] forCellWithReuseIdentifier:kCellResuseIdentifier];
    }
    return self;
}

# pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CTStartExpertCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellResuseIdentifier forIndexPath:indexPath];
    [cell updateWithItem:[self.data objectAtIndex:indexPath.row]];
    return nil;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

@end
