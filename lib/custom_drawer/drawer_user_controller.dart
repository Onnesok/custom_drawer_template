import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import '../custom_drawer/home_drawer.dart';

class DrawerUserController extends StatefulWidget {
  const DrawerUserController({
    required this.onDrawerCall,
    required this.screenView,
    this.menuView,
    this.drawerIsOpen,
    this.animatedIconData = AnimatedIcons.arrow_menu,
    this.drawerWidth = 250,
    this.screenIndex = DrawerIndex.home,
    super.key,
  });

  final double drawerWidth; // The width of the drawer
  final Function(DrawerIndex) onDrawerCall; // Callback function for drawer item selection
  final Widget screenView; // The main screen view
  final Function(bool)? drawerIsOpen; // Callback function for drawer open/close state
  final AnimatedIconData animatedIconData; // Icon data for the animated menu icon
  final Widget? menuView; // Custom menu view widget
  final DrawerIndex screenIndex; // The current selected screen index

  @override
  State<DrawerUserController> createState() => _DrawerUserControllerState();
}

class _DrawerUserControllerState extends State<DrawerUserController>
    with TickerProviderStateMixin {
  double scrolloffset = 0.0; // Track the drawer's scroll offset

  late final ScrollController scrollController; // Controller to manage scroll position
  late final AnimationController animationController; // Controller for drawer open/close animations
  late final AnimationController iconAnimationController; // Controller for the animated menu icon

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000), // Duration for drawer animation
      vsync: this,
    );
    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 0), // Initial duration set to 0 for immediate effect
    );
    iconAnimationController.animateTo(
      1.0,
      duration: const Duration(),
      curve: Curves.fastOutSlowIn,
    );
    scrollController = ScrollController(
      initialScrollOffset: widget.drawerWidth, // Start drawer in closed position
    );

    // Add a listener to the scroll controller to handle drawer open/close state
    scrollController.addListener(_handleScroll);

    // Ensure drawer is initialized correctly after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _getInitState());

    if (bool.fromEnvironment("dart.vm.product")) {
      // Running in release mode
      _getInitState();
    }
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    scrollController.removeListener(_handleScroll);
    scrollController.dispose();
    animationController.dispose();
    iconAnimationController.dispose();
    super.dispose();
  }

  // Method to handle the scroll position and update the drawer state
  void _handleScroll() {
    if (scrollController.offset <= 0) {
      // If the drawer is fully open
      if (scrolloffset != 1.0) {
        setState(() {
          scrolloffset = 1.0; // Update scroll offset to indicate drawer is open
          widget.drawerIsOpen?.call(true); // Notify that drawer is open
        });
        iconAnimationController.animateTo(0.0,
            duration: const Duration(),
            curve: Curves.fastOutSlowIn,
        );
      }
    } else if (scrollController.offset < widget.drawerWidth.floor()) {
      // If the drawer is partially open
      iconAnimationController.animateTo(
        (scrollController.offset * 100 / widget.drawerWidth) / 100,
        duration: const Duration(),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      // If the drawer is fully closed
      if (scrolloffset != 0.0) {
        setState(() {
          scrolloffset = 0.0; // Update scroll offset to indicate drawer is closed
          widget.drawerIsOpen?.call(false); // Notify that drawer is closed
        });
        iconAnimationController.animateTo(
          1.0,
          duration: const Duration(),
          curve: Curves.fastOutSlowIn,
        );
      }
    }
  }

  // Initialize the scroll position when the widget is first built
  Future<bool> _getInitState() async {
    scrollController.jumpTo(widget.drawerWidth);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal, // Drawer scrolls horizontally
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width + widget.drawerWidth,
          // We use screen width and add drawerWidth (from navigation_home_screen)
          child: Row(
            children: <Widget>[
              SizedBox(
                width: widget.drawerWidth,
                // We divided first drawer Width with HomeDrawer and second full-screen Width with all home screen, we called screen View
                height: MediaQuery.of(context).size.height,
                child: AnimatedBuilder(
                  animation: iconAnimationController,
                  builder: (BuildContext context, _) {
                    return Transform(
                      // Transform is used for the stable drawer; we don't need to move with scroll view
                      transform: Matrix4.translationValues(
                          scrollController.offset, 0.0, 0.0),
                      child: HomeDrawer(
                        screenIndex: widget.screenIndex,
                        iconAnimationController: iconAnimationController,
                        callBackIndex: (DrawerIndex indexType) {
                          onDrawerClick();
                          widget.onDrawerCall(indexType); // Call the drawer item callback
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // Full-screen Width with widget.screenView
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.6),
                          blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      // IgnorePointer is used as a touch (user interface) widget.screenView; for example, scrolloffset == 1 means the drawer is closed, we just allow touching all widget.screenView
                      IgnorePointer(
                        ignoring: scrolloffset == 1.0,
                        child: widget.screenView,
                      ),
                      // Alternative touch (user interface) for widget.screen; for example, drawer is closed, we need to tap on a few home screen areas and close the drawer
                      if (scrolloffset == 1.0)
                        GestureDetector(
                          onTap: onDrawerClick, // Close the drawer on tap
                        ),

                      // This just menu and arrow icon animation
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 8,
                            left: 8,
                        ),
                        child: SizedBox(
                          width: AppBar().preferredSize.height - 8,
                          height: AppBar().preferredSize.height - 8,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                  AppBar().preferredSize.height,
                              ),
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode()
                                );
                                onDrawerClick(); // Toggle the drawer on tap
                              },
                              child: Center(
                                // If you use your own menu view UI, you add from initialization
                                child: widget.menuView ??
                                    AnimatedIcon(
                                        icon: widget.animatedIconData,
                                        progress: iconAnimationController,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to toggle the drawer open/close state
  void onDrawerClick() {
    // If scrollController.offset != 0.0, then we set to close the drawer (with animation to offset zero position); if it's not 1, then open the drawer
    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0, // Close the drawer
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        widget.drawerWidth, // Open the drawer
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
