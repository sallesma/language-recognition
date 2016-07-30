# README

## Code status

[![Build Status](https://travis-ci.org/sallesma/markov-language.svg?branch=master)](https://travis-ci.org/sallesma/markov-language)

Just trying out stuff about markov chains to determine the language of a text

### Train
```
http://localhost:3000/training.json?text=<text>&locale=<locale>
```
or using a task to fetch random articles on wikipedia:
```
rake auto_train_from_wikipedia en 3
```
where en is the locale and 3 the number or articles to fetch from wikipedia


### Identify
```
http://localhost:3000/identify.json?text=<text>
```
