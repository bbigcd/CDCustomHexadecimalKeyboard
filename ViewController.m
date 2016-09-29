//
//  ViewController.m
//  CDCustomHexadecimalKeyboard
//
//  Created by bbigcd on 16/9/29.
//  Copyright © 2016年 chendi. All rights reserved.
//

#import "ViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

typedef NS_ENUM(NSInteger, HexNumberType) {
    HexNumberTypeD = 100,
    HexNumberTypeE = 200,
    HexNumberTypeF = 300,
    HexNumberTypeA = 400,
    HexNumberTypeB = 500,
    HexNumberTypeC = 600,
    HexNumberTypeOne = 700,
    HexNumberTypeTwo = 800,
    HexNumberTypeThree = 900,
    HexNumberTypeFour = 1000,
    HexNumberTypeFive = 1100,
    HexNumberTypeSix = 1200,
    HexNumberTypeSeven = 1300,
    HexNumberTypeEight = 1400,
    HexNumberTypeNine = 1500,
    HexNumberTypeDelete = 1600,
    HexNumberTypeZero = 1700,
    HexNumberTypeDone = 1800
};


@interface ViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self writeDataMethod];
    
    [self performSelector:@selector(textFieldBecomeFisrtResponder) withObject:nil afterDelay:0.5f];
}

#pragma mark --UIViewController--

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}

- (void)textFieldBecomeFisrtResponder
{
    [self.textField becomeFirstResponder];
}

- (void)writeDataMethod
{
    CGRect frame = CGRectMake(15, 100, ScreenWidth - 30, 40);
    self.textField = [[UITextField alloc] initWithFrame:frame];
    self.textField.layer.cornerRadius = 10;
    self.textField.layer.masksToBounds = YES;
    [self.textField setPlaceholder:@"0x00"];
    self.textField.backgroundColor = [UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:1.00];
    self.textField.delegate = self;
    self.textField.inputView = [self setupInPutView];
    [self.view addSubview:self.textField];
    
}

- (UIView *)setupInPutView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 250, ScreenWidth, ScreenHeight - 250)];
    CGFloat width = (ScreenWidth - 4) / 3;
    CGFloat height = (ScreenHeight - 257) / 6;
    
    CGFloat firstX = 1;
    CGFloat secondX = width + 2;
    CGFloat thirdX = 2 * width + 3;
    
    CGFloat firstY = 1;
    CGFloat secondY = height + 2;
    CGFloat thirdY = 2 * height + 3;
    CGFloat fourthY = 3 * height + 4;
    CGFloat firthY = 4 * height + 5;
    CGFloat sixY = 5 * height + 6;
    
    UIColor *blackColor = [UIColor blackColor];
    UIColor *darkGrayColor = [UIColor darkGrayColor];
    UIColor *color = [UIColor colorWithRed:0.80 green:0.82 blue:0.64 alpha:1.00];
    UIColor *numberColor = [UIColor colorWithRed:0.86 green:0.86 blue:0.86 alpha:1.00];
    UIColor *titleNormalColor = [UIColor colorWithRed:0.07 green:0.51 blue:0.97 alpha:1.00];
    UIColor *titleHightLigntColor = [UIColor colorWithRed:0.07 green:0.51 blue:0.97 alpha:0.5];
    UIColor *deleteAndDoneBackgroundColor  = [UIColor colorWithRed:0.59 green:0.62 blue:0.62 alpha:1.00];
    
    NSArray *arrayColor1 = @[color,titleNormalColor,titleHightLigntColor];
    NSArray *arrayColor2 = @[numberColor,blackColor,darkGrayColor];
    NSArray *arrayColor3 = @[deleteAndDoneBackgroundColor,blackColor,darkGrayColor];
    
    UIButton *but1 = [self setupHexButton:HexNumberTypeD title:@"D" pointX:firstX pointY:firstY color:arrayColor1];
    UIButton *but2 = [self setupHexButton:HexNumberTypeE title:@"E" pointX:secondX pointY:firstY color:arrayColor1];
    UIButton *but3 = [self setupHexButton:HexNumberTypeF title:@"F" pointX:thirdX pointY:firstY color:arrayColor1];
    
    UIButton *but4 = [self setupHexButton:HexNumberTypeA title:@"A" pointX:firstX pointY:secondY color:arrayColor1];
    UIButton *but5 = [self setupHexButton:HexNumberTypeB title:@"B" pointX:secondX pointY:secondY color:arrayColor1];
    UIButton *but6 = [self setupHexButton:HexNumberTypeC title:@"C" pointX:thirdX pointY:secondY color:arrayColor1];
    
    UIButton *but7 = [self setupHexButton:HexNumberTypeSeven title:@"7" pointX:firstX pointY:thirdY color:arrayColor2];
    UIButton *but8 = [self setupHexButton:HexNumberTypeEight title:@"8" pointX:secondX pointY:thirdY color:arrayColor2];
    UIButton *but9 = [self setupHexButton:HexNumberTypeNine title:@"9" pointX:thirdX pointY:thirdY color:arrayColor2];
    
    UIButton *but10 = [self setupHexButton:HexNumberTypeFour title:@"4" pointX:firstX pointY:fourthY color:arrayColor2];
    UIButton *but11 = [self setupHexButton:HexNumberTypeFive title:@"5" pointX:secondX pointY:fourthY color:arrayColor2];
    UIButton *but12 = [self setupHexButton:HexNumberTypeSix title:@"6" pointX:thirdX pointY:fourthY color:arrayColor2];
    
    UIButton *but13 = [self setupHexButton:HexNumberTypeOne title:@"1" pointX:firstX pointY:firthY color:arrayColor2];
    UIButton *but14 = [self setupHexButton:HexNumberTypeTwo title:@"2" pointX:secondX pointY:firthY color:arrayColor2];
    UIButton *but15 = [self setupHexButton:HexNumberTypeThree title:@"3" pointX:thirdX pointY:firthY color:arrayColor2];
    
    UIButton *but16 = [self setupHexButton:HexNumberTypeDelete title:@"Delete" pointX:firstX pointY:sixY color:arrayColor3];
    UIButton *but17 = [self setupHexButton:HexNumberTypeZero title:@"0" pointX:secondX pointY:sixY color:arrayColor2];
    UIButton *but18 = [self setupHexButton:HexNumberTypeDone title:@"Done" pointX:thirdX pointY:sixY color:arrayColor3];
    
    
    [view addSubview:but1];
    [view addSubview:but2];
    [view addSubview:but3];
    
    [view addSubview:but4];
    [view addSubview:but5];
    [view addSubview:but6];
    
    [view addSubview:but7];
    [view addSubview:but8];
    [view addSubview:but9];
    
    [view addSubview:but10];
    [view addSubview:but11];
    [view addSubview:but12];
    
    [view addSubview:but13];
    [view addSubview:but14];
    [view addSubview:but15];
    
    [view addSubview:but16];
    [view addSubview:but17];
    [view addSubview:but18];
    view.backgroundColor = [UIColor grayColor];
    
    return view;
}

