import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Assuming the existing imports are correct and relevant to your project
import 'package:step_in_style/core/components/general_textfield.dart';
import 'package:step_in_style/core/utility/regex.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/animations/fade_in_slide.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/utility/user_data_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  static List<Widget> actions = [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.edit),
    ),
  ];

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyName = GlobalKey<FormState>();
  String? _email;
  bool _obscurePassword = true;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final user = ref.watch(userProvider).user;
      _emailController.text = user?.email ?? '';
      _passwordController.text = 'Buasrim@123';
      _nameController.text = user?.fullName ?? '';
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              VSpace.medium,
              FadeInSlide(duration: 0.4, child: _buildProfileImage()),
              VSpace.medium,
              FadeInSlide(duration: 0.5, child: _buildProfileName()),
              VSpace.medium,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _profileText(
                    title: AppLocalizations.of(context)!.full_name,
                  ),
                  _generalTextField(
                    key: _formKeyName,
                    FocusNode: _nameFocusNode,
                    emailEditingController: _nameController,
                    emailVal: nameVal,
                  ),
                  _profileText(
                    title: AppLocalizations.of(context)!.email,
                  ),
                  _generalTextField(
                    key: _formKeyEmail,
                    FocusNode: _emailFocusNode,
                    emailEditingController: _emailController,
                    emailVal: emailVal,
                  ),
                  _profileText(title: AppLocalizations.of(context)!.password),
                  _passwordTextField(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return const CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1601138061518-864051769be7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'));
  }

  Widget _buildProfileName() {
    return Text('Ololade Busari',
        style: AppTextStyle.headerThree.copyWith(fontWeight: FontWeight.w600));
  }

  Widget _profileText({required String title}) {
    return Column(
      children: [
        FadeInSlide(
          duration: 0.6,
          child: Text(title,
              style:
                  AppTextStyle.bodyFour.copyWith(fontWeight: FontWeight.w600)),
        ),
        VSpace.small,
      ],
    );
  }

  Widget _generalTextField({
    required key,
    required FocusNode FocusNode,
    required TextEditingController emailEditingController,
    required emailVal,
  }) {
    return Column(
      children: [
        FadeInSlide(
          duration: 0.7,
          child: GeneralTextField(
            key: key,
            focusNode: FocusNode,
            textController: emailEditingController,
            hintText: 'h.makusota@gmail.com',
            fontSize: sizer(true, 16, context),
            keyboardType: TextInputType.emailAddress,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: emailVal,
            onChanged: (val) => setState(() {
              _email = val;
            }),
          ),
        ),
        VSpace.medium,
      ],
    );
  }

  Widget _passwordTextField() {
    return Column(
      children: [
        FadeInSlide(
          duration: 0.8,
          child: GeneralTextField(
            obscureText: _obscurePassword,
            textController: _passwordController,
            hintText: 'Password',
            fontSize: sizer(true, 16, context),
            keyboardType: TextInputType.emailAddress,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: passwordVal,
            onChanged: (val) => setState(() {
              _email = val;
            }),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: Icon(
                _obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: sizer(true, 24, context),
                color: AppColors.gray,
              ),
            ),
          ),
        ),
        VSpace.medium
      ],
    );
  }
}
