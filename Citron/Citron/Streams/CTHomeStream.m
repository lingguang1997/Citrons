//
//  CTHomeStream.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTHomeStream.h"

@implementation CTHomeStream

- (void)update {
    // hit server
    [self _parseExpertsModule];
    [self _parseCategories];
    [self _parseInsturctions];
    [self _parseRecommendedExperts];
    [self.delegate streamDidUpdate];
}

- (void)_parseExpertsModule {
}

- (void)_parseCategories {
}

- (void)_parseInsturctions {
}

- (void)_parseRecommendedExperts{
}

@end
