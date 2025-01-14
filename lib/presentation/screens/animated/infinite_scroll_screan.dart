import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScrean extends StatefulWidget {
  static const name = 'infinite_screend';
  const InfiniteScrollScrean({super.key});

  @override
  State<InfiniteScrollScrean> createState() => _InfiniteScrollScreanState();
}

class _InfiniteScrollScreanState extends State<InfiniteScrollScrean> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoadding = false;
  bool isMounted = true;

  void addFiveImges() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        //load nex page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoadding) return;
    isLoadding = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    addFiveImges();
    isLoadding = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoadding = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoadding = false;
    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImges();
    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 20 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
/*       appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ), */
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: () => onRefresh(),
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/Images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        //child:,
        child: isLoadding
            ? FadeIn(
                child: SpinPerfect(
                  infinite: true,
                  child: Icon(Icons.refresh_rounded),
                ),
              )
            : FadeIn(
                child: Icon(Icons.arrow_back_ios_new_outlined),
              ),
      ),
    );
  }
}
