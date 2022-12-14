import 'package:flutter/material.dart';

bool isSubmitted = false;
List<String> searchingList = [
  '16F',
  'Fındıklı Mah.',
  '19F',
  'Vicdan',
  'Vatan Sokak'
];
List<String> searchedItem = [];

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _SearcView(),
    );
  }
}

class _SearcView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          _SearchBox(),
          _SearchingList(),
        ],
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      cursorColor: Colors.grey[600],
      //todo: alttaki iki fonksiyondan birine aranan değeri getiren fonksiyon yazılacak
      onChanged: (String? value) {},
      onSubmitted: (String? value) {
        isSubmitted = true;
        searchItem(value!);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).iconTheme.color,
        ),
        labelText: 'Ara',
        labelStyle: Theme.of(context).textTheme.labelMedium,
        hintText: 'Durak veya otobüs arayınız',
        hintStyle: Theme.of(context).textTheme.labelMedium,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3.0,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 3.0,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }

  void searchItem(String query) {
    if (searchedItem.isNotEmpty) {
      searchedItem.clear();
    }
    if (query.isEmpty) {
      isSubmitted = false;
      searchedItem.clear();
    }
    for (var element in searchingList) {
      if (element.contains(query)) {
        searchedItem.add(element);
      }
    }
  }
}

class _SearchingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return isSubmitted
        ? Flexible(
            child: ListView.builder(
                itemCount: searchedItem.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: index == searchedItem.length - 1
                        ? const EdgeInsets.only(bottom: 0.0)
                        : const EdgeInsets.only(bottom: 5.0),
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green,
                            width: 2.5,
                            style: BorderStyle.solid),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0)),
                        color: Theme.of(context).primaryColor),
                    child: _SearchingListRowContentDesign(
                        content: searchedItem[index]),
                  );
                }),
          )
        : Expanded(
          child: Column(
              verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 1),
                Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                  size: 48.0,
                ),
                const Text("Aranıyor..."),
                const Spacer(flex: 1),
              ],
            ),
        );
  }
}

class _SearchingListRowContentDesign extends StatelessWidget {
  final String content;

  const _SearchingListRowContentDesign({required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const SizedBox(width: 60), Text(content)],
    );
  }
}
