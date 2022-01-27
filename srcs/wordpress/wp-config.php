<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MARIADB_DATABASE' ));

/** MySQL database username */
define( 'DB_USER', getenv('WP_ADMIN_USER' ));

/** MySQL database password */
define( 'DB_PASSWORD', getenv('WP_ADMIN_PWD' ) );

/** MySQL hostname */
define( 'DB_HOST', getenv('MARIADB_HOST' ) );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'w!w9U%d4mf9av cN3mq>9fU${&Q=43[kRjl[QeA.KRP]*f4?k29Yh4;2|fLYG7k#' );
define( 'SECURE_AUTH_KEY',  'uYLS(jGeCp4?$v+*x]SgIfj20v1NvaXX(UV:O3Z8%sRdV*JFSwT{R8R*?Sxu1J_)' );
define( 'LOGGED_IN_KEY',    '@%P@mzW{>]r.uWP38a`wyS|%Ga^*38C+%$C`kC+Nwigi7btH3x~OJsi}GtAa.N,+' );
define( 'NONCE_KEY',        'n?ccxw)c62~n :(/|fBCjnhMhWaa!!7d{[u$3*9^Dp1URFgJso5DF(x[Wnfa$0^1' );
define( 'AUTH_SALT',        '*Fa0vaKyhH[dY.O]H+[IOD:A[9a[!@gsCux}MR2cs{I[b}$w8ho`*T&ScGmhP[rP' );
define( 'SECURE_AUTH_SALT', 'c|xTh_Qm{D/y]F#a5+K{6vlv|7qM]&O`CrlCR+w6m>B49`h=zyMa.GSI6cOfY}y)' );
define( 'LOGGED_IN_SALT',   '8;]9O:No`:eDSqD>sL1JGE25X2RQ}&4L]M/XbiVJjG sxfy[ OhbS)mtzqynjj~s' );
define( 'NONCE_SALT',       '-9I.A _j_l/5oOo2:) UC(h[!7}Yr?:,[v(B/Bc )aj[g-K-$=W{Md9&K9)]SXs~' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';