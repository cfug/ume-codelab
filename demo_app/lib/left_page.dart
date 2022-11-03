import 'package:demo_app/grid_card.dart';
import 'package:demo_app/model.dart';
import 'package:demo_app/request_util.dart';
import 'package:flutter/material.dart';

class LeftPage extends StatefulWidget {
  const LeftPage(this.type, {super.key});

  final DataSourceType type;

  @override
  State<LeftPage> createState() => _LeftPageState();
}

class _LeftPageState extends State<LeftPage>
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
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: corssAxisCount(context),
                    childAspectRatio: 3 / 1),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridCard(movieItems: snapshot.data?.elementAt(index));
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }

  @override
  bool get wantKeepAlive => true;
}
