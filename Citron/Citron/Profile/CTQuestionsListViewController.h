//
//  CTMyQuestionsListViewController.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/15.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTCustomer.h"
#import "CTRequest.h"

@interface CTQuestionsListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, nonnull) IBOutlet UITableView *tableView;

- (void)setupWithCustomer:(nonnull CTCustomer *)customer;
- (void)setupWithRequests:(nonnull NSArray<CTRequest *> *)requestsArray;

@end
