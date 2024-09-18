import 'package:flutter_test/flutter_test.dart';
import 'package:multi_split_view/src/area.dart';
import 'package:multi_split_view/src/controller.dart';
import 'package:multi_split_view/src/internal/layout_constraints.dart';
import 'package:multi_split_view/src/policies.dart';

import 'test_helper.dart';

void main() {
  group('LayoutConstraints', () {
    group('Adjust areas', () {
      test('empty', () {
        MultiSplitViewController controller =
            MultiSplitViewController(areas: []);
        LayoutConstraints(
                controller: controller,
                containerSize: 155,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkFirst,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 0);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
      test('same areas hash', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        ControllerHelper controllerHelper = ControllerHelper(controller);
        Object oldAreasHash = controllerHelper.areasUpdateHash;
        LayoutConstraints(
                controller: controller,
                containerSize: 205,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: controllerHelper,
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkFirst,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 100);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
        expect(oldAreasHash, controllerHelper.areasUpdateHash);
      });
      test('containerSize - decimal value', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        ControllerHelper controllerHelper = ControllerHelper(controller);
        Object oldAreasHash = controllerHelper.areasUpdateHash;
        LayoutConstraints(
                controller: controller,
                containerSize: 204.999999999,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: controllerHelper,
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkFirst,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 100);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
        expect(oldAreasHash, controllerHelper.areasUpdateHash);
      });
      test('containerSize - decimal value - 2', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        ControllerHelper controllerHelper = ControllerHelper(controller);
        Object oldAreasHash = controllerHelper.areasUpdateHash;
        LayoutConstraints(
                controller: controller,
                containerSize: 204.5,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: controllerHelper,
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkFirst,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 99.5);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 100);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
        expect(oldAreasHash, isNot(equals(controllerHelper.areasUpdateHash)));
      });
      test('containerSize - decimal value - 3', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        ControllerHelper controllerHelper = ControllerHelper(controller);
        Object oldAreasHash = controllerHelper.areasUpdateHash;
        LayoutConstraints(
                controller: controller,
                containerSize: 205.000000001,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: controllerHelper,
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkFirst,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 100);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
        expect(oldAreasHash, controllerHelper.areasUpdateHash);
      });
      test('containerSize - decimal value - 4', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        ControllerHelper controllerHelper = ControllerHelper(controller);
        Object oldAreasHash = controllerHelper.areasUpdateHash;
        LayoutConstraints(
                controller: controller,
                containerSize: 205.5,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: controllerHelper,
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkFirst,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 100.5);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
        expect(oldAreasHash, isNot(equals((controllerHelper.areasUpdateHash))));
      });
      test('sizeOverflowPolicy - shrinkFirst', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        LayoutConstraints(
                controller: controller,
                containerSize: 155,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkFirst,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 50);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 100);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
      test('sizeOverflowPolicy - shrinkLast', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        LayoutConstraints(
                controller: controller,
                containerSize: 155,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkLast,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 50);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
      test('sizeOverflowPolicy - shrinkLast - min', () {
        MultiSplitViewController controller = MultiSplitViewController(areas: [
          Area(data: 'a', size: 100),
          Area(data: 'b', size: 100, min: 90)
        ]);
        LayoutConstraints(
                controller: controller,
                containerSize: 155,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkLast,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: 90, max: null, flex: null, size: 50);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
      test('sizeUnderflowPolicy - stretchFirst', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        LayoutConstraints(
                controller: controller,
                containerSize: 255,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkLast,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchFirst,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 150);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 100);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
      test('sizeUnderflowPolicy - stretchLast', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 100), Area(data: 'b', size: 100)]);
        LayoutConstraints(
                controller: controller,
                containerSize: 255,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkLast,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 150);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
      test('sizeUnderflowPolicy - stretchLast - max', () {
        MultiSplitViewController controller = MultiSplitViewController(areas: [
          Area(data: 'a', size: 100),
          Area(data: 'b', size: 100, max: 110)
        ]);
        LayoutConstraints(
                controller: controller,
                containerSize: 255,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkLast,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchLast,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: 110, flex: null, size: 150);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
      test('sizeUnderflowPolicy - stretchAll', () {
        MultiSplitViewController controller = MultiSplitViewController(
            areas: [Area(data: 'a', size: 50), Area(data: 'b', size: 100)]);
        LayoutConstraints(
                controller: controller,
                containerSize: 205,
                dividerThickness: 5,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkLast,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchAll,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 75);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: null, max: null, flex: null, size: 125);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
      test('minSizeRecoveryPolicy - firstToLast', () {
        MultiSplitViewController controller = MultiSplitViewController(areas: [
          Area(data: 'a', size: 100),
          Area(data: 'b', size: 100, min: 100)
        ]);
        LayoutConstraints(
                controller: controller,
                containerSize: 150,
                dividerThickness: 0,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkLast,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchAll,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: 100, max: null, flex: null, size: 50);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);

        LayoutConstraints(
                controller: controller,
                containerSize: 200,
                dividerThickness: 0,
                dividerHandleBuffer: 0)
            .adjustAreas(
                controllerHelper: ControllerHelper(controller),
                sizeOverflowPolicy: SizeOverflowPolicy.shrinkLast,
                sizeUnderflowPolicy: SizeUnderflowPolicy.stretchAll,
                minSizeRecoveryPolicy: MinSizeRecoveryPolicy.firstToLast);
        expect(controller.areas.length, 2);
        TestHelper.testArea(controller.areas[0],
            data: 'a', min: null, max: null, flex: null, size: 100);
        TestHelper.testArea(controller.areas[1],
            data: 'b', min: 100, max: null, flex: null, size: 100);
        expect(controller.flexCount, 0);
        expect(controller.totalFlex, 0);
      });
    });
  });
}
