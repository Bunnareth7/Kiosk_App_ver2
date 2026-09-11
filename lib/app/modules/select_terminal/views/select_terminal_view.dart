import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/ordering_page/views/ordering_page_view.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class SelectionTerminalView extends StatefulWidget {
  const SelectionTerminalView({super.key});

  static void open() => Get.offNamed(Routes.SELECT_TERMINAL);

  @override
  State<SelectionTerminalView> createState() => _SelectionTerminalViewState();
}

class _SelectionTerminalViewState extends State<SelectionTerminalView> {
  // hardcoded list.
  static const _stores = ['KOI The IFL', 'KOI The TK', 'KOI The SMC'];
  static const _terminals = [
    'KOI The IFL',
    'KOI The TK',
    'KOI The SMC',
    'KOI The 2004',
    'KOI The 271',
  ];

  String? _selectedStore;
  String? _selectedTerminal;

  bool get _canFinish => _selectedStore != null && _selectedTerminal != null;

  void _finish() {
    if (!_canFinish) return;

    // before navigating.
    OrderingView.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AnimInkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.chevron_left,
                        size: 26.sp,
                        color: AppColor.mainprimarykoi,
                      ),
                    ),
                    const Spacer(),
                    AnimInkWell(
                      onTap: _canFinish ? _finish : null,
                      child: Text(
                        'Finish',
                        style: AppTextStyle.body3_500.copyWith(
                          color: _canFinish
                              ? AppColor.mainprimarykoi
                              : AppColor.neutral200,
                        ),
                      ),
                    ),
                  ],
                ),

                40.verticalSpace,

                SvgPicture.asset(AppPath.terminal, width: 80.w, height: 80.w),

                12.verticalSpace,

                Text(
                  'Store and Terminal',
                  style: AppTextStyle.body1_700.copyWith(
                    color: AppColor.neutral800,
                  ),
                ),
                4.verticalSpace,
                Text(
                  'Selecting your Store and Terminal',
                  style: AppTextStyle.body4_400.copyWith(
                    color: AppColor.neutral500,
                  ),
                ),

                24.verticalSpace,

                _SelectDropdownField(
                  hint: 'Store',
                  value: _selectedStore,
                  options: _stores,
                  onSelected: (value) {
                    setState(() => _selectedStore = value);
                  },
                ),

                12.verticalSpace,

                _SelectDropdownField(
                  hint: 'Terminal',
                  value: _selectedTerminal,
                  options: _terminals,
                  onSelected: (value) {
                    setState(() => _selectedTerminal = value);
                  },
                ),

                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectDropdownField extends StatefulWidget {
  const _SelectDropdownField({
    required this.hint,
    required this.value,
    required this.options,
    required this.onSelected,
  });

  final String hint;
  final String? value;
  final List<String> options;
  final ValueChanged<String?> onSelected;

  @override
  State<_SelectDropdownField> createState() => _SelectDropdownFieldState();
}

class _SelectDropdownFieldState extends State<_SelectDropdownField> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  void _toggleDropdown() {
    if (_overlayEntry != null) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final width = renderBox.size.width;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _removeOverlay,
                child: Container(color: Colors.transparent),
              ),
            ),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, renderBox.size.height + 6.h),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: width,
                  constraints: BoxConstraints(maxHeight: 260.h),
                  decoration: BoxDecoration(
                    color: AppColor.neutral100,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 12.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final option in widget.options)
                          _OptionRow(
                            label: option,
                            selected: option == widget.value,
                            onTap: () {
                              widget.onSelected(option);
                              _removeOverlay();
                            },
                          ),
                        _OptionRow(
                          label: 'Not selected',
                          selected: false,
                          isMuted: true,
                          onTap: () {
                            widget.onSelected(null);
                            _removeOverlay();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    overlay.insert(_overlayEntry!);
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: AnimInkWell(
        onTap: _toggleDropdown,
        child: Container(
          height: 42.h,
          width: 343.w,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: AppColor.neutral200,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.value ?? widget.hint,
                  style: AppTextStyle.body3_500.copyWith(
                    color: widget.value != null
                        ? AppColor.neutral800
                        : AppColor.neutral400,
                  ),
                ),
              ),
              Icon(Icons.unfold_more, size: 18.sp, color: AppColor.neutral400),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({
    required this.label,
    required this.selected,
    required this.onTap,
    this.isMuted = false,
  });

  final String label;
  final bool selected;
  final bool isMuted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: selected
            ? AppColor.mainprimarykoi.withValues(alpha: 0.08)
            : Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Text(
          label,
          style: AppTextStyle.body3_500.copyWith(color: AppColor.neutral500),
        ),
      ),
    );
  }
}
