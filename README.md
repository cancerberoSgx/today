# today

Command line tool for daily work TODO lists and calendar visualization.

# Usage

## List today's TODOs

```
$ today
 1 [x] brush my teeth
 2 [ ] review PR 1234
 3 [ ] reply John email
```

On a daily basis, the first time the user executes `today` a new TODO list will be created containing yesterday's non-checked TODOs.

## Add a new TODO for today

```
$ today add "optimize addToCart()"
 1 [x] brush my teeth
 2 [ ] review PR 1234
 3 [ ] reply John email
 4 [ ] optimize addToCart()
```

Note: if user enters `today add` it will be prompted for the new TODO title.

## Check a TODO

```
$ today check 2
 1 [x] brush my teeth
 2 [x] review PR 1234
 3 [ ] reply John email
 4 [ ] optimize addToCart()
```

Note: to check all TODOs enter `today check all`.

## Share today's TODO by email (TODO)

```
$ today share foo@bar.com
An email with today's TODOs was send to foo@bar.com
```

Note: is user enters `today share` it will be inquired with the email address(es).

## Show today's calendar (TODO)

```
$ today calendar
 10:00 - 10:15 Sync Onboarding (Wye-planta baja-Sonic)
 ---------------------------------------------------------------------
 11:00 - 12:00 Meet Jose Ignacio (Wye-garage-Zelda)
 15:00 - 15:30 Customer X, Feature Y discussion (https://meet.google.com/_meet/eff-ntjs-sxm?hs=122)
```

# TODO

 * merge past unchecked TODOs in today's new day file
 * multiple sessions 
   * same file contains array of Today
   * `today set dev` sets a session ('dev') for future commands
   * `today -s person add 'call ma'` exec command with session 'person'
 * time
   * `today +1 add 'PR 12345'` (adds a TODO for tomorrow)
   * today calendar -1 (yesterday's calendar)
   * today --next friday add 'buy sister gift'

# Ideas


# Original project notes

## Motivation

> Con el objetivo de poner en práctica los valores *"Doy lo mejor de mi y busco superarme"* y *"Me animo a cosas nuevas y veo en cada situación una oportunidad"*, comenzar a construir la aplicación `today` en `ruby` , un lenguaje no conocido para mi, a modo de generar nuevos aprendizajes producto de salir de mi zona de confort.

## Scope

`today calendar` only makes sense if it uses google calendar for which user needs to provide credentials. I would leave this feature once I finish the "TODO" feature.

Nice to have: optionally synchronize today's TODO with trello instead of keeping the info locally.

Nice to have: if user gives an extra number argument, the action will apply to other day than today, for example `today calendar 1` will show tomorrow's activities, or, `today -1` will show yesterday's TODOs.

## What did I learn?

 * basic ruby syntax, class declaration, inheritance, control statements, array manipulations
 * Gemfile, bundler, dependencies, libraries
 * ansi, erb, command line args processing, google api, rubywatcher for TDD