//提取重复代码
- (UIButton *)setupHexButton:(HexNumberType)hexNumberType
                       title:(NSString *)title
                      pointX:(CGFloat)pointX
                      pointY:(CGFloat)pointY
                       color:(NSArray *)colorArray
{
    CGRect frame;
    CGFloat titleFontSize;
    CGFloat width = (ScreenWidth - 4) / 3;
    CGFloat height = (ScreenHeight - 257) / 6;
    frame.origin.x = pointX;
    frame.origin.y = pointY;
    frame.size = CGSizeMake(width, height);
    if (hexNumberType == HexNumberTypeDelete || hexNumberType == HexNumberTypeDone) {
        titleFontSize = 20;
    }else{
        titleFontSize = 30;
    }
    
    UIColor *backgroundColor = colorArray[0];
    UIColor *normalTitleColor = colorArray[1];
    UIColor *selectedTitleColor = colorArray[2];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTag:hexNumberType];
    [button setFrame:frame];
    [button setBackgroundColor:backgroundColor];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:titleFontSize];
    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
    [button setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}


- (void)buttonClick:(UIButton *)sender
{
    NSString *string = nil;
    switch (sender.tag) {
        case HexNumberTypeD:
            string = @"D";
            break;
        case HexNumberTypeE:
            string = @"E";
            break;
        case HexNumberTypeF:
            string = @"F";
            break;
        case HexNumberTypeA:
            string = @"A";
            break;
        case HexNumberTypeB:
            string = @"B";
            break;
        case HexNumberTypeC:
            string = @"C";
            break;
        case HexNumberTypeSeven:
            string = @"7";
            break;
        case HexNumberTypeEight:
            string = @"8";
            break;
        case HexNumberTypeNine:
            string = @"9";
            break;
        case HexNumberTypeFour:
            string = @"4";
            break;
        case HexNumberTypeFive:
            string = @"5";
            break;
        case HexNumberTypeSix:
            string = @"6";
            break;
        case HexNumberTypeOne:
            string = @"1";
            break;
        case HexNumberTypeTwo:
            string = @"2";
            break;
        case HexNumberTypeThree:
            string = @"3";
            break;
        case HexNumberTypeDelete:
        {
            // 这里只能删除最后一个字段
            if (self.textField.text.length > 0) {
                self.textField.text = [self.textField.text substringToIndex:self.textField.text.length-1];
            }
        }
            break;
        case HexNumberTypeZero:
            string = @"0";
            break;
        case HexNumberTypeDone:
        {
            
        }
            break;
            
        default:
            break;
    }
    if (sender.tag != 1600 && sender.tag != 1800) {
        [self.textField insertText:string];
    }
}

#pragma mark --UITextFieldDelegate--

@end
