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

final List<String> bussesRoute = [
  "Fındıklı Mah. - Üsküdar",
  "Fındıklı Mah. - Kadıköy",
  "Maltepe - Cevizli Peronlar",
  "Colton Gardens - Elisabethfurt",
  "West Antoniettafort - South Shawna",
  "Pleasanton - Port Melvinachester",
  "New Tiaraview - North Noe",
  "Bennettfort - Monahanshire",
  "Lake Izaiahshire - Jasonhaven",
  "Lake Leilani - Rowlett",
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
              itemCount: busses.length,
              itemBuilder: ((context, index) {
                return Container(
                  margin: index == busses.length - 1
                      ? const EdgeInsets.only(bottom: 0.0)
                      : const EdgeInsets.only(bottom: 5.0),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    border: Border.all(color: Colors.green, width: 2.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                  ),
                  child: RowContentDesign(
                      busCode: busses[index], busRoute: bussesRoute[index]),
                );
              }),
            )
          : const Center(
              child: Text("Aranıyor..."),
            ),
    );
  }
}

class RowContentDesign extends StatelessWidget {
  final String busCode;
  final String busRoute;

  const RowContentDesign(
      {super.key, required this.busCode, required this.busRoute});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.green, width: 2.5),
            ),
          ),
          child: Text(
            busCode,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              busRoute,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ],
    );
  }
}

//TODO busses ve busRoute mock repolar gerçekleriyle değiştirilicek