# core-ui

A package containing core UI components as per the Innovaccer design system.

## Getting Started

Install the plugin by using the following in your `pubspec.yaml` file.

  ```dart
   core_ui:
     hosted:
       name: core_ui
       url: http://10.10.14.147:8081
     version: 0.0.59
  ```

## Usage

#### Import the core-ui package and use widget


```bash
    1) MDSTextFormField(
        textInputType: TextInputType.text,
        parentContext: context,
        prefixIcon: Icons.person_outline,
        suffixIcon: Icons.info_outline,
        textEditingController: _textEditingController,)
    
    2) MDSButton(
        fullWidth: false,
        contentPadding: 0,
        onTap: () { },
        buttonType: ButtonType.TEXT_BUTTON,
        textButtonColor: Theme.of(context).primaryColor,
        buttonText: 'Forgot Password ?',)
```

