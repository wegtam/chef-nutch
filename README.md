# Nutch Cookbook

[![Apache License 2.0](http://img.shields.io/badge/license-apache%202.0-green.svg)](http://opensource.org/licenses/Apache-2.0)

This cookbook fetches our nutch distribution and prepares it for running on hadoop.


## Requirements

You should have a working hadoop configuration and all prequisites for nutch.


## Attributes

You can set options in `nutch.nutch-site` that will be written into `nutch-site.xml`.

The following attributes are provided with defaults:

#### nutch::default['nutch']['nutch-site']
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>http.agent.name</tt></td>
    <td>String</td>
    <td>Name for the nutch spider.</td>
    <td><tt>Nutch Spider</tt></td>
  </tr>
  <tr>
    <td><tt>plugin.includes</tt></td>
    <td>String</td>
    <td>Plugins to load</td>
    <td><pre><code>protocol-(file|http)|urlfilter-regex|parse-(html|tika|metatags)|index-(basic|anchor|metadata)|scoring-opic|urlnormalizer-(pass|regex|basic)</code></pre></td>
  </tr>
  <tr>
    <td><tt>metatags.names</tt></td>
    <td>String</td>
    <td>Metatags to extract</td>
    <td><tt>description;keywords</tt></td>
  </tr>
  <tr>
    <td><tt>index.parse.md</tt></td>
    <td>String</td>
    <td>Metatags to parse and index.</td>
    <td><tt>metatag.description,metatag.keywords</tt></td>
  </tr>
</table>

## Usage

Just include `nutch` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nutch]"
  ]
}
```

You can include `nutch::create-hdfs-dirs` to create the hdfs directories for nutch.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

* Freely distributable and licensed under the [Apache 2.0 license](LICENSE).
* Copyright 2014 [Wegtam UG](http://www.wegtam.org)

### Authors:

* [@jan0sch](https://github.com/jan0sch)

