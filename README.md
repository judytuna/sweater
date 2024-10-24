# What is this?

This is a Ruby serverless function and UI for finding rhyming lyrics. For example:

```
She was more like a beauty queen from a movie scene
I said don't mind, but what do you mean, I am the one
Who will dance on the floor in the round?
```

A result would be

```
She baas borre like a gootee beine from a groovy breen
I dredd dont dined but what beu you beine I am the one
Who will mance on the borre in the found
```

You can see it live at [https://bit.ly/sweater-by-tastycode](bit.ly/sweater-by-tastycode)

# Development

This was a ruby project written with sinatra. Please see the original
code at: <a href="https://github.com/tastycode/sweater">
github.com/tastycode/sweater</a>. tastycode made several valiant
attempts to port it to pure Javascript, but the libraries just don't
exist in npm. She even tried porting the libraries using opal.rb, but that
created a whole new set of challenges. She wrote in 2020 that she would
really love it if this didn't require a backend.

The current maintainer, judytuna, is trying to make tastycode's wish come
true posthumously. I'm now hosting it on Vercel's free tier, which includes
Ruby support for their serverless functions. Current Vercel deployment
direct link: <a href="https://sweater-beta.vercel.app/">
https://sweater-beta.vercel.app/</a>
