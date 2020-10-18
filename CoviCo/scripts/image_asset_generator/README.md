# Image Asset Generator

This scripts takes all the images placed in a specified folder (`assets/images` by default) and generates a class named `ImageAssets` that provides constants referencing to the images in the image folder.

For example:

If you have a image folder as below:

```txt
assets/
    images/
        car.png
        start.png
        logo.png
```

Generate class would be (`lib/common/image_assets.dart` default):

```dart
class ImageAssets {
  ImageAssets._internal();

  static const LOGO = 'assets/logo.png';
  static const CAR = 'assets/car.png';
  static const START = 'assets/start.png';
}
```

## Steps

- Add the required images into the image asset folder, by default `assets/images`.

- Using terminal `cd` into `scripts/image_asset_generator` folder.

- Run the following command:

```shell
dart image_asset_generator.dart
```

This will generate the `ImageAsset` class.
