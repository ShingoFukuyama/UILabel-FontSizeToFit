//
//  ViewController.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+FontSizeToFit.h"

@interface ViewController ()
@property (nonatomic, copy) NSArray <NSString *> *words;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.1f alpha:1.0f];
    
    self.words = @[@"apple", @"orange", @"banana", @"grape", @"kiwi", @"mango", @"lychee", @"lemon", @"coconut", @"pear", @"pineapple", @"peach", @"strawberry", @"fig", @"lime", @"papaya", @"nectarine", @"plum", @"quince", @"raspberry", @"ohajiki", @"watermelon", @"blackberry", @"cherry", @"avocado"];

    // Setup UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 300.0f, 100.0f)];
    self.label = label;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = self.words[0];
    label.font = [UIFont systemFontOfSize:50.0f];
    label.textColor = [UIColor whiteColor];
    label.layer.borderWidth = 2.0;
    label.layer.borderColor = [UIColor redColor].CGColor;
    label.layer.cornerRadius = 3.0f;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:label];
    label.center = self.view.center;
    
    // Start Demo Loop
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.7 target:self selector:@selector(addWord1) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)addWord1
{
    // Simply add word to label
    NSInteger random = arc4random() % self.words.count;
    NSString *fruit = self.words[random];
    NSString *newText = [NSString stringWithFormat:@"%@ %@", self.label.text, fruit];
    self.label.text = newText;
    [self.label fontSizeToFit];
}

- (void)addWord2
{
    // Add word which with lineSpacing
    NSInteger random = arc4random() % self.words.count;
    NSString *fruit = self.words[random];
    NSString *newText = [NSString stringWithFormat:@"%@ %@", self.label.text, fruit];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 5.0f;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName:paragraph};
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:newText attributes:attributes];
    self.label.attributedText = attributedText;
    [self.label fontSizeToFit];
}


@end
