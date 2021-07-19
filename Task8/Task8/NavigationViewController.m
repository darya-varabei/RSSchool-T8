//
//  NavigationDemoViewController.m
//  ContainerViewControllersDemo
//
//  Created by Victor Semenchuk on 4/6/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "NavigationViewController.h"
#import <Foundation/Foundation.h>
#import "Task8-Swift.h"
#import <QuartzCore/QuartzCore.h>

@interface ModalController : UIViewController
@end

@implementation ModalController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.cornerRadius = 40;
    self.view.layer.shadowRadius = 5.f;
    self.view.layer.shadowColor = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
    self.view.layer.shadowOffset = CGSizeMake(0.5f, 0.5f);
    self.view.layer.shadowOpacity = 0.9f;
    self.view.layer.masksToBounds = NO;
}
@end


@interface TimerController : UIViewController

@end

@implementation TimerController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.cornerRadius = 40;
    self.view.layer.shadowRadius  = 5.f;
    self.view.layer.shadowColor   = [UIColor colorWithRed:176.f/255.f green:199.f/255.f blue:226.f/255.f alpha:1.f].CGColor;
    self.view.layer.shadowOffset  = CGSizeMake(0.5f, 0.5f);
    self.view.layer.shadowOpacity = 0.9f;
    self.view.layer.masksToBounds = NO;
}

@end


@interface NavigationViewController ()
@property (nonatomic, assign) bool presentingModalController;
@property (nonnull, nonatomic, strong) ModalController *modalController;
@property (nonatomic, assign) bool presentingTimerController;
@property (nonnull, nonatomic, strong) TimerController *timerController;
@property (strong, nonatomic) CanvasViewController *frameVC;
@property (assign, nonatomic) BOOL isChildViewControllerAdded;
@property(nonatomic, strong) SliderViewController *secondVS;
@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.isChildViewControllerAdded = NO;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupNavigationItems];
}

