import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchflix/utils/constants.dart';

class CustomSearchBar extends StatelessWidget {
  final Color? iconColor;
  final Color? filterButtonColor;
  final Color? filterIconColor;
  final bool? enableFilter;
  final double? borderRadius;
  final double? filterButtonRadius;
  final Function? filterTap;
  final TextEditingController searchController;
  final String searchHint;

  const CustomSearchBar({
    super.key,
    this.iconColor,
    this.enableFilter,
    this.borderRadius,
    this.filterButtonRadius,
    this.filterButtonColor,
    this.filterIconColor,
    this.filterTap,
    required this.searchController,
    required this.searchHint
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius ?? 25),
                      color: white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 15),
                      Icon(
                        Iconsax.search_normal,
                        size: 20,
                        color: iconColor ?? red,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: TextFormField(
                            controller: searchController,
                            style: GoogleFonts.poppins().copyWith(
                              color: accentColor,
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              hintText: searchHint,
                              filled: true,
                              fillColor: Colors.transparent,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
              )
          ),
          enableFilter == true ? Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                if (filterTap != null) {
                  filterTap;
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(filterButtonRadius ?? 15),
                    color: filterButtonColor ?? red
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Iconsax.setting_4,
                    color: filterIconColor ?? white,
                  ),
                ),
              ),
            ),
          ) : Container()
        ],
      ),
    );
  }

}