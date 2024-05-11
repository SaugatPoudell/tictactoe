import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
    static int count=0;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  
}

class _HomePageState extends State<HomePage> {
  int gameOver=0;
  int gameTie=0;
  int _count=0;
  int _intro=0;
    List<String> _matrix = List.filled(9, "");
     @override
  void initState() {
    super.initState();
    _matrix = List.filled(9, ""); // Initialize _matrix with 9 empty strings
  }
  // int matrixLength=_matrix.length;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('TicTacToe')),
        backgroundColor: Colors.amber,
      ),
     body: Center(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0, // Spacing between rows
        crossAxisSpacing: 10.0, // Spacing between columns
      ),
      itemCount: 9, // Total number of items in the grid (3 rows * 3 columns)
      itemBuilder: (BuildContext context, int index) {
        return _buildElement(index);
      },
    ),
)
    );
  }
  _buildElement(int index)
  {
    return GestureDetector(
      // onTap:()
      // {
      // // setState(() {
      // //   {
      // //     _count++;
      // //     print(_count);
      // // }
      // // });
      
      // },
      // child: GestureDetector(
    onTap:() {
      setState(() {
         void validatewinner()
        {
          print('Checking the fucntion is workign or not ');
          if(_matrix[0].isNotEmpty&&_matrix[4].isNotEmpty&&_matrix[8].isNotEmpty&& _matrix[0]==_matrix[4]&&_matrix[4]==_matrix[8])
          {
            setState(() {
              gameOver=1;
              print("diagonal");
            });
          }
          else if (_matrix[2].isNotEmpty && _matrix[4].isNotEmpty && _matrix[6].isNotEmpty && _matrix[2] == _matrix[4] && _matrix[2] == _matrix[6])
          {
            setState(() {
              gameOver=1;
               print("diagonal");
            });
          }
             else if(_matrix[0].isNotEmpty && _matrix[1].isNotEmpty && _matrix[2].isNotEmpty && _matrix[0] == _matrix[1] && _matrix[0] == _matrix[2])
          {
            setState(() {
              gameOver=1;
               print("1st row");
            });
          }
          else if(_matrix[6].isNotEmpty && _matrix[7].isNotEmpty && _matrix[8].isNotEmpty && _matrix[6] == _matrix[7] && _matrix[6] == _matrix[8])
          {
            setState(() {
              gameOver=1;
               print("3rd row");
            });
          }
         else if(_matrix[3].isNotEmpty && _matrix[4].isNotEmpty && _matrix[5].isNotEmpty && _matrix[3] == _matrix[4] && _matrix[3] == _matrix[5])
          {
            setState(() {
              gameOver=1;
               print("2nd");
            });
              }
         else if(_matrix[0].isNotEmpty && _matrix[3].isNotEmpty && _matrix[6].isNotEmpty && _matrix[0] == _matrix[3] && _matrix[0] == _matrix[6])
          {
            setState(() {
              gameOver=1;
               print("1st colm");
            });
            }
         else if(_matrix[1].isNotEmpty && _matrix[4].isNotEmpty && _matrix[7].isNotEmpty && _matrix[1] == _matrix[4] && _matrix[1] == _matrix[7])
          {
            setState(() {
              gameOver=1;
               print("2nd colm");
            });
              }
         else if(_matrix[2].isNotEmpty && _matrix[5].isNotEmpty && _matrix[8].isNotEmpty && _matrix[2] == _matrix[5] && _matrix[2] == _matrix[8])
          {
            setState(() {
              gameOver=1;
               print("3rd colm");
            });
          }
          else
          {
            setState(() {
              gameTie=1;
              print("Game Continuing");
            });
          }
          if(_count==9&&gameTie==1)
          {
             showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('No winner Decided'),
                  content: const Text('Restart Game'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(MyApp());
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
        }
            );
        
          }
              if(gameOver==1)
            {
                  showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Game has ended'),
                  content: const Text('Restart Game'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(MyApp());
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
        }
            );
            }
        //     showDialog(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return AlertDialog(
        //           title: const Text('Winner '),
        //           content: const Text('The game has ended'),
        //           actions: <Widget>[
        //             TextButton(
        //               onPressed: () {
        //                 Navigator.of(context).pop(MyApp());
        //               },
        //               child: const Text('Close'),
        //             ),
        //           ],
        //         );
        // }
        //     );
          
        }
        if(_count<9)
        {
_count++;
        print(_count);
        print(index);
        _matrix[index] = _count.isOdd ? "X" : "O";
         print(_matrix);
              validatewinner();
        }
    
      }
      );
    },
        child: Container(
          width: 100.0,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.black),
          ),
          child: FittedBox(
            // fit:BoxFit.scaleDown,
            child: Text
            (
              // _intro==0?'':'',
              _matrix[index],
              //  _count==0?"":(_count%2==0?"X":"O"),
             
            style: TextStyle(
              fontSize: 210.0,
            ),
            ),
          ),
        ),
      // ),r
      
    );
  }
}
