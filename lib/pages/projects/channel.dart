import 'package:first_flutter/model/paginator.dart';
import 'package:first_flutter/model/users.dart';
import 'package:first_flutter/service/api.dart';
import 'package:flutter/material.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> with WidgetsBindingObserver {
  Api api = Api();
  Users users = Users(pagination: Paginator(), data: []);
  bool isLoading = false;
  bool isListView = true;
  bool isOnEndReached = false;

  ScrollController _controller = new ScrollController();

  Future onRefresh() async {
    setState(() {
      users = Users(pagination: Paginator(), data: []);
    });
    getData("1");
  }

  onLoadMore() {
    if (!isLoading && users.pagination.page != users.pagination.totalPages) {
      int page = int.parse(users.pagination.page) + 1;
      getData(page.toString());
    }
  }

  getData(String page) async {
    handleLoading();
    api.getUsers(page).then((value) => {
          users.data = users.data..addAll(value.data),
          users.pagination = value.pagination,
          handleLoading()
        });
  }

  handleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    onRefresh();
    _controller.addListener(() {
      // reached bottom
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() => isOnEndReached = true);
        print('onEndReached');
        onLoadMore();
      }

      // IS SCROLLING
      if (_controller.offset >= _controller.position.minScrollExtent &&
          _controller.offset < _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        setState(() {
          isOnEndReached = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Channel Project'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isListView = !isListView;
                });
              },
              icon: Icon(isListView ? Icons.grid_view : Icons.list_alt))
        ],
      ),
      body: buildList(),
    );
  }

  Widget buildList() => users.data.isEmpty && isLoading
      ? const Center(child: CircularProgressIndicator())
      : RefreshIndicator(
          onRefresh: onRefresh,
          child: isListView
              ? Container(
                  child: Stack(children: [
                  ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: users.data.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return buildItemList(users.data[index].name,
                          users.data[index].email, users.data[index].avatar);
                    },
                  ),
                  buildTotalData(),
                  buildBottomLoading()
                ]))
              : Container(
                  child: Stack(children: [
                    GridView.builder(
                      padding: const EdgeInsets.only(top: 40),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 35,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2),
                      controller: _controller,
                      itemCount: users.data.length,
                      itemBuilder: (context, index) {
                        return buildItemGrid(users.data[index].name,
                            users.data[index].email, users.data[index].avatar);
                      },
                    ),
                    buildTotalData(),
                    buildBottomLoading()
                  ]),
                ),
        );

  Widget buildItemList(String name, String email, String avatar) => Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(avatar),
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(email, style: const TextStyle(color: Colors.blueGrey)),
              ],
            ),
          ],
        ),
      );

  Widget buildItemGrid(String name, String email, String avatar) => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: 150,
              image: NetworkImage(avatar),
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(email, style: const TextStyle(color: Colors.blueGrey)),
              ],
            ),
          ],
        ),
      );

  Widget buildBottomLoading() => isLoading
      ? const Align(
          alignment: Alignment(0, 0.93),
          child: SizedBox(
            height: 20.0,
            width: 20.0,
            child: CircularProgressIndicator(),
          ))
      : Container();

  Widget buildTotalData() => Align(
        alignment: const Alignment(1, -1),
        child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(top: 15, right: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              users.data.length.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      );
}
