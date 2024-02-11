import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';
import '../../providers/widget_providers/button_opacity_provider.dart';

class ButtonOpacityWidget extends ConsumerStatefulWidget {
  const ButtonOpacityWidget({
    super.key, 
    this.onTap,
    this.width,
    this.height,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.isLoading = false,
    required this.textButton,
    required this.backgroundColor,
  });

  final double? height;
  final double? width;
  final bool isLoading;
  final double? fontSize;
  final Color? fontColor;
  final Function()? onTap;
  final String textButton;
  final Color backgroundColor;
  final FontWeight? fontWeight;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonOpacityWidgetState();
}

class _ButtonOpacityWidgetState extends ConsumerState<ButtonOpacityWidget> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer(
      builder: (_, ref, __) {
        ref.watch(buttonOpacityStateProvider);
        return SizedBox(
          width: widget.width ?? size.width,
          height: widget.height ?? size.height * .065,
          child: InkWell(
            onTap: widget.isLoading ? null : widget.onTap,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            onTapDown: (_) async {
              ref.read(buttonOpacityStateProvider.notifier).state = true;
              await Future.delayed(const Duration(milliseconds: 300), () {
                if (mounted) ref.read(buttonOpacityStateProvider.notifier).state = false;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.fastEaseInToSlowEaseOut,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: widget.isLoading ? AppThemeDesign.defaulTheme.colorScheme.primary : ref.read(buttonOpacityStateProvider.notifier).state ? 
                  widget.backgroundColor.withOpacity(.05) : widget.backgroundColor,
              ),
              child: Center(
                child: Visibility(
                  visible: widget.isLoading,
                  replacement: Text(
                    widget.textButton,
                    style: AppStyleDesign.fontStyleInter(
                      context: context,
                      letterSpacing: size.width * .0016,
                      size: widget.fontSize ?? size.height * .0165, 
                      fontWeight: widget.fontWeight ?? FontWeight.w500,
                      color: AppThemeDesign.defaulTheme.colorScheme.surface
                    )
                  ),
                  child: SizedBox(
                    height: size.height * .035,
                    width: size.width * .075,
                    child: CircularProgressIndicator(
                      strokeAlign: 0,
                      strokeWidth: 1.3,
                      strokeCap: StrokeCap.square,
                      color: AppThemeDesign.defaulTheme.colorScheme.surface,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}