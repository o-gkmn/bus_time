import 'package:flutter/material.dart';

//ignore_this_file todo
final List<String> busses = [
  "16F",
  "19F",
  "133F",
  "48A",
  "93M",
  "50K",
  "93T",
  "15KÇ",
  "16YK",
  "19FK",
];

bool isFocused = false;

class BusListScreen extends StatelessWidget {
  const BusListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const BusListView(),
    );
  }
}

class BusListView extends StatelessWidget {
  const BusListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        //const Spacer(flex: 1),
        SizedBox(height: MediaQuery.of(context).viewPadding.top),
        _SearchBar(),
        const SizedBox(height: 8.0),
        _BusList(),
        //const Spacer(flex: 1)
      ]),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      //TODO state eklenicek isFocused değeri değiştirecek
      onTap: () => isFocused = true,
      //TODO Backende aranan değeri gönder ve state içindeki isFocused değerini değiştir
      onSubmitted: (String? value) => isFocused = false,
      decoration: InputDecoration(
        prefixIcon:
            Icon(Icons.search, color: Theme.of(context).iconTheme.color),
        labelText: "Ara",
        labelStyle: Theme.of(context).textTheme.labelMedium,
        hintText: "Hat numarası giriniz",
        hintStyle: Theme.of(context).textTheme.labelMedium,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 3.0,
                color: Theme.of(context).primaryColor,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 3.0,
                color: Theme.of(context).primaryColor,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}

class _BusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: !isFocused
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: busses.length,
              itemBuilder: ((context, index) {
                return Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          title: Text(busses[index]),
                        ),
                      ),
                    ],
                  ),
                );
              }))
          : const Center(
              child: Text("Aranıyor..."),
            ),
    );
  }
}
