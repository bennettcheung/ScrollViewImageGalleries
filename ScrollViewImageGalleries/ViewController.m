//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Bennett on 2018-08-13.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (strong, nonatomic) UIImageView *imageView3;

@property (strong, nonatomic) NSString* imageName1;
@property (strong, nonatomic) NSString* imageName2;
@property (strong, nonatomic) NSString* imageName3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageName1 = @"Lighthouse";
    self.imageName2 = @"Lighthouse-night";
    self.imageName3 = @"Lighthouse-in-Field";
    // Do any additional setup after loading the view, typically from a nib.
  
    self.imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageName1]];
    [self.imageView1 setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.imageView1 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *gesture1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(launchDetailImageView:)];
    [self.imageView1 addGestureRecognizer:gesture1];
    
    self.imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageName2]];
    [self.imageView2 setFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.imageView2 setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *gesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(launchDetailImageView:)];
    [self.imageView2 addGestureRecognizer:gesture2];
    
    self.imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageName3]];
    [self.imageView3 setFrame:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.imageView3 setUserInteractionEnabled:YES];
    UITapGestureRecognizer *gesture3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(launchDetailImageView:)];
    [self.imageView3 addGestureRecognizer:gesture3];
 
    CGFloat galleryWidth = self.imageView1.frame.size.width + self.imageView2.frame.size.width + self.imageView3.frame.size.width ;
    CGFloat gallerHeight = self.imageView1.frame.size.height + self.imageView2.frame.size.height + self.imageView3.frame.size.height ;
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, galleryWidth, gallerHeight)];
    [subView setUserInteractionEnabled:YES];
    [subView addSubview:self.imageView1];
    [subView addSubview:self.imageView2];
    [subView addSubview:self.imageView3];
    
    
    [self.scrollView addSubview:subView];
    self.scrollView.contentSize = subView.frame.size;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)launchDetailImageView:(UIGestureRecognizer *)sender{
    
    if ([sender isKindOfClass:[UITapGestureRecognizer class]])
    {
        UIImageView* imageView = (UIImageView*)sender.view;
     
        NSString* imageName = @"";
        if (imageView == self.imageView1)
            imageName = self.imageName1;
        else if (imageView == self.imageView2)
            imageName = self.imageName2;
        else if (imageView == self.imageView3)
            imageName = self.imageName3;
        [self performSegueWithIdentifier:@"showImageDetail" sender:imageName];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showImageDetail"]){
        ImageDetailViewController *imageDetailViewController = segue.destinationViewController;
        imageDetailViewController.imageName = sender;
    }
}

@end
