# What is this?

This is a ruby server and UI for finding rhyming lyrics. For example:

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

You can see it live at [http://agile-bayou-98137.herokuapp.com](agile-bayou-98137.herokuapp.com)

# Development

This is a ruby project written with sinatra. I made several valiant
attempts to port it to pure Javascript, but the libraries just don't
exist in npm. I even tried porting the libraries using opal.rb, but that
created a whole new set of challenges. I would really love it if this
didn't require a backend.

```
bundle
bundle exec ruby sweater.rb
```

