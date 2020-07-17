# shabal.cr

Crystal bindings for [libshabal](https://github.com/burst-apps-team/libShabal), an optimized native library containing utility and encryption code used with BURST and other PoC2-based cryptocurrencies.

## Installation

1. Install the latest libshabal binaries for your OS from [the libshabal releases page](https://github.com/burst-apps-team/libShabal/releases) if you don't already have them.

2. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     shabal:
       github: zyzzyva99/shabal
   ```

3. Run `shards install`

## Usage

```crystal
require "shabal"
```

See the specs for some examples. I'll be adding wrapper classes in the future so you don't have to mess around with pointers directly.

## Supported C Functions

All of them! See https://github.com/zyzzyva99/shabal.cr/blob/master/src/shabal/lib_shabal.cr for the list.

## Development

You don't need anything special to work on this project, besides Crystal >= 0.35.0 and libshabal >= 1.4.1.

## Contributing

1. Fork it (<https://github.com/zyzzyva99/shabal/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [zyzzyva](https://github.com/zyzzyva99) - creator and maintainer

## Donations

- BHD: 3LzrYwnUu6taMsUkRyTgkjZG75nG7gfR7B
- BURST: BURST-ZYZZ-5MDK-8A4D-3JY5Y
