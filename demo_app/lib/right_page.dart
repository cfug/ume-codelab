import 'package:demo_app/list_card.dart';
import 'package:demo_app/model.dart';
import 'package:demo_app/request_util.dart';
import 'package:flutter/material.dart';

class RightPage extends StatefulWidget {
  const RightPage(this.type, {super.key});

  final DataSourceType type;

  @override
  State<RightPage> createState() => _RightPageState();
}

class _RightPageState extends State<RightPage>
    with AutomaticKeepAliveClientMixin {
  late List<MovieItems> movieList;

  Future<List<MovieItems>>? dataFuture;

  @override
  void initState() {
    // dataFuture = RequestUtil.requestDouban(widget.type);
    dataFuture = RequestUtil.readFromAssets();
    super.initState();
  }

  int corssAxisCount(BuildContext ctx) {
    final size = MediaQuery.of(ctx).size;
    if (size.width / size.height > 4 / 3) {
      return 2;
    }
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<List<MovieItems>>(
        future: dataFuture,
        builder: ((context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListCard(movieItems: snapshot.data?.elementAt(index));
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }

  @override
  bool get wantKeepAlive => true;
}
