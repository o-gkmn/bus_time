import 'package:bus_time/route/router.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Spacer(flex: 1),
          _Logo(),
          const Spacer(flex: 1),
          _SearchBar(),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_BusListButton(), _StationListButton()],
          ),
          const Spacer(flex: 1),
          _AnnouncmentButton(),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: deviceWidth * 0.2,
        child: CircleAvatar(
          radius: deviceWidth * 0.19,
          backgroundImage: const AssetImage(
            "logo.png",
          ),
        ),
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
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        labelText: "Ara",
        labelStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      readOnly: true,
      onTap: () {
        //TODO : Arama ekranına yönlendirme kodu yazılacak
      },
    );
  }
}

class _BusListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, busListRoute),
      child: Column(
        children: [
          Icon(Icons.bus_alert, color: Theme.of(context).iconTheme.color),
          const SizedBox(height: 7.0),
          Text("Otobüs Listesi",
              style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _StationListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, stationListRoute),
      child: Column(
        children: [
          Icon(Icons.food_bank,
              color: Theme.of(context).iconTheme.color,
              size: Theme.of(context).iconTheme.size),
          const SizedBox(height: 7.0),
          Text("Durak Listesi", style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _AnnouncmentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      //TODO : Anons listesi ekranına yönlendirecek
      onPressed: () {},
      child: Column(
        children: [
          Icon(Icons.announcement, color: Theme.of(context).iconTheme.color),
          const SizedBox(height: 7.0),
          Text("Duyurular", style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
