# Clario Flutter Test

## Documentation

Please refer to this README.md, comments in the code.

## UI

0.  **Requirements:**
    The app is implemented as per the provided design file and requirements doc.

1.  **Additional features:**

    1.1 **Focus and Unfocus Behavior:**
    Input fields lose focus when clicking anywhere outside the field.
    Focus is removed when clicking the "Sign up" button.

    1.2. **Error Handling in Input Fields:**
    Errors are cleared when refocusing on a previously marked erroneous field.

    1.3. **Visual Details:**
    Gradient angles on the background and buttons are implemented as per the design.

    1.4. **Internationalization:**
    All strings are extracted into a separate Dart class to facilitate adding internationalization in the future.

    1.5. **Design Adjustments:**
    In cases of significant differences between component designs on screens and in the "Components" section, a combination of both designs was used to enhance application visuals.

    1.6. **Input Length Restrictions:**
    The maximum input length for both fields (e-mail and password) is limited to 64 characters.

    1.7. **Error Messages:**
    Spacing between the e-mail and password fields has been increased to accommodate e-mail field error messages comfortably.

    1.8. **Password Requirements:**
    Password requirements from the design (uppercase letter, lowercase letter, and any letter) were chosen over the simpler task requirements as they provide stricter validation.

    1.9. **Loader**
    A loader is displayed on the "Sign up" button during validation.z

## Responsive UI

To ensure proportional component appearance on screens of various sizes, the `flutter_screen_util` package is used.

## Tests

- A unit test has been added to validate e-mail format correctness.
- A unit test has been added to validate password requirements.

## Architecture

The project is implemented using Clean Architecture and Bloc.

## Flutter version and packages version

Latest stable flutter & dart version. Both flutter and packages versions are specified strictly in `pubspec.yaml` to avoid issues from using different version on different machines. The use of ~,^,>,>=,<,<= is discouraged.

## Linting

Project uses the latest flutter_lint package.
