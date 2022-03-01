import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.shared.fetchPersistedThemeFromLocalStorage().then((theme) {
    ThemeManager.init(persistedTheme: theme);
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager.shared),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with ColorMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (_, themeProvider, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ColorMixin, SpacingMixin {
  @override
  Widget build(BuildContext context) {
    final colorVariants = [primary, secondary, success, alert, warning, accent1, accent2, accent3, accent4];
    final colorVariantsName = [
      'primary',
      'secondary',
      'success',
      'alert',
      'warning',
      'accent1',
      'accent2',
      'accent3',
      'accent4',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: navigationBarColor,
        title: Text(
          widget.title,
          style: TextStyle(
            color: textBlackColor,
          ),
        ),
        systemOverlayStyle: brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      backgroundColor: backgroundColor,
      body: Container(
        margin: m4 + mt1,
        child: GridView.builder(
          itemCount: colorVariants.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (_, index) {
            return Container(
              color: colorVariants[index],
              child: Center(
                child: Text(
                  colorVariantsName[index],
                  style: TextStyle(
                    color: textBlackColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          if (ThemeManager.shared.currentTheme == ColorThemes.mdsStandardTheme) {
            ThemeManager.shared.updateTheme(to: ThemeType.mdsStandardDarkTheme);
          } else {
            ThemeManager.shared.updateTheme(to: ThemeType.mdsStandardTheme);
          }
        },
        child: Container(
          padding: EdgeInsets.all(12),
          color: secondary,
          child: Icon(
            Icons.autorenew,
            color: darkTintColor,
          ),
        ),
      ),
    );
  }
}