- (void)setupNavigationItems {
   
    self.colors = [[NSMutableArray alloc] initWithObjects:[UIColor blackColor],[UIColor blackColor],[UIColor blackColor],nil];
    self.time = 2.25;
    
    self.navigationController.title = [NSString stringWithFormat:@"%s", "Artist"];

    UIButton *navButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [navButton setTitleColor:[UIColor colorNamed: @"AccentGreen"] forState:UIControlStateNormal];
    [navButton setTitle:@"Drawings" forState:UIControlStateNormal];
    navButton.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:17.0];
    [navButton addTarget:self action:@selector(nextTapped:)  forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithCustomView:navButton];
    self.navigationItem.rightBarButtonItems = @[next];
    self.navigationItem.title = @"Artist";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor colorNamed: @"AccentGreen"],
    NSFontAttributeName:[UIFont fontWithName:@"Montserrat-Regular" size:17]}];
    self.navigationItem.hidesBackButton = true;
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(20.0, 452.0, 163.0, 32.0)];
    [self.button setBackgroundColor:[UIColor whiteColor]];
    [self.button setTitle:@"Open Palette" forState:UIControlStateNormal];
    self.button.layer.cornerRadius = 10;
    self.button.layer.borderWidth = 1.0;
    self.button.layer.borderColor = [UIColor colorNamed: @"StrokeBlack"].CGColor;
    self.button.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    [self.button setTitleColor:[UIColor colorNamed: @"DisabledGreen"] forState:UIControlStateDisabled];
    [self.button setTitleColor:[UIColor colorNamed: @"AccentGreen"] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(showColorPanel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.timerbtn = [[UIButton alloc]initWithFrame:CGRectMake(20.0, 504.0, 163.0, 32.0)];
    [self.timerbtn setBackgroundColor:[UIColor whiteColor]];
    [self.timerbtn setTitle:@"Open Timer" forState:UIControlStateNormal];
    self.timerbtn.layer.cornerRadius = 10;
    self.timerbtn.layer.borderWidth = 1.0;
    self.timerbtn.layer.borderColor = [UIColor colorNamed: @"StrokeBlack"].CGColor;
    self.timerbtn.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    [self.timerbtn setTitleColor:[UIColor colorNamed: @"AccentGreen"] forState:UIControlStateNormal];
    [self.timerbtn setTitleColor:[UIColor colorNamed: @"DisabledGreen"] forState:UIControlStateDisabled];
    [self.timerbtn addTarget:self action:@selector(timerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.timerbtn];
    
    self.drawbtn = [[UIButton alloc]initWithFrame:CGRectMake(239.0, 506.0, 91.0, 32.0)];
    [self.drawbtn setBackgroundColor:[UIColor whiteColor]];
    [self.drawbtn setTitle:@"Share" forState:UIControlStateNormal];
    self.drawbtn.layer.cornerRadius = 10;
    self.drawbtn.layer.borderWidth = 1.0;
    self.drawbtn.layer.borderColor = [UIColor colorNamed: @"StrokeBlack"].CGColor;
    self.drawbtn.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    [self.drawbtn setTitleColor:[UIColor colorNamed: @"AccentGreen"] forState:UIControlStateNormal];
    [self.drawbtn setTitleColor:[UIColor colorNamed: @"DisabledGreen"] forState:UIControlStateDisabled];
    [self.drawbtn addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    self.drawbtn.enabled = false;
    [self.view addSubview:self.drawbtn];
    
    self.sharebtn = [[UIButton alloc]initWithFrame:CGRectMake(243.0, 454.0, 91.0, 32.0)];
    [self.sharebtn setBackgroundColor:[UIColor whiteColor]];
    [self.sharebtn setTitle:@"Draw" forState:UIControlStateNormal];
    self.sharebtn.layer.cornerRadius = 10;
    self.sharebtn.layer.borderWidth = 1.0;
    self.sharebtn.layer.borderColor = [UIColor colorNamed: @"StrokeBlack"].CGColor;
    self.sharebtn.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    [self.sharebtn setTitleColor:[UIColor colorNamed: @"AccentGreen"] forState:UIControlStateNormal];
    [self.sharebtn addTarget:self action:@selector(drawButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sharebtn];
    
    self.resetbtn = [[UIButton alloc]initWithFrame:CGRectMake(243.0, 454.0, 91.0, 32.0)];
    [self.resetbtn setBackgroundColor:[UIColor whiteColor]];
    [self.resetbtn setTitle:@"Reset" forState:UIControlStateNormal];
    self.resetbtn.layer.cornerRadius = 10;
    self.resetbtn.layer.borderWidth = 1.0;
    self.resetbtn.layer.borderColor = [UIColor colorNamed: @"StrokeBlack"].CGColor;
    self.resetbtn.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    [self.resetbtn setTitleColor:[UIColor colorNamed: @"AccentGreen"] forState:UIControlStateNormal];
    [self.resetbtn addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchUpInside];
    
    self.modalController = [[ModalController alloc] init];
        self.modalController.transitioningDelegate = self;
        self.modalController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    
    self.timerController = [[TimerController alloc] init];
        self.timerController.transitioningDelegate = self;
        self.timerController.modalPresentationStyle = UIModalPresentationOverFullScreen;
}

- (void)nextTapped:(id)sender {
    DrawingViewController *viewController = [DrawingViewController new];
    [self.navigationController pushViewController:viewController animated:YES];
    viewController.title = @"Drawings";
}


- (void)backToRootTapped:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)showColorPanel:(UIButton *)button {
    if (self.modalController.view.window == nil) {
        CGRect startingFrame = self.view.bounds;
        startingFrame.origin.y = startingFrame.size.height;
        startingFrame.size.height = 500;

        CGRect finalFrame = self.view.bounds;
        finalFrame.origin.y = finalFrame.size.height - 333;
        finalFrame.size.height = 333;

        [self.modalController.view setFrame:startingFrame];

        [self.modalController willMoveToParentViewController:self];
        [self addChildViewController:self.modalController];
        [self.view addSubview:self.modalController.view];
        [self.modalController didMoveToParentViewController:self];

        [UIView animateWithDuration:0.5 animations:^{
            [self.modalController.view setFrame:finalFrame];
        } completion:^(BOOL finished) {
            UIButton *drawbtn = [[UIButton alloc]initWithFrame:CGRectMake(250.0, 20.0, 91.0, 32.0)];
            [drawbtn setBackgroundColor:[UIColor whiteColor]];
            [drawbtn setTitle:@"Save" forState:UIControlStateNormal];
            drawbtn.layer.cornerRadius = 10;
            drawbtn.layer.borderWidth = 1.0;
            drawbtn.layer.borderColor = [UIColor colorNamed: @"StrokeBlack"].CGColor;
            drawbtn.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0];
            [drawbtn setTitleColor:[UIColor colorNamed: @"AccentGreen"] forState:UIControlStateNormal];
            [drawbtn addTarget:self action:@selector(showColorPanel:) forControlEvents:UIControlEventTouchUpInside];
            [self.modalController.view addSubview:drawbtn];
            
            UIButton *redbtn = [[UIButton alloc]initWithFrame:CGRectMake(17.0, 92.0, 40.0, 40.0)];
            [redbtn setBackgroundColor:[UIColor colorNamed:@"ButtonRed"]];
            redbtn.layer.cornerRadius = 10;
            redbtn.layer.borderWidth = 8.0;
            redbtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [redbtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [redbtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [redbtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [redbtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [redbtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:redbtn];
            
            
            UIButton *bluebtn = [[UIButton alloc] initWithFrame:CGRectMake(77.0, 92.0, 40.0, 40.0)];
            [bluebtn setBackgroundColor:[UIColor colorNamed:@"ButtonBlue"]];
            bluebtn.layer.cornerRadius = 10;
            bluebtn.layer.borderWidth = 8.0;
            bluebtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [bluebtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [bluebtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [bluebtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [bluebtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [bluebtn.layer setShadowOpacity:0.3];
            [bluebtn setTag:1];
            [self.modalController.view addSubview:bluebtn];
            
            UIButton *greenbtn = [[UIButton alloc]initWithFrame:CGRectMake(137.0, 92.0, 40.0, 40.0)];
            [greenbtn setBackgroundColor:[UIColor colorNamed:@"ButtonGreen"]];
            greenbtn.layer.cornerRadius = 10;
            greenbtn.layer.borderWidth = 8.0;
            greenbtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [greenbtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [greenbtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [greenbtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [greenbtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [greenbtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:greenbtn];
            
            
            UIButton *greybtn = [[UIButton alloc] initWithFrame:CGRectMake(197.0, 92.0, 40.0, 40.0)];
            [greybtn setBackgroundColor:[UIColor colorNamed:@"ButtonGrey"]];
            greybtn.layer.cornerRadius = 10;
            greybtn.layer.borderWidth = 8.0;
            greybtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [greybtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [greybtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [greybtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [greybtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [greybtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:greybtn];
            
            UIButton *lilobtn = [[UIButton alloc]initWithFrame:CGRectMake(257.0, 92.0, 40.0, 40.0)];
            [lilobtn setBackgroundColor:[UIColor colorNamed:@"ButtonLilo"]];
            lilobtn.layer.cornerRadius = 10;
            lilobtn.layer.borderWidth = 8.0;
            lilobtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [lilobtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [lilobtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [lilobtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [lilobtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [lilobtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:lilobtn];
            
            
            UIButton *peachbtn = [[UIButton alloc] initWithFrame:CGRectMake(317.0, 92.0, 40.0, 40.0)];
            [peachbtn setBackgroundColor:[UIColor colorNamed:@"ButtonPeach"]];
            peachbtn.layer.cornerRadius = 10;
            peachbtn.layer.borderWidth = 8.0;
            peachbtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [peachbtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [peachbtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [peachbtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [peachbtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [peachbtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:peachbtn];
            
            UIButton *yellowbtn = [[UIButton alloc]initWithFrame:CGRectMake(17.0, 152.0, 40.0, 40.0)];
            [yellowbtn setBackgroundColor:[UIColor colorNamed:@"ButtonYellow"]];
            yellowbtn.layer.cornerRadius = 10;
            yellowbtn.layer.borderWidth = 8.0;
            yellowbtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [yellowbtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [yellowbtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [yellowbtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [yellowbtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [yellowbtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:yellowbtn];
            
            UIButton *skybluebtn = [[UIButton alloc] initWithFrame:CGRectMake(77.0, 152.0, 40.0, 40.0)];
            [skybluebtn setBackgroundColor:[UIColor colorNamed:@"ButtonSkyBlue"]];
            skybluebtn.layer.cornerRadius = 10;
            skybluebtn.layer.borderWidth = 8.0;
            skybluebtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [skybluebtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [skybluebtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [skybluebtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [skybluebtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [skybluebtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:skybluebtn];
            
            UIButton *pinkbtn = [[UIButton alloc]initWithFrame:CGRectMake(137.0, 152.0, 40.0, 40.0)];
            [pinkbtn setBackgroundColor:[UIColor colorNamed:@"ButtonPink"]];
            pinkbtn.layer.cornerRadius = 10;
            pinkbtn.layer.borderWidth = 8.0;
            pinkbtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [pinkbtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [pinkbtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [pinkbtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [pinkbtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [pinkbtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:pinkbtn];
            
            UIButton *blackbtn = [[UIButton alloc] initWithFrame:CGRectMake(197.0, 152.0, 40.0, 40.0)];
            [blackbtn setBackgroundColor:[UIColor colorNamed:@"ButtonBlack"]];
            blackbtn.layer.cornerRadius = 10;
            blackbtn.layer.borderWidth = 8.0;
            blackbtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [blackbtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [blackbtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [blackbtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [blackbtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [blackbtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:blackbtn];
            
            UIButton *darkGreenbtn = [[UIButton alloc]initWithFrame:CGRectMake(257.0, 152.0, 40.0, 40.0)];
            [darkGreenbtn setBackgroundColor:[UIColor colorNamed:@"ButtonDarkGreen"]];
            darkGreenbtn.layer.cornerRadius = 10;
            darkGreenbtn.layer.borderWidth = 8.0;
            darkGreenbtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [darkGreenbtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [darkGreenbtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [darkGreenbtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [darkGreenbtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [darkGreenbtn.layer setShadowOpacity:0.3];
            [darkGreenbtn setTag:5];
            [self.modalController.view addSubview:darkGreenbtn];
            
            UIButton *brownbtn = [[UIButton alloc] initWithFrame:CGRectMake(317.0, 152.0, 40.0, 40.0)];
            [brownbtn setBackgroundColor:[UIColor colorNamed:@"ButtonBrown"]];
            brownbtn.layer.cornerRadius = 10;
            brownbtn.layer.borderWidth = 8.0;
            brownbtn.layer.borderColor = [UIColor whiteColor].CGColor;
            [brownbtn addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
            [brownbtn.layer setShadowOffset:CGSizeMake(1, 1)];
            [brownbtn.layer setShadowOffset:CGSizeMake(-0.5, -0.5)];
            [brownbtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [brownbtn.layer setShadowOpacity:0.3];
            [self.modalController.view addSubview:brownbtn];
        }];
    }
    else {
        CGRect startingFrame = self.view.bounds;
        startingFrame.origin.y = startingFrame.size.height;
        startingFrame.size.height = 333; 

        [UIView animateWithDuration:0.5 animations:^{
            [self.modalController.view setFrame:startingFrame];
        } completion:^(BOOL finished) {
            [self.modalController.view removeFromSuperview];
            [self.modalController willMoveToParentViewController:nil];
            [self.modalController removeFromParentViewController];
            [self.modalController didMoveToParentViewController:nil];
        }];
    }
}

- (IBAction)drawButtonTapped:(UIButton * )sender {
    
    self.isChildViewControllerAdded = YES;
    self.frameVC = [[CanvasViewController alloc] init];
    self.frameVC.view.backgroundColor = [UIColor whiteColor];
    self.frameVC.firstColor = self.colors[1];
    self.frameVC.secondColor = self.colors[2];
    self.frameVC.thirdColor = self.colors[0];
    self.drawbtn.enabled = true;
    self.button.enabled = false;
    self.timerbtn.enabled = false;
    
    [self.sharebtn removeFromSuperview];
    [self.view addSubview: self.resetbtn];
    
    if (self.drawingName.length == 0){
        self.frameVC.drawingName = @"Planet";
    }
    else{
    self.frameVC.drawingName = self.drawingName;
    }
    self.frameVC.time = self.time;
    self.secondVS = [[SliderViewController alloc] init];
    self.time = self.secondVS.mySlider.value;
    
    [self addChildViewController:self.frameVC];
    self.frameVC.view.frame = CGRectMake(70.0, 120.0, 300.0, 300.0);
    [self.view addSubview:self.frameVC.view];
    [self.frameVC didMoveToParentViewController:self];
   
}

- (IBAction)timerButtonTapped:(UIButton * )sender {
    
    if (self.timerController.view.window == nil) {
        CGRect startingFrame = self.view.bounds;
        startingFrame.origin.y = startingFrame.size.height;
        startingFrame.size.height = 500;
        CGRect finalFrame = self.view.bounds;
        finalFrame.origin.y = finalFrame.size.height - 333;
        finalFrame.size.height = 333;
        
        [self.timerController.view setFrame:startingFrame];

        [self.timerController willMoveToParentViewController:self];
        [self addChildViewController:self.timerController];
        [self.view addSubview:self.timerController.view];
        [self.timerController didMoveToParentViewController:self];

        [UIView animateWithDuration:0.5 animations:^{
            [self.timerController.view setFrame:finalFrame];
            
        } completion:^(BOOL finished) {
            UIButton *drawbtn = [[UIButton alloc]initWithFrame:CGRectMake(250.0, 20.0, 91.0, 32.0)];
            [drawbtn setBackgroundColor:[UIColor whiteColor]];
            [drawbtn setTitle:@"Save" forState:UIControlStateNormal];
            drawbtn.layer.cornerRadius = 10;
            drawbtn.layer.borderWidth = 1.0;
            drawbtn.layer.borderColor = [UIColor colorNamed: @"StrokeBlack"].CGColor;
            drawbtn.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:18.0];
            [drawbtn setTitleColor:[UIColor colorNamed: @"AccentGreen"] forState:UIControlStateNormal];
            [drawbtn addTarget:self action:@selector(timerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
            [self.timerController.view addSubview:drawbtn];
            self.secondVS = [[SliderViewController alloc] init];
            self.time = self.secondVS.mySlider.value;
            self.secondVS.view.backgroundColor = [UIColor whiteColor];
            [self addChildViewController:self.secondVS];
            self.secondVS.view.frame = CGRectMake(26.0, 436.0, 300.0, 300.0);
            [self.view addSubview:self.secondVS.view];
            [self.secondVS didMoveToParentViewController:self];
        }];
    }
    else {
        CGRect startingFrame = self.view.bounds;
        startingFrame.origin.y = startingFrame.size.height;
        startingFrame.size.height = 333;

        [UIView animateWithDuration:0.5 animations:^{
            [self.timerController.view setFrame:startingFrame];
        } completion:^(BOOL finished) {
            self.time = self.secondVS.step;
            [self.secondVS.view removeFromSuperview];
            [self.secondVS willMoveToParentViewController:nil];
            [self.secondVS removeFromParentViewController];
            [self.secondVS didMoveToParentViewController:nil];
            [self.timerController.view removeFromSuperview];
            [self.timerController willMoveToParentViewController:nil];
            [self.timerController removeFromParentViewController];
            [self.timerController didMoveToParentViewController:nil];
        }];
    }
}

-(IBAction)reset:(UIButton * )sender{
    self.frameVC = [[CanvasViewController alloc] init];
    self.frameVC.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:self.frameVC];
    self.frameVC.view.frame = CGRectMake(35.0, 90.0, 400.0, 300.0);
    [self.view addSubview:self.frameVC.view];
    [self.frameVC didMoveToParentViewController:self];
    [self.view addSubview:self.sharebtn];
    [self.resetbtn removeFromSuperview];
    self.button.enabled = true;
    self.timerbtn.enabled = true;
    self.drawbtn.enabled = false;
    self.colors[0] = UIColor.blackColor;
    self.colors[1] = UIColor.blackColor;
    self.colors[2] = UIColor.blackColor;
}

-(IBAction)share:(UIButton * )sender{
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(400.0, 400.0), NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(self.view.bounds.size);
    }

    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImagePNGRepresentation(image);
    if (imageData) {
        [imageData writeToFile:@"photo.png" atomically:YES];
    } else {
        NSLog(@"error while taking photo");
    }
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}


- (IBAction)colorButton:(UIButton * )sender {
    
    UIColor *color = [sender backgroundColor];
    
    if (![self.colors containsObject:color]){
        sender.layer.borderWidth = 10.0;
        [self.modalController.view setBackgroundColor:color];
    }
    else{
        NSUInteger index = [self.colors indexOfObject: color];
        [self.colors replaceObjectAtIndex:index withObject:UIColor.blackColor];
        sender.layer.borderWidth = 8.0;
        return;
    }
    if([self.colors[0] isEqual:self.colors[1]]){
    self.colors[0] = color;
    }
    
    else if([self.colors[2] isEqual:self.colors[1]]){
        self.colors[1] = color;
    }
    else if(self.colors[2] == UIColor.blackColor){
        self.colors[2] = color;
    }
    
    else{
        [self.colors removeObjectIdenticalTo:self.colors[0]];
        [self.colors addObject: color];
    }
    
}

@end

