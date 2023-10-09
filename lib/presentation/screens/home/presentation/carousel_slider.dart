import 'package:FOODSTAR/domain/models/DishModel.dart';
import 'package:FOODSTAR/presentation/screens/home/domain/carousel_slider.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselSliverAuthor extends StatelessWidget {
  const CarouselSliverAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarouselSliverAuthorController>(
        builder: (CarouselSliverAuthorController controller) {
      return FutureBuilder<List<DishModel>>(
        future: controller.fetchAuthorList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Отображаем индикатор загрузки, пока данные загружаются
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Отображаем сообщение об ошибке, если есть ошибка загрузки
            return Text('Ошибка при загрузке данных: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Отображаем сообщение, если данных нет
            return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Center(
                  child: Text(
                    'Нет данных для отображения',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ));
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CarouselSlider.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index, realIndex) {
                  final author = snapshot.data?[index];
                  return buildImage(author!, index, controller);
                },
                options: CarouselOptions(
                  height: 600,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                ),
              ),
            );
          }
        },
      );
    });
  }

  Widget buildImage(
      DishModel author, int index, CarouselSliverAuthorController controller) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: 480,
            width: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                author.author_image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            author.author,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        )
      ],
    );
  }
}
