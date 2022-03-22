import 'package:azkar/Widget/azkar_details_card.dart';
import 'package:azkar/provider/azkarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AzkarDetailsScreen extends StatefulWidget {
  @override
  _AzkarDetailsScreenState createState() => _AzkarDetailsScreenState();
}

class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
  late String arguments;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context)!.settings.arguments as String;

    Provider.of<AzkarProvider>(context, listen: false)
        .getAzkarDetails(arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: arguments.toString(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(arguments.toString()),
          leading: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: Consumer<AzkarProvider>(builder: (context, provider, _) {
          return provider.azkarDetails == null
              ? const Center(child: CircularProgressIndicator())
              : provider.azkarDetails!.isEmpty
                  ? Center(
                      child: Text('لم يتم إضافة أذكار بعد!'),
                    )
                  : ListView.builder(
                      itemCount: provider.azkarDetails!['zakrList'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return AzkarDetailsCard(
                          name: provider.azkarDetails!['zakrList'][index]
                              ['name'],
                          repeat: provider.azkarDetails!['zakrList'][index]
                                  ['repeat'] ??
                              '-',
                        );
                      },
                    );
        }),
      ),
    );
  }
}
