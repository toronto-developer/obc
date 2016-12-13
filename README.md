# Overbond Challenge

This submission includes two scripts: `spread_to_benchmark.rb` and
`spread_to_curve.rb`. Both scripts will accept input via STDIN. Example usage
can be found below.

## Requirements

You will need `ruby` and `bundler` in order to run these scripts.

Install required gems:
```
$ bundle install
```

## Usage

You can pipe data from a file to one of the scripts like so:
```
$ cat sample_file.csv | bundle exec ruby spread_to_benchmark.rb
```

You can also pipe data from an external file on the web:
```
$ curl -s "https://gist.githubusercontent.com/apotapov/3118c573df2a4ac7a93f00cf39ea620a/raw/4249139f4c81db31cfaf1501504993ce918899fb/sample_input.csv" | bundle exec ruby spread_to_curve.rb
```

## Approach

I wanted to create very simple scripts to take in the data, do the required
manipulations and simply print the output. I opted to forgo any fancy tricks
and unecessary abstractions. My hope was for a clean and concise script that
is easy to follow. You will also notice the use of the `interpolate` gem that
does the interpolation calculations for the curve.
