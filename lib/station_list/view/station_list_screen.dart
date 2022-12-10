import 'package:flutter/material.dart';

bool isFocused = false;
List<String> stationList = [
  "Fındıklı Mah. Muhtarlığı",
  "Vicdan",
  "Bostancı Sanayi",
  "Kozyatağı",
  "Yenisahra",
  "Göztepe",
  "Hastane",
  "Medeniyet Üniversitesi",
  "Uzunçayır Metrobüs",
  "Kız kulesi",
  "Şemsipaşa"
];

class StationListScreen extends StatelessWidget {
  const StationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const StationListView(),
    );
  }
}

class StationListView extends StatelessWidget {
  const StationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          _SearchBar(),
          const SizedBox(height: 8.0),
          _StationList(),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: () => isFocused = true,
      onSubmitted: (String? value) => isFocused = false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
        labelText: "Ara",
        labelStyle: Theme.of(context).textTheme.labelMedium,
        hintText: "Durak ismi giriniz",
        hintStyle: Theme.of(context).textTheme.labelMedium,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid,
              width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid,
              width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}

class _StationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: stationList.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: index == stationList.length - 1
                ? const EdgeInsets.only(bottom: 0.0)
                : const EdgeInsets.only(bottom: 5.0),
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              border: Border.all(
                  color: Colors.green, style: BorderStyle.solid, width: 2.5),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
            ),
            child: _RowContentDesign(
              stationName: stationList[index],
              stationDirection: "Üsküdar",
            ),
          );
        }),
      ),
    );
  }
}

class _RowContentDesign extends StatelessWidget {
  const _RowContentDesign(
      {required this.stationName, required this.stationDirection});

  final String stationName;
  final String stationDirection;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 60.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1),
            Text(stationName, style: Theme.of(context).textTheme.labelMedium),
            Text(stationDirection,
            textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.labelSmall),
            const Spacer(flex: 1),
          ],
        ),
      ],
    );
  }
}
