//
//  ViewController.m
//  Painting
//
//  Created by Fukazawa kota on 2015/05/16.
//  Copyright (c) 2015年 Kota Fukazawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *canvas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clear:(id)sender {
    
    self.canvas.image =[UIImage imageNamed:@"canvas"];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch =[touches anyObject];
    CGPoint previouspoint = [touch previousLocationInView:self.canvas];
    CGPoint currentPoint = [touch locationInView:self.canvas];
    
    UIGraphicsBeginImageContextWithOptions(self.canvas.frame.size,YES,0.0);
    CGContextRef c = UIGraphicsGetCurrentContext();
    [self.canvas.image drawInRect:self.canvas.bounds];
    CGContextSetLineWidth(c  , 10.0);
    CGContextSetStrokeColorWithColor(c , [UIColor redColor].CGColor);
    CGContextSetLineCap(c, kCGLineCapRound);
    CGContextMoveToPoint(c , currentPoint.x, previouspoint.y);
    CGContextAddLineToPoint(c , currentPoint.x,currentPoint.y);
    CGContextStrokePath(c);
    self.canvas.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    
}

@end
