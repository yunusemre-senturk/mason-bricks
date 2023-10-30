import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'route.routes.dart';

@RouteMapInit(typeSafe: true)
Route? onGenerateRoute(RouteSettings routeSettings) =>
    $onGenerateRoute(routeSettings);
