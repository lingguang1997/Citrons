//
//  UIView+InterfaceBuilder.m
//  Citron
//
//  Created by Zijiao Liu on 2/25/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "CTFileOwner.h"
#import "UIView+InterfaceBuilder.h"

@implementation UIView (InterfaceBuilder)

+ (instancetype)ct_loadFromNib {
    return [self ct_loadFromNibWithName:NSStringFromClass(self)];
}

+ (instancetype)ct_loadFromNibWithName:(NSString *)nibName {
    return [CTFileOwner viewFromNibNamed:nibName];
}

- (NSArray *)ct_setLeadingSpaceToSuperview:(CGFloat)leading {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(self);
    NSMutableArray *r = [NSMutableArray arrayWithCapacity:8];
    NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"|-(%f)-[self]", leading]
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];
    [r addObjectsFromArray:constraints];
    [self.superview addConstraints:r];
    return constraints;
}

- (NSArray *)ct_setTrailingSpaceToSuperview:(CGFloat)trailing {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(self);
    NSMutableArray *r = [NSMutableArray arrayWithCapacity:8];
    NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"[self]-(%f)-|", trailing]
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];
    [r addObjectsFromArray:constraints];
    [self.superview addConstraints:r];
    return constraints;
}

- (NSArray *)ct_setTopSpaceToSuperview:(CGFloat)top {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(self);
    NSMutableArray *r = [NSMutableArray arrayWithCapacity:8];
    NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|-(%f)-[self]", top]
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];
    [r addObjectsFromArray:constraints];
    [self.superview addConstraints:r];
    return constraints;
}

- (NSArray *)ct_setBottomSpaceToSuperview:(CGFloat)bottom {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(self);
    NSMutableArray *r = [NSMutableArray arrayWithCapacity:8];
    NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[self]-(%f)-|", bottom]
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];
    [r addObjectsFromArray:constraints];
    [self.superview addConstraints:r];
    return constraints;
}

- (NSArray *)ct_setWidth:(CGFloat)height {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(self);
    NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"[self(==%f)]", height]
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray *)ct_setHeight:(CGFloat)height {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(self);
    NSArray *constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[self(==%f)]", height]
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray *)ct_setTopSpace:(CGFloat)top toView:(UIView *)view {
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTopMargin relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottomMargin multiplier:1 constant:5];
//    NSArray *constraints = [NSArray arrayWithObject:constraint];
//    [self.superview addConstraint:constraint];
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(self, view);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:[view]-(%f)-[self]", top] options:0 metrics:nil views:viewsDictionary];
    [self.superview addConstraints:constraints];
    return constraints;
}

@end
