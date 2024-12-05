import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ImageView extends StatelessWidget {
  final String image;
  final double? progressSize;
  final double? height;
  final double? width;
  final double? borderWidth;
  final Color? borderColor;

  final Color? color;
  final BoxFit? fit;
  final String? placeholder;
  final bool isCircle;

  const ImageView.circle(
      {super.key,
      required this.image,
      this.progressSize,
      this.placeholder,
      this.borderWidth,
      this.borderColor,
      this.width,
      this.height,
      this.color,
      this.fit,
      this.isCircle = true});

  const ImageView.rect(
      {super.key,
      required this.image,
      this.progressSize,
      this.placeholder,
      this.borderWidth,
      this.borderColor,
      this.color,
      this.width,
      this.height,
      this.fit,
      this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: !isCircle
          ? (image.isNotEmpty && !image.contains("http"))
              ? Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: FileImage(File(image)), fit: BoxFit.cover),
                  ),
                )
              : (image.isNotEmpty && image.contains("http"))
                  ? CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            color: color ?? Colors.transparent,
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: fit ?? BoxFit.fill,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      placeholder ??
                                          "assets/icons/logoIcon.png",
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      placeholder ??
                                          "assets/icons/logoIcon.png",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                        );
                      },
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: Get.height,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage(
                                  placeholder ?? "assets/icons/logoIcon.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    )
          : ClipOval(
              child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: (image.isNotEmpty && !image.contains("http"))
                      ? Container(
                          height: height,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: FileImage(File(image)),
                                fit: BoxFit.cover),
                          ),
                        )
                      : (image.isNotEmpty && image.contains("http"))
                          ? CachedNetworkImage(
                              imageUrl: image,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: color ?? Colors.transparent,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: fit ?? BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                              placeholder: (context, url) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              placeholder ??
                                                  "assets/icons/logoIcon.png",
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            placeholder ??
                                                "assets/icons/logoIcon.png",
                                          ),
                                          fit: BoxFit.cover)),
                                );
                              },
                            )
                          : Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: Get.height,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: AssetImage(placeholder ??
                                          "assets/icons/logoIcon.png"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            )),
            ),
    );
  }
}
