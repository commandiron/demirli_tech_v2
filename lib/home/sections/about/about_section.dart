import 'package:demirli_tech_v2/home/sections/products/products_section.dart';
import 'package:demirli_tech_v2/widgets/section_title.dart';
import 'package:flutter/material.dart';


class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  static const index = 2;
  static const title = "Hakkımızda";
  static const double height = 360;
  static double calculateOffset(BuildContext context) {
    return ProductsSection.calculateOffset(context) + ProductsSection.calculateHeight(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Column(
        children: [
          SectionTitle(title: title.toUpperCase()),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 600,
                child: Text(
                  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
