
# Tests, Tests, Tests

Next generation JSON versions (HanSON, SON, etc.) with comments, unquoted keys, multi-line strings, trailing commas, optional commas, and more


## Usage

How does it work?

Use the triple-dash (e.g. `---`) on its own line to separate
the next generation JSON version from the "vanilla" ye old' JSON. Example:


```
{
  listName: "Sesame Street Monsters", // note that listName needs no quotes
  content: [
    {
      name: "Cookie Monster",
      /* Note the template quotes and unescaped regular quotes in the next string */
      background: `Cookie Monster used to be a
monster that ate everything, especially cookies.
These days he is forced to eat "healthy" food.`
    }, {
      // You can single-quote strings too:
      name: 'Herry Monster',
      background: `Herry Monster is a furry blue monster with a purple nose.
He's mostly retired today.`
    },    // don't worry, the trailing comma will be ignored
   ]
}

---

{
 "listName": "Sesame Street Monsters",
 "content":
  [{"name": "Cookie Monster",
    "background":
     "Cookie Monster used to be a\nmonster that ate everything, especially cookies.\nThese days he is forced to eat \"healthy\" food."},
   {"name": "Herry Monster",
    "background":
     "Herry Monster is a furry blue monster with a purple nose.\nHe's mostly retired today."}
  ]
}
```

(Source: [`hanson/sample1.txt`](https://github.com/datatxt/json-next-tests/blob/master/hanson/sample1.txt))


## Run Tests

Use

```
ruby -I ./test test/test_json_next.rb
```

to run selected / individual test or to run
all tests

```
rake          # or
rake test
```


Resulting in:

```
...
...

Finished in 5.104933s, 0.1959 runs/s, 79.1391 assertions/s.

1 runs, 404 assertions, 0 failures, 0 errors, 0 skips
```
