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
@property (strong, nonatomic) NSMutableArray <UIImageView *> *imageViews;

@property (strong, nonatomic) NSArray <NSString*> *imageNames;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)setupImageViews {
    self.imageNames = @[@"Lighthouse", @"Lighthouse-night", @"Lighthouse-in-Field"];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageViews = [[NSMutableArray alloc]init];
    
    for (int i=0; i > [self.imageNames count]; i++)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageNames[i]]];
        [imageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [imageView setUserInteractionEnabled:YES];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(launchDetailImageView:)];
        [imageView addGestureRecognizer:gesture];
        
        [self.imageViews addObject:imageView];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupImageViews];
 
    CGFloat galleryWidth = self.view.frame.size.width * [self.imageViews count];
    
    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, galleryWidth, self.view.frame.size.height)];

    for (int i=0; i< [self.imageViews count]; i++)
    {
        [subView addSubview:self.imageViews[i]];
    }
    
    
    [self.scrollView addSubview:subView];
    self.scrollView.contentSize = subView.frame.size;
    [self.scrollView setPagingEnabled: YES];
    
    
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    [self.view bringSubviewToFront:self.pageControl];
    
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
        
        for (int i=0; i< [self.imageViews count]; i++)
        {
            if (self.imageViews[i] == imageView)
            imageName = self.imageNames[i];
        }
        
        [self performSegueWithIdentifier:@"showImageDetail" sender:imageName];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showImageDetail"]){
        ImageDetailViewController *imageDetailViewController = segue.destinationViewController;
        imageDetailViewController.imageName = sender;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int pageIndex = round(self.scrollView.contentOffset.x/self.view.frame.size.width);
    self.pageControl.currentPage = pageIndex;
}
- (IBAction)changePage:(UIPageControl *)sender {
    NSInteger page = sender.currentPage;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}

@end
