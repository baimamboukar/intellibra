import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/common/widgets/intellibra_input.dart';
import 'package:intellibra/src/common/widgets/mark.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:pinput/pinput.dart';

@RoutePage()    
class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final PageController _pageController = PageController();

  int _currentPageIndex = 0;

  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (pageIndex) {
                  setState(() {
                    _currentPageIndex = pageIndex;
                    _isLastPage = pageIndex == 2;
                  });
                },
                children: [
                  _buildFirstPage(),
                  _buildSecondPage(),
                  _buildThirdPage(),
                ],
              ),
            ),
            IntellibraButton(
              action: _isLastPage ? _submitForm : _nextPage,
              text: _isLastPage ? 'Confirm' : 'Continue',
            ),
            if (_currentPageIndex != 0)
              TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text('Back'),
              )
            else
              const SizedBox.shrink(),
            24.vGap,
          ],
        ),
      ),
    );
  }

  Widget _buildFirstPage() {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        34.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TradeMark(),
            const Spacer(),
            // Dropdown menu for language
            Expanded(
              child: DropdownButtonFormField<String>(
                value: 'Francais',
                decoration: const InputDecoration(
                  //  prefixIcon: Icon(Icons.language),
                  border: InputBorder.none,
                  //contentPadding: EdgeInsets.all(0),
                  hintText: 'Francais',
                ),
                onChanged: (language) {},
                items: ['English', 'Francais']
                    .map(
                      (lang) => DropdownMenuItem<String>(
                        value: lang,
                        child: Text(lang),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        14.vGap,
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.scheme.primary.withOpacity(.5),
              ),
              child: Icon(
                Hicons.profile_circle_bold,
                size: 85,
                color: context.scheme.onPrimary.withOpacity(.75),
              ),
            ),
            Positioned(
              bottom: 10,
              right: -5,
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 24,
                color: context.scheme.primary.withOpacity(.75),
              ),
            ),
          ],
        ),
        14.vGap,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Text(
            'Add a profile picture or choose an avatar',
            style: context.theme.textTheme.bodySmall,
          ),
        ),
        34.vGap,
        Row(
          children: [
            Text(
              'Enter your names',
              style: context.theme.textTheme.bodyLarge,
            ),
          ],
        ),
        IntelliInput(
          label: 'Names',
          hint: 'Lady Bug Miraculous',
          controller: TextEditingController(),
          obscureText: false,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildSecondPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        34.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TradeMark(),
            const Spacer(),
            // Dropdown menu for language
            Expanded(
              child: DropdownButtonFormField<String>(
                value: 'Francais',
                decoration: const InputDecoration(
                  //  prefixIcon: Icon(Icons.language),
                  border: InputBorder.none,
                  //contentPadding: EdgeInsets.all(0),
                  hintText: 'Francais',
                ),
                onChanged: (language) {},
                items: ['English', 'Francais']
                    .map(
                      (lang) => DropdownMenuItem<String>(
                        value: lang,
                        child: Text(lang),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        14.vGap,
        Center(
          child: Icon(
            Hicons.lock_1_bold,
            size: 64,
            color: context.scheme.primary,
          ),
        ),
        4.vGap,
        const Center(
          child: Text(
            'Enter your secret code',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        14.vGap,
        const Center(
          child: Pinput(),
        ),
        14.vGap,
        ListTile(
          horizontalTitleGap: 0,
          title: Text(
            'Use fingerprint authentication',
            style: context.theme.textTheme.bodySmall,
          ),
          leading: const Icon(Icons.fingerprint),
          trailing: CupertinoSwitch(
            activeColor: context.scheme.primary,
            value: true,
            onChanged: (fingerprintAuth) {},
          ),
        ),
      ],
    );
  }

  Widget _buildThirdPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        34.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TradeMark(),
            const Spacer(),
            // Dropdown menu for language
            Expanded(
              child: DropdownButtonFormField<String>(
                value: 'Francais',
                decoration: const InputDecoration(
                  //  prefixIcon: Icon(Icons.language),
                  border: InputBorder.none,
                  //contentPadding: EdgeInsets.all(0),
                  hintText: 'Francais',
                ),
                onChanged: (language) {},
                items: ['English', 'Francais']
                    .map(
                      (lang) => DropdownMenuItem<String>(
                        value: lang,
                        child: Text(lang),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        14.vGap,
        Center(
          child: Icon(
            Hicons.lock_1_bold,
            size: 64,
            color: context.scheme.primary,
          ),
        ),
        4.vGap,
        const Center(
          child: Text(
            'Verify your secret code',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        14.vGap,
        const Center(
          child: Pinput(),
        ),
        14.vGap,
        ListTile(
          horizontalTitleGap: 0,
          title: Text(
            'Use fingerprint authentication',
            style: context.theme.textTheme.bodySmall,
          ),
          leading: const Icon(Icons.fingerprint),
          trailing: CupertinoSwitch(
            activeColor: context.scheme.primary,
            value: true,
            onChanged: (fingerprintAuth) {},
          ),
        ),
      ],
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _submitForm() {
    context.router.pushNamed('/home');
  }
}
