//
//  CTMyQuestionsListViewController.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/15.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTQuestionsListViewController.h"
#import "CTQuestionTableViewCell.h"

@interface CTQuestionsListViewController (){
    CTCustomer *customer;
    NSArray <CTRequest *> * requests;
}

@end

@implementation CTQuestionsListViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self.tableView registerClass:[CTQuestionTableViewCell class] forCellReuseIdentifier:@"QuestionCell"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup methods

- (void)setupWithCustomer:(CTCustomer *)_customer{
    customer = _customer;
    NSMutableArray *requestsMArray = [NSMutableArray arrayWithCapacity:0];
    [requestsMArray addObjectsFromArray:customer.onGoingTopicRequests];
    [requestsMArray addObjectsFromArray:customer.completedTopicRequests];
    requests = [NSArray arrayWithArray:requestsMArray];
}

- (void)setupWithRequests:(NSArray<CTRequest *> *)requestsArray{
    requests = requestsArray;
}


#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableView DataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CTQuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell"];
    [cell updateWithQuestionRequest:requests[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return requests.count;
}

@end
