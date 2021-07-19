//
//  CanvasViewController.h
//  Task8
//
//  Created by Дарья Воробей on 7/17/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CanvasViewController <NSObject>

@required
- (void)colorButton:(UIButton *)sender;

@end


@interface CanvasViewController : UIViewController

@property (nonatomic, strong) UIColor *firstColor;
@property (nonatomic, strong) UIColor *secondColor;
@property (nonatomic, strong) UIColor *thirdColor;
@property (nonatomic, strong) NSString *drawingName;
@property (nonatomic) float time;

@end

NS_ASSUME_NONNULL_END
