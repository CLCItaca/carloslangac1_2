import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @pantallaPrincipal.
  ///
  /// In es, this message translates to:
  /// **'Pantalla Principal'**
  String get pantallaPrincipal;

  /// No description provided for @usuarioBloqueado.
  ///
  /// In es, this message translates to:
  /// **'Este usuario esta bloqueado'**
  String get usuarioBloqueado;

  /// No description provided for @nombre.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get nombre;

  /// No description provided for @contrasenaError.
  ///
  /// In es, this message translates to:
  /// **'El usuario y/o contraseña son incorrectos'**
  String get contrasenaError;

  /// No description provided for @contrasena.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get contrasena;

  /// No description provided for @contrasenaOtra.
  ///
  /// In es, this message translates to:
  /// **'Introduce tu contraseña otra vez'**
  String get contrasenaOtra;

  /// No description provided for @iniciarSesion.
  ///
  /// In es, this message translates to:
  /// **'Iniciar Sesion'**
  String get iniciarSesion;

  /// No description provided for @registrarse.
  ///
  /// In es, this message translates to:
  /// **'Registrarse'**
  String get registrarse;

  /// No description provided for @inicioGoogle.
  ///
  /// In es, this message translates to:
  /// **'Acceder con Google'**
  String get inicioGoogle;

  /// No description provided for @olvido.
  ///
  /// In es, this message translates to:
  /// **'¿Olvidaste tu contraseña'**
  String get olvido;

  /// No description provided for @recuperar.
  ///
  /// In es, this message translates to:
  /// **'Recuperar Contraseña'**
  String get recuperar;

  /// No description provided for @nombreUsuario.
  ///
  /// In es, this message translates to:
  /// **'Nombre de Usuario'**
  String get nombreUsuario;

  /// No description provided for @cancelar.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancelar;

  /// No description provided for @aceptar.
  ///
  /// In es, this message translates to:
  /// **'Aceptar'**
  String get aceptar;

  /// No description provided for @registros.
  ///
  /// In es, this message translates to:
  /// **'Registros'**
  String get registros;

  /// No description provided for @trata.
  ///
  /// In es, this message translates to:
  /// **'Tratamiento'**
  String get trata;

  /// No description provided for @sr.
  ///
  /// In es, this message translates to:
  /// **'Sr.'**
  String get sr;

  /// No description provided for @sra.
  ///
  /// In es, this message translates to:
  /// **'Sra.'**
  String get sra;

  /// No description provided for @anadirImagen.
  ///
  /// In es, this message translates to:
  /// **'Añadir Imagen'**
  String get anadirImagen;

  /// No description provided for @edad.
  ///
  /// In es, this message translates to:
  /// **'Edad'**
  String get edad;

  /// No description provided for @nacimiento.
  ///
  /// In es, this message translates to:
  /// **'Lugar de nacimiento'**
  String get nacimiento;

  /// No description provided for @terminos.
  ///
  /// In es, this message translates to:
  /// **'Aceptar términos y condiciones'**
  String get terminos;

  /// No description provided for @crearUsuario.
  ///
  /// In es, this message translates to:
  /// **'Crear Usuario'**
  String get crearUsuario;

  /// No description provided for @editarUsuario.
  ///
  /// In es, this message translates to:
  /// **'Editar Usuario'**
  String get editarUsuario;

  /// No description provided for @compra.
  ///
  /// In es, this message translates to:
  /// **'Compra'**
  String get compra;

  /// No description provided for @pedido.
  ///
  /// In es, this message translates to:
  /// **'Pedido'**
  String get pedido;

  /// No description provided for @pedidos.
  ///
  /// In es, this message translates to:
  /// **'Pedidos'**
  String get pedidos;

  /// No description provided for @yo.
  ///
  /// In es, this message translates to:
  /// **'Yo'**
  String get yo;

  /// No description provided for @bienvenido.
  ///
  /// In es, this message translates to:
  /// **'Bienvenido'**
  String get bienvenido;

  /// No description provided for @precio.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get precio;

  /// No description provided for @realizarCompra.
  ///
  /// In es, this message translates to:
  /// **'Realizar Compra'**
  String get realizarCompra;

  /// No description provided for @numero.
  ///
  /// In es, this message translates to:
  /// **'Número'**
  String get numero;

  /// No description provided for @estado.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get estado;

  /// No description provided for @contacto.
  ///
  /// In es, this message translates to:
  /// **'Contacto'**
  String get contacto;

  /// No description provided for @contactanos.
  ///
  /// In es, this message translates to:
  /// **'Contactanos'**
  String get contactanos;

  /// No description provided for @telefono.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get telefono;

  /// No description provided for @web.
  ///
  /// In es, this message translates to:
  /// **'Página Web'**
  String get web;

  /// No description provided for @ubi.
  ///
  /// In es, this message translates to:
  /// **'Ubicación'**
  String get ubi;

  /// No description provided for @cambiar.
  ///
  /// In es, this message translates to:
  /// **'Cambiar'**
  String get cambiar;

  /// No description provided for @nuevo.
  ///
  /// In es, this message translates to:
  /// **'Nuevo'**
  String get nuevo;

  /// No description provided for @admin.
  ///
  /// In es, this message translates to:
  /// **'Administrador'**
  String get admin;

  /// No description provided for @productos.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get productos;

  /// No description provided for @usuarios.
  ///
  /// In es, this message translates to:
  /// **'Usuarios'**
  String get usuarios;

  /// No description provided for @usuario.
  ///
  /// In es, this message translates to:
  /// **'Usuario'**
  String get usuario;

  /// No description provided for @borrar.
  ///
  /// In es, this message translates to:
  /// **'Borrar'**
  String get borrar;

  /// No description provided for @asegurarUsuario.
  ///
  /// In es, this message translates to:
  /// **'¿Estas seguro que quieres borrar este usuario?'**
  String get asegurarUsuario;

  /// No description provided for @asegurarProducto.
  ///
  /// In es, this message translates to:
  /// **'¿Estas seguro que quieres borrar este producto?'**
  String get asegurarProducto;

  /// No description provided for @asegurarContrasena.
  ///
  /// In es, this message translates to:
  /// **'Intoduzca su contraseña'**
  String get asegurarContrasena;

  /// No description provided for @anadirUsuario.
  ///
  /// In es, this message translates to:
  /// **'Añadir Usuario'**
  String get anadirUsuario;

  /// No description provided for @anadirProducto.
  ///
  /// In es, this message translates to:
  /// **'Añadir Producto'**
  String get anadirProducto;

  /// No description provided for @producto.
  ///
  /// In es, this message translates to:
  /// **'Producto'**
  String get producto;

  /// No description provided for @descripcion.
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get descripcion;

  /// No description provided for @foto.
  ///
  /// In es, this message translates to:
  /// **'Foto'**
  String get foto;

  /// No description provided for @editarProducto.
  ///
  /// In es, this message translates to:
  /// **'Editar Producto'**
  String get editarProducto;

  /// No description provided for @editarEstado.
  ///
  /// In es, this message translates to:
  /// **'Editar Estado'**
  String get editarEstado;

  /// No description provided for @pedidoVerbo.
  ///
  /// In es, this message translates to:
  /// **'Pedido'**
  String get pedidoVerbo;

  /// No description provided for @produccion.
  ///
  /// In es, this message translates to:
  /// **'En Producción'**
  String get produccion;

  /// No description provided for @reparto.
  ///
  /// In es, this message translates to:
  /// **'En Reparto'**
  String get reparto;

  /// No description provided for @entregado.
  ///
  /// In es, this message translates to:
  /// **'Entregado'**
  String get entregado;

  /// No description provided for @menu.
  ///
  /// In es, this message translates to:
  /// **'Menú'**
  String get menu;

  /// No description provided for @cerrarSesion.
  ///
  /// In es, this message translates to:
  /// **'Cerrar Sesión'**
  String get cerrarSesion;

  /// No description provided for @perfil.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get perfil;

  /// No description provided for @salir.
  ///
  /// In es, this message translates to:
  /// **'Salir'**
  String get salir;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
