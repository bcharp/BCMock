This BCMock stuff is there for some reason.
It's highly inspire on OCMock.
This is also clearly myself re inventing the wheel. 
I wanted to do a "stub" and see how it can be done.
The first commit as only one method : 
 [mock when:@selector(oneParameter:) jumpTo:@selector(hello) On:other];
This is far from OcMock and will never compete, thats not the idea, the idea is to keep it simple, light, few explicit functionality like :

-  test objects parsing using local files instead of webservices.

For now , it's a beginning it works like this : 

    Other *other = [[Other alloc] init];
    BCMock *mock = [[BCMock alloc] initWithClass:[Test class]];
    [mock when:@selector(oneParameter:) jumpTo:@selector(hello) On:other];           
    [mock oneParameter:@"test"];

What does that mean ???

I create my mock with a class, Test, so when I will call method on the object mock, there will be redirect to an object Test, meaning :
 
[mock oneParameter:@"test"];

is equivalent to : 

Test *test = [[Test alloc] init];
[test oneParameter:@"test"];
(note : that may currently not working so well)

But here there is another line : 

 [mock when:@selector(oneParameter:) jumpTo:@selector(hello) On:other];       

Means : when (and if) I call oneParameter: on my mock object, instead I will call "hello" on the object "other". 

That helps me resolve my user story, cause I can call that on my service object and say no you won't call parsingWithResultOfRequest:, you will call 
parseMyLocalFile:

This is a work in progress, if you have any suggestion send me an email at boris.charpentier@gmail.com

And by the way this is unspecified licence cause I'm tired and licensing stuff is a bit complicated, I don't do any guarantee whatsoever, use it as you want, but please send me an email if your using it in a project. 


 
