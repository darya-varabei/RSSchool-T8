//
//  NavigationDemoViewController.h
//  ContainerViewControllersDemo
//
//  Created by Victor Semenchuk on 4/6/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

NS_ASSUME_NONNULL_BEGIN
@interface NavigationViewController : UIViewController
@property (nonatomic, retain) CanvasViewController *secondViewController;
@property (nonatomic, strong) NSString *drawingName;
@property (strong, nonatomic) NSMutableArray *colors;
@property (nonatomic) float time;
@property (strong, nonatomic) UIButton *drawbtn;
@property (strong, nonatomic) UIButton *timerbtn;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIButton *sharebtn;
@property (strong, nonatomic) UIButton *resetbtn;
@end

@interface CustomButton : UIButton

- (instancetype)initWithCoder:(NSCoder *)coder;

@end

NS_ASSUME_NONNULL_END
