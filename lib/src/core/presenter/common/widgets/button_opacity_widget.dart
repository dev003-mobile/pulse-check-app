import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../design/app_style_design.dart';
import '../design/app_theme_design.dart';

class ButtonOpacityWidget extends ConsumerStatefulWidget {
  const ButtonOpacityWidget({
    super.key, 
    this.onTap,
    this.width,
    this.child,
    this.height,
    this.fontSize,
    this.fontColor,
    this.textButton,
    this.fontWeight,
    this.borderColor,
    required this.provider,
    this.isLoading = false,
    required this.backgroundColor,
  });

  final Widget? child;
  final double? width;
  final double? height;
  final bool isLoading;
  final double? fontSize;
  final Color? fontColor;
  final Function()? onTap;
  final String? textButton;
  final Color? borderColor;
  final Color backgroundColor;
  final FontWeight? fontWeight;
  final StateProvider<bool> provider;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonOpacityWidgetState();
}

class _ButtonOpacityWidgetState extends ConsumerState<ButtonOpacityWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ref.watch(widget.provider);
    return SizedBox(
      width: widget.width ?? size.width,
      height: widget.height ?? size.height * .065,
      child: InkWell(
        onTap: widget.isLoading ? null : widget.onTap,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTapDown: (_) async {
          ref.read(widget.provider.notifier).state = true;
          await Future.delayed(const Duration(milliseconds: 100), () {
            if (mounted) ref.read(widget.provider.notifier).state = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.fastEaseInToSlowEaseOut,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              width: 1.1,
              color: widget.borderColor ?? AppThemeDesign.defaulTheme.colorScheme.surface
            ),
            color: widget.isLoading ? AppThemeDesign.defaulTheme.colorScheme.primary : 
              ref.read(widget.provider.notifier).state ? 
              widget.backgroundColor.withOpacity(.05) : widget.backgroundColor,
          ),
          child: Center(
            child: Visibility(
              visible: widget.isLoading,
              replacement: widget.child != null ? widget.child! : Text(
                widget.textButton ?? "",
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
}