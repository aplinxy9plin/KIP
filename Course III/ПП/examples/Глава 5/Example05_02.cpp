﻿#include <iostream>
#include <cstdio>
using namespace std;
int main()
{
    char str[100];
    cout << "Enter your text, please: ";
    //Для считывания строки использована функция gets():
    gets(str);
    cout << "Your text is: " << str << endl;
    return 0;
}

Format!Style:
C++ online code formatter © 2014 by KrzaQ

Powered by vibe.d, the D language and clang-format