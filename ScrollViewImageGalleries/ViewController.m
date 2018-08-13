//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Bennett on 2018-08-13.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    [imageView1 setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    [imageView2 setFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    
    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse"]];
    [imageView3 setFrame:CGRectMake(0, self.view.frame.size.height*2, self.view.frame.size.width, self.view.frame.size.height)];
 
    CGFloat galleryWidth = imageView1.frame.size.width + imageView2.frame.size.width + imageView3.frame.size.width ;
    CGFloat gallerHeight = imageView1.frame.size.height + imageView2.frame.size.height + imageView3.frame.size.height ;
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, galleryWidth, gallerHeight)];
    [subView addSubview:imageView1];
    [subView addSubview:imageView2];
    [subView addSubview:imageView3];
    
    [self.scrollView addSubview:subView];
    self.scrollView.contentSize = subView.frame.size;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
