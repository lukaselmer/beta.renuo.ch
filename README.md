# Renuo Website

[![Build Status](https://travis-ci.org/renuo/beta.renuo.ch.svg?branch=master)](https://travis-ci.org/renuo/beta.renuo.ch)
[![Build Status](https://travis-ci.org/renuo/beta.renuo.ch.svg?branch=develop)](https://travis-ci.org/renuo/beta.renuo.ch)
[![Build Status](https://travis-ci.org/renuo/beta.renuo.ch.svg?branch=testing)](https://travis-ci.org/renuo/beta.renuo.ch)
[![Build Status](https://travis-ci.org/renuo/beta.renuo.ch.svg?branch=compare1)](https://travis-ci.org/renuo/beta.renuo.ch)
[![Build Status](https://travis-ci.org/renuo/beta.renuo.ch.svg?branch=compare2)](https://travis-ci.org/renuo/beta.renuo.ch)
[![Build Status](https://travis-ci.org/renuo/beta.renuo.ch.svg?branch=compare3)](https://travis-ci.org/renuo/beta.renuo.ch)
[![Build Status](https://travis-ci.org/renuo/beta.renuo.ch.svg?branch=compare4)](https://travis-ci.org/renuo/beta.renuo.ch)

## Environments (branch, URL)

* master <https://www.renuo.ch>
* develop <https://new.renuo.ch>
* testing <https://new-testing.renuo.ch>
* compare1 <https://new-compare1.renuo.ch>
* compare2 <https://new-compare2.renuo.ch>
* compare3 <https://new-compare3.renuo.ch>
* compare4 <https://new-compare4.renuo.ch>

## Requirements

* nvm <https://github.com/creationix/nvm>
* nodejs
* npm

## Installation

```sh
git clone https://github.com/renuo/beta.renuo.ch.git
cd beta.renuo.ch
bin/setup
```

## Checks / "Tests"

```sh
bin/check
```

This runs

* keyword check (console.log, T0D0, puts, ...)
* mdl
* generate the project, abort if there are errors or warnings

## Run

```sh
bin/run
```

## Build / Generate Website

```sh
docpad generate
```

## Copyright

Copyright 2016 [Renuo AG](https://www.renuo.ch/).
