import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'second_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GridViewDemo extends StatelessWidget {

  final List<String> texts = [
    'ToDo\nApp', 'InstaDemo\nApp', 'Fireabse\nApp', 'Timer\nApp', 'ChatGPTAPI\nApp', 'YouTubeAPI\nApp', 'ComingSoon', 'ComingSoon'
  ];

  // gridViewのContainer背景色
  final List<Color> backgroundColor = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pinkAccent,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Apps',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          backgroundColor: Colors.tealAccent,
        ),
        body: Container(
          color: Colors.white,
          /*
          decoration: BoxDecoration(
            gradient: LinearGradient( // LinearGradient : 直線状グラデーション RadialGradient : 放射状グラデーション SweepGradient : 環状グラデーション
                colors: [
                Color.fromRGBO(180, 216, 230, 0.5), // 基本上から下にグラデーション
                Colors.white,
              ],
              // グラデーションの開始位置と終了位置指定可能
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
            ),
          ),
           */
          child: GridView.builder(
            padding: const EdgeInsets.all(35), //4辺すべて同じ値の余白
            itemCount: texts.length, //要素の数　表示するデータ数の最大値（texts　listの最大値）
            // GridViewを設定する引数を指定
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 35,     //ボックス左右間のスペース
              mainAxisSpacing: 35,      //ボックス上下間のスペース
              crossAxisCount: 2,        //ボックスを横に並べる数

            ),
            //指定した要素の数分を生成
            itemBuilder: (BuildContext context, int index) {

              // Widget型sfezをreturnする
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10), // containerの右左の余白幅10
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle, // 丸い形状
                    borderRadius: BorderRadius.circular(20), // radius設定
                    color: this.backgroundColor[index], // Container背景色
                    // color: Colors.transparent, // 背景色透明
                    // border: Border.all(color: this.backgroundColor[index], width: 3),
                    boxShadow: [ // itemに影つける
                      BoxShadow(
                        color: Colors.black26, //色
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Center(child: Text(this.texts[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
                );
            },
          ),
        ),
      ),
    );
  }
}




class ToDoListPage extends StatefulWidget {

  // createState()で状態オブジェクトとしてToDoListPageStateオブジェクトを生成/ウィジェットの状態を管理
  @override ToDoListPageState createState() => ToDoListPageState();
}

// リスト一覧画面用Widget
class ToDoListPageState extends State<ToDoListPage> {

  TextEditingController textEditingController = TextEditingController(); // テキストをコントロールするためのもの

  List<String> toDoList = ['テスト1', 'テスト2', 'テスト3'];
  String todo = "";

  // swiftでいうfunc displayDialog(hogeContext: BuildContext){}関数定義
  displayDialog(BuildContext hogeContext){
    return showDialog(context: hogeContext, builder: (hogeContext){
      //ダイアログというwidgetを生成 floatingActionButtonタップ時に生成
      // builder引数は、callBack関数 {required Widget（Widget型を返す） Function(BuildContext) builder}  Type: Widget Function(BuildContext)
      return StatefulBuilder(
        builder: (hogeContext, setState) {
          return AlertDialog( // Dialogにも種類あり
            // class AlertDialog extends StatelessWidget → statelessヴィジェット
            title: Text(this.todo),
            content: TextField(
              controller: this.textEditingController, // ここでtextFieldのテキストをコントロールできるようにする
              onChanged: (value){
                setState(() { // setStateに関しては下の（練習）を参考にする
                  // stateLess状態なので、書き換えたら変化するstateFull状態にする → StateFullBuilder(builder:)を追加する
                  // statelessBuilderにより、テキストが変更されるたびに、ヴィジェット全体が再ビルドされ、新しい値が反映される
                  this.todo = value;
                  // stateFulであれば、値変化直後、title: Text(thistodo)に新値が反映される
                  // stateFulBuilder（builder:)をコメントアウトすると、stateLessになり、値が瞬時に更新されない
                });
              },
            ),
            actions: [ElevatedButton(
              // trueでnullをreturn じゃなければ、void関数を実行(){}
                onPressed: this.todo.isEmpty? null : (){
                  setState((){
                    this.toDoList.add(this.todo);
                    Navigator.pop(hogeContext);
                    this.textEditingController.clear(); // textFieldを空にする
                  });
                }, // onPressedにnullも指定可
                child: const Text('追加'),
            )],
          );
        }
      );
    });
  }
  // 1 StatefulWidget を使用して内部で状態を持つウィジェットを作成
  // 2 setState → 新しい状態を生成するコールバック関数を受け取り、そのコールバック関数を実行してウィジェットの状態を更新
  // 3 ウィジェットが再ビルド　

  // （練習）引数に関数を受け取る関数
  void outerFunction(void Function() innerFunction) {
    print('Outer function executing...');
    innerFunction(); // Inner function is called here
  }
  void innerFunction() {
    print('Inner function executed.');
  }
  void main() {
    outerFunction(innerFunction);
  }

  @override
  Widget build(BuildContext context) {
    // Scaffoldには、appBarとbodyプロパティが用意されてる
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('リスト一覧'),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height, // MediaQuery.of(context).sizeでscreenSize取得
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
          ),
          child: ListView.builder(
                itemCount: this.toDoList.length,
                    // {required Widget? Function(BuildContext, int) itemBuilder} itemBuilderはType: Widget? Function(BuildContext, int)
                    // itemBuilderはWidget型をreturnする必要がある(nullも可)
                    // requried Widget? → itemBuilderを必須指定
                    // Function(BuildContext, int) BuildContextとInt型を引数として指定することで実行されるcallBack関数
                    itemBuilder: (context, index) { // itemBuilder: (BuildContext context, int index){}でもok
                      return Padding(
                        //padding: const EdgeInsets.all(8.0), // itemの幅が8.0
                        padding: const EdgeInsets.only(left: 0.0, top: 0.0, bottom: 0.0, right: 0.0), // onlyで自由自在に指定
                        child: Slidable(
                          key: ValueKey(this.toDoList[index]), // アイテムごとに一意のキーを設定
                          startActionPane: ActionPane( // 左から出てくる
                            motion: const DrawerMotion(), // 別の種類のmotion設定可
                            dismissible: DismissiblePane(onDismissed: () {}), // 最後までスワイプした時にこのSlidableを消す(keyが必須)
                            // 出てくるWidgetを指定(必須)
                            children: [
                              SlidableAction(
                                onPressed: (context) {},
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xFFFE4A49),
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                              SlidableAction(
                                onPressed: (context) {},
                                foregroundColor: Colors.white,
                                backgroundColor: const Color(0xFF0392CF),
                                icon: Icons.share,
                                label: 'Share',
                              ),
                            ],
                          ),
                          endActionPane: ActionPane( // 右から出てくる
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color(0xFFFE4A49),
                                  icon: Icons.archive,
                                  label: 'Archive',
                                ),
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: const Color(0xFF0392CF),
                                  foregroundColor: Colors.white,
                                  icon: Icons.save,
                                  label: 'Save',
                                ),
                              ],
                          ),
                          child: Card(
                            child: ListTile(
                              title: Text(this.toDoList[index]),
                            ),
                          ),
                        ),
                      );
                    },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // {required void Function()? onPressed}  Type: void Function()?
          // onPressedの引数ラベルに、指定必須でnullも可能な返り値なしのcallBack関数
          this.displayDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
