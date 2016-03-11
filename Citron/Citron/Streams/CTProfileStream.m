//
//  CTProfileStream.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/10.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTProfileStream.h"
#import "CTCustomer.h"
#import "CTExpert.h"
#import "CTLink.h"
#import "CTTopic.h"
#import "CTComment.h"
#import "CTRequest.h"
#import "CTProfileModule.h"
#import "CTProfileMiscModule.h"

@implementation CTProfileStream

- (void)update{
    [super update];
    [self _parseCustomer];
    [self.delegate streamDidUpdate];
}

- (void)_parseCustomer {
    CTLink *link1 = [[CTLink alloc] initWithLinkText:@"LinkIn1 profile" urlString:@"https://www.linkedin.com/in/zijiao-liu-5b110217"];
    CTLink *link2 = [[CTLink alloc] initWithLinkText:@"LinkIn2 profile" urlString:@"https://www.linkedin.com/in/zijiao-liu-5b110217"];
    
    CTTopic *topic1 = [[CTTopic alloc] initWithTitle:@"如何设计一个推荐系统?" price:200 salePrice:100 detail:@"在学术界， 一般说到推荐引擎， 我们都是围绕着某一种单独的算法的效果优化进行的， 例如按内容推荐， 协同过滤（包括item-based, user-based, SVD分解等），上下文推荐，Constraint-based推荐，图关系挖掘等。 很多比较牛的单个算法， 就能在某个指标上取得较好效果， 例如MAE，RMSE。。。不过有自己的优点， 每种算法也有自己的缺点， 例如按内容推荐主要推荐和用户历史结果相似的item，一般的item-based容易推荐热门item（被更多人投票过）。。。。   所以在工业界，例如各互联网公司， 都会使用多种算法进行互相配合， 取长补短， 配合产品提升效果。而且在 完整的推荐系统中，不仅有传统的Rating推荐， 还需要辅以非常多的挖掘， Ranking来达到预期效果。" duration:1];
    //@"具体来说，要实现大数据的核心价值，还需要前两个重要的步骤，第一步是通过“众包”的形式收集海量数据，第二步是通过大数据的技术途径进行“全量数据挖掘”，最后利用分析结果进行“资源优化配置”。"
    CTTopic *topic2 = [[CTTopic alloc] initWithTitle:@"大数据最核心的价值是什么？" price:100 salePrice:50 detail:@"alkdjflakjslwoierj sdkjfosaoiwe sodifo alskdf oweuro askldf" duration:1];
    
    CTUser *user1 = [[CTUser alloc] initWithID:@"1" name:@"小明" email:@"xiaoming@gmail.com" phoneNumber:@"13810092834"];
    CTUser *user2 = [[CTUser alloc] initWithID:@"2" name:@"小红" email:@"xiaohong@gmail.com" phoneNumber:@"13582349503"];
    
    CTComment *comment1 = [[CTComment alloc] initWithComment:@"不错！" from:user1 to:user2 date:[NSDate date]];
    CTComment *comment2 = [[CTComment alloc] initWithComment:@"很好！" from:user2 to:user1 date:[NSDate date]];
    
    CTExpert *expert1 = [[CTExpert alloc] initWithID:@"10" name:@"Zijiao Liu" email:@"lingguang1997@gmail.com" phoneNumber:@"301-775-2528" title:@"Engineer" schoole:@"New York University" degree:@"Master" tags:@[@"Mobile", @"iOS Infra", @"Big Data", @"Core Infra", @"Ads Recommentation System"] topics:@[topic1, topic2] bio:@"本人目前就职于FaceBook，本人目前就职于FaceBook，本人目前就职于FaceBook， 本人目前就职于FaceBook， 本人目前就职于FaceBook" links:@[link1, link2] credits:10 commentsFromExperts:@[comment1] commentsFromUsers:@[comment2] profileImageURL:@"http://cdn5.raywenderlich.com/wp-content/uploads/2015/05/customlayout-tutorial-image.png"];
    CTExpert *expert2 = [[CTExpert alloc] initWithID:@"11" name:@"Zijiao Liu1" email:@"lingguang1997@gmail.com" phoneNumber:@"301-775-2528" title:@"Engineer" schoole:@"New York University" degree:@"Master" tags:@[@"Mobile", @"iOS Infra"] topics:@[topic1, topic2] bio:@"..." links:@[link1] credits:9 commentsFromExperts:@[comment1] commentsFromUsers:@[comment2] profileImageURL:@"http://cdn2.raywenderlich.com/wp-content/uploads/2012/09/iOS6_feast_UICollView.png"];
    
    CTRequest *req = [[CTRequest alloc] initWithRequestId:@"1" customerId:@"1" expertId:@"1" topicId:@"1" topicTitle:@"Topic" topicRequestedTime:[NSDate date] topicAcceptedTime:[NSDate date] topicScheduledTime:[NSDate date] topicServedTime:[NSDate date] topicRatedTime:[NSDate date] topicComment:comment1 stage:1];
    
    CTCustomer *customer = [[CTCustomer alloc] initWithID:@"1" name:@"lingguang" email:@"lingguang@gmail.com" phoneNumber:@"18888888888" title:@"工程师" company:@"AK" about:@"一介书生" lastSeenDate:[NSDate date] interestedInExperts:@[expert1, expert2] onGoingTopicRequests:@[req] completedTopicRequests:nil profileImageURL:@"http://cdn5.raywenderlich.com/wp-content/uploads/2015/05/customlayout-tutorial-image.png" profileImageThumbURL:@"http://cdn5.raywenderlich.com/wp-content/uploads/2015/05/customlayout-tutorial-image.png"];
    
    [self.items addObject:[[CTProfileModule alloc] initWithCustomer:customer]];
    [self.items addObject:[[CTProfileMiscModule alloc] initWithCustomer:customer]];
}
@end
