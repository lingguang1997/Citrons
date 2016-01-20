//
//  CTHomeStream.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTCategoryModule.h"
#import "CTComment.h"
#import "CTExpert.h"
#import "CTHomeStream.h"
#import "CTInstructionModule.h"
#import "CTRecommendedExpertModule.h"
#import "CTStarExpertsModule.h"
#import "CTTopic.h"

@implementation CTHomeStream

- (void)update {
    // hit server
    [super update];
    [self _parseExpertsModule];
//    [self _parseCategories];
    [self _parseInsturctions];
    [self _parseRecommendedExperts];
    [self.delegate streamDidUpdate];
}

- (void)_parseExpertsModule {
    CTTopic *topic1 = [[CTTopic alloc] initWithTitle:@"如何做好京酱肉丝?" price:200 salePrice:100 detail:@"test" duration:1];
    CTTopic *topic2 = [[CTTopic alloc] initWithTitle:@"如何蒸鱼不腥？" price:100 salePrice:50 detail:@"test" duration:1];
    CTUser *user1 = [[CTUser alloc] initWithID:@"1" name:@"小明" email:@"xiaoming@gmail.com" phoneNumber:@"13810092834"];
    CTUser *user2 = [[CTUser alloc] initWithID:@"2" name:@"小红" email:@"xiaohong@gmail.com" phoneNumber:@"13582349503"];
    CTComment *comment1 = [[CTComment alloc] initWithComment:@"不错！" from:user1 to:user2 date:[NSDate date]];
    CTComment *comment2 = [[CTComment alloc] initWithComment:@"很好！" from:user2 to:user1 date:[NSDate date]];
    CTExpert *expert1 = [[CTExpert alloc] initWithID:@"10" name:@"Zijiao Liu" email:@"lingguang1997@gmail.com" phoneNumber:@"301-775-2528" title:@"Engineer" schoole:@"New York University" degree:@"Master" tags:@[@"Mobile"] topics:@[topic1, topic2] bio:@"..." links:@[@"https://www.linkedin.com/in/zijiao-liu-5b110217"] credits:10 commentsFromExperts:@[comment1] commentsFromUsers:@[comment2] profileImageURL:@"http://cdn5.raywenderlich.com/wp-content/uploads/2015/05/customlayout-tutorial-image.png"];
    CTExpert *expert2 = [[CTExpert alloc] initWithID:@"11" name:@"Zijiao Liu1" email:@"lingguang1997@gmail.com" phoneNumber:@"301-775-2528" title:@"Engineer" schoole:@"New York University" degree:@"Master" tags:@[@"Mobile"] topics:@[topic1, topic2] bio:@"..." links:@[@"https://www.linkedin.com/in/zijiao-liu-5b110217"] credits:10 commentsFromExperts:@[comment1] commentsFromUsers:@[comment2] profileImageURL:@"http://cdn2.raywenderlich.com/wp-content/uploads/2012/09/iOS6_feast_UICollView.png"];
    CTExpert *expert3 = [[CTExpert alloc] initWithID:@"12" name:@"Zijiao Liu2" email:@"lingguang1997@gmail.com" phoneNumber:@"301-775-2528" title:@"Engineer" schoole:@"New York University" degree:@"Master" tags:@[@"Mobile"] topics:@[topic1, topic2] bio:@"..." links:@[@"https://www.linkedin.com/in/zijiao-liu-5b110217"] credits:10 commentsFromExperts:@[comment1] commentsFromUsers:@[comment2] profileImageURL:@"http://cdn1.raywenderlich.com/wp-content/uploads/2012/09/12.png"];

    CTStarExpertsModule *module = [[CTStarExpertsModule alloc] initWithExperts:@[expert1, expert2, expert3]];
    [self.items addObject:@[module]];
}

- (void)_parseCategories {
//    CTCategoryModule *module = [[CTCategoryModule alloc] initWithCategories:@[@"机器学习", @"自然语言处理", @"信息检索", @"图像视觉"]];
//    [self.items addObject:@[module]];
}

- (void)_parseInsturctions {
    CTInstructionModule *module = [[CTInstructionModule alloc] initWithHeader:@"专家服务流程" instructionImageName:@"Instruction"];
    [self.items addObject:module];
}

- (void)_parseRecommendedExperts {
    CTTopic *topic1 = [[CTTopic alloc] initWithTitle:@"如何做好京酱肉丝?" price:200 salePrice:100 detail:@"test" duration:1];
    CTTopic *topic2 = [[CTTopic alloc] initWithTitle:@"如何蒸鱼不腥？" price:100 salePrice:50 detail:@"test" duration:1];
    CTUser *user1 = [[CTUser alloc] initWithID:@"1" name:@"小明" email:@"xiaoming@gmail.com" phoneNumber:@"13810092834"];
    CTUser *user2 = [[CTUser alloc] initWithID:@"2" name:@"小红" email:@"xiaohong@gmail.com" phoneNumber:@"13582349503"];
    CTComment *comment1 = [[CTComment alloc] initWithComment:@"不错！" from:user1 to:user2 date:[NSDate date]];
    CTComment *comment2 = [[CTComment alloc] initWithComment:@"很好！" from:user2 to:user1 date:[NSDate date]];
    CTExpert *expert1 = [[CTExpert alloc] initWithID:@"10" name:@"Zijiao Liu" email:@"lingguang1997@gmail.com" phoneNumber:@"301-775-2528" title:@"Engineer" schoole:@"New York University" degree:@"Master" tags:@[@"Mobile"] topics:@[topic1, topic2] bio:@"..." links:@[@"https://www.linkedin.com/in/zijiao-liu-5b110217"] credits:10 commentsFromExperts:@[comment1] commentsFromUsers:@[comment2] profileImageURL:@"http://cdn5.raywenderlich.com/wp-content/uploads/2015/05/customlayout-tutorial-image.png"];
    CTExpert *expert2 = [[CTExpert alloc] initWithID:@"11" name:@"Zijiao Liu1" email:@"lingguang1997@gmail.com" phoneNumber:@"301-775-2528" title:@"Engineer" schoole:@"New York University" degree:@"Master" tags:@[@"Mobile"] topics:@[topic1, topic2] bio:@"..." links:@[@"https://www.linkedin.com/in/zijiao-liu-5b110217"] credits:9 commentsFromExperts:@[comment1] commentsFromUsers:@[comment2] profileImageURL:@"http://cdn2.raywenderlich.com/wp-content/uploads/2012/09/iOS6_feast_UICollView.png"];
    CTExpert *expert3 = [[CTExpert alloc] initWithID:@"12" name:@"Zijiao Liu2" email:@"lingguang1997@gmail.com" phoneNumber:@"301-775-2528" title:@"Engineer" schoole:@"New York University" degree:@"Master" tags:@[@"Mobile"] topics:@[topic1, topic2] bio:@"..." links:@[@"https://www.linkedin.com/in/zijiao-liu-5b110217"] credits:8 commentsFromExperts:@[comment1] commentsFromUsers:@[comment2] profileImageURL:@"http://cdn1.raywenderlich.com/wp-content/uploads/2012/09/12.png"];
    CTRecommendedExpertModule *module = [[CTRecommendedExpertModule alloc] initWithExperts:@[expert1, expert2, expert3]];
    [self.items addObject:module];
}

@end
