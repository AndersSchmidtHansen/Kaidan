**Version: Experimental Beta, still use with caution!**

![Kaidan Logo: Attribution goes to 7Soul1 at http://7soul1.deviantart.com/](http://i57.tinypic.com/snmn10.png "Kaidan Logo: Attribution goes to 7Soul1 at http://7soul1.deviantart.com/") Kaidan (怪談 : "Ghost Story")
==============================

Boilerplate Factory for Ghost Theme Development.

Craft your [Ghost](https://ghost.org/) themes with the simplicity of [Slim](slim-lang.com), flexibility of [Sass](sass-lang.com) and the expressiveness of [CoffeeScript](coffeescript.org). Oh, and Kaidan live reloads across multiple devices and browsers thanks to [BrowserSync](www.browsersync.io). How cool is that!

Kaidan is very minimal and is meant to be extended and use as a starting point. Therefore, every Kaidan theme looks [like this](http://www.andersschmidt.com/Kaidan/) in the beginning.

Why?
-------------------
I love the whole concept behind Ghost and the potential of it as a fast and simple blogging platform; it just gets things done!

Naturally, I'd want to use the tools I use every day for development (Slim, Sass, CoffeeScript etc.) when making Ghost themes, so that's why I made Kaidan. As simple as that.

You might like it too, or you might benefit more from rolling your own framework. In any case, have fun creating awesome themes for an awesome blogging platform!

How?
--------------------

I will assume that you already know Ghost and at least have tried tinkering with a Ghost theme before, meaning that you do have `npm` installed. I also assume that you already have Ruby and Sass installed, otherwise follow ["Installing Ruby"](https://gorails.com/setup/ubuntu/14.04) and then run `$ gem install sass` in your terminal.

From there, getting Kaidan is just a matter of downloading, running a few commands and having a little patience.

First, download Kaidan to your Ghost's `theme` folder:
```
$ git clone git@github.com:AndersSchmidtHansen/Kaidan.git Kaidan
```

Of course, you can replace "Kaidan" with whatever you're going to name your theme. Go into your newly downloaded folder, open your terminal and run:

```
$ sudo npm install --save-dev
```

This will download all the node modules and plugins necessary for Kaidan to do it's thing. It will take a little time, so sip some coffee or tea.

When done, everything should be ready to go. To see if things are working, switch your current theme to Kaidan inside your Ghost's settings and run this in your terminal:

```
$ gulp
```

If your browser opens up, saying BrowserSync connected and you see a very barebones frontpage you're good to go!

Folder Structure
---------------------------------
Kaidan follows the following folder structure:
```
assets
documentation
partials
src (you work in here!)
  | assets
    | coffeescript
    | sass (follows MVCSS principles)
      | components
      | foundation
        _base.scss
        _config.scss
        _helpers.scss
        _reset.scss
        _tools.scss
      | structures
      theme.scss (acts as an importer)
  | config
    gulpfile.coffee
  | layouts
    master.slim
  | partials
    footer.slim
    header.slim
    meta.slim
  index.slim
  page.slim
  post.slim
  tag.slim

index.hbs
page.hbs
post.hbs
tag.hbs
```

Creating a README.pdf for documentation
-------------------------------------------------
It's not unlikely that some of you will use Kaidan to create themes for commercial use, e.g. sell them on ThemeForest. Therefore I want to make it a little easier for you to generate a README.pdf from the included README.md file. To do this, run this command:

```
$ gulp document
```
This will output a "README.pdf" in the `documentation` folder, ready to be shipped to a marketplace.


Creating a `theme.zip` file for marketplaces
-------------------------------------------------
Similar to creating README.pdf, Kaidan also includes a `package` command that takes all files (excluding the "node_modules" folder) and neatly packages them into one `theme.zip` file. Use this .zip when uploading to a marketplace like ThemeForest and similar. To do this, run this command:
```
$ gulp package
```


Quirks & "Good-to-knows"
---------------------------------

1. **If something doesn't update when you hit save, hit save again.** BrowserSync normally refreshes instantly, but in this setup it might not always do so. I am researching this, but for now, just hit save once more.

2. **If something REALLY doesn't update, restart Ghost and run Gulp again or reload the page manually.** Very rarely, files within Kaidan didn't update regardless of what I did, but after either a manual refresh or restarting both Ghost and Gulp, things worked again.

3. **If you add a new file, you need to restart Gulp.** Gulp doesn't know when new files are added or deleted, so you have to restart Gulp when you do so. There are solutions to this and I'm looking into that.

4. **Handlebars.js and Slim like each other, just not as much as you'd want.** Slim handles curly brackets in a funny way and you need to keep two things in mind if, say a `{{@blog.title}}` etc. doesn't appear. First, **conditionals and loops need to start with a `|` character.** Second, **study `index.slim` to learn how inserting content tags works**.




