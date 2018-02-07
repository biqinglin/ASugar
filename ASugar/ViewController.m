//
//  ViewController.m
//  ASugar
//
//  Created by lin on 2018/2/7.
//  Copyright © 2018年 biqinglin. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Student *student = [[Student alloc] init];
    NSLog(@"all = %@\n",student.all);
    student.name(@"jack").age(@(19)).adult(@(YES)).sex(@"M").height(@(180.3));
    NSLog(@"all = %@",student.all);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
