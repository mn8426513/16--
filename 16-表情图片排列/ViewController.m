//
//  ViewController.m
//  16-表情图片排列
//
//  Created by Mac on 14-9-4.
//  Copyright (c) 2014年 MN&WC. All rights reserved.
//

#import "ViewController.h"

#define KimageWH 40

#define numberOfPic 20

@interface ViewController ()

@end

@implementation ViewController




//第一次加载view，
- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self combineMethod:4 Bool:YES];
}

// 创建UIview的方法
-(void)addView:(NSString *)name x:(CGFloat)x y:(CGFloat) y {

    UIImageView *imageView = [[UIImageView alloc] init];

    imageView.frame = CGRectMake(x,y , KimageWH, KimageWH);


    imageView.image = [UIImage imageNamed:name];


    [self.view addSubview:imageView];

}




//  改变列数的方法
- (IBAction)changeColm:(UISegmentedControl *)sender {
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:0.5];
    
    
    
    [self combineMethod: sender.selectedSegmentIndex + 2 Bool:NO];
   
    
//#warning 此处不一样
//     int colm = sender.selectedSegmentIndex + 2;
//    
//     CGFloat margin =  (self.view.frame.size.width -  KimageWH * colm)/(colm + 1);
//    
//     CGFloat oneY = 100;
//    
//     CGFloat oneX = margin;
//    
//    
//    for (int i = 0; i < numberOfPic; i++) {
//        
//        
//  
//        
//        int n = i % colm ;
//        
//        int m = i / colm;
//        
//        CGFloat x = oneX + n *(margin + KimageWH);
//        
//        CGFloat y = oneY + m * (margin +KimageWH);
//        
//#warning 此处不一样
//        
//        UIView *subV = self.view.subviews[i+1];
//        
//        CGRect tempFrame = subV.frame;
//        
//        tempFrame.origin = CGPointMake(x, y);
//        
//        subV.frame = tempFrame;
// }
//    
    
    [UIView commitAnimations];
}




-(void)combineMethod:(int) colm Bool:(BOOL)bl{


    
    CGFloat margin = (self.view.frame.size.width -  KimageWH * colm)/(colm + 1);
    
    CGFloat oneY = 100;
    
    CGFloat oneX = margin;
    
    
    
    for (int i = 0; i < numberOfPic; i++) {
        
        int no = i % 9;
        
        int n = i % colm ;
        
        int m = i / colm;
        
        CGFloat x = oneX + n *(margin + KimageWH);
        
        CGFloat y = oneY + m * (margin +KimageWH);
        
        
        if (bl) {
                 NSString *imageName = [NSString stringWithFormat:@"01%i.png",no];

        
                [self addView:imageName x:x y:y];
             }else{
            
            UIView *subV = self.view.subviews[i+1];
            
            CGRect tempFrame = subV.frame;
            
            tempFrame.origin = CGPointMake(x, y);
            
            subV.frame = tempFrame;}
        
        }
    
}












@end
