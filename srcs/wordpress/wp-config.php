<?php

////////////// REDIS CACHE CONFIGURATION //////////////

// define( 'WP_REDIS_HOST', getenv('REDIS_HOST') );
// define( 'WP_REDIS_PORT', getenv('REDIS_PORT') );
// define( 'WP_REDIS_PASSWORD', 'secret' );
// define( 'WP_REDIS_TIMEOUT', 1 );
// define( 'WP_REDIS_READ_TIMEOUT', 1 );

// change the database for each site to avoid cache collisions
// define( 'WP_REDIS_DATABASE', 0 );

// supported clients: `phpredis`, `credis`, `predis` and `hhvm`
// define( 'WP_REDIS_CLIENT', 'phpredis' );

// automatically delete cache keys after 7 days
// define( 'WP_REDIS_MAXTTL', 60 * 60 * 24 * 7 );

// bypass the object cache, useful for debugging
// define( 'WP_REDIS_DISABLED', true );

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MARIADB_DATABASE') );

/** MySQL database username */
define( 'DB_USER', getenv('MARIADB_USER') );

/** MySQL database password */
define( 'DB_PASSWORD', getenv('MARIADB_PASSWORD') );

/** MySQL hostname */
define( 'DB_HOST', getenv('MARIADB_HOST').':'.getenv('MARIADB_PORT') );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '5 bUJ! Abwi`fVi]m @{xG4H8PrV]SUGZ(tv|Ftm*fREqFbULLhb{]*ws3@*f6@v' );
define( 'SECURE_AUTH_KEY',   '=@T]2klj|fdFFTX%=TOz.24g!+JowL80eE*.V^As&yf!`n1sR/aQ6$%U;m pkGg~' );
define( 'LOGGED_IN_KEY',     ',taYT5;G9h,szQI*pL!I(crmZd A_s]7v{Tdb;aI$)uiE@E@G<3h7+Xx$BP<|x3.' );
define( 'NONCE_KEY',         '<Q!eAe0lE]4d/vR<(c<Q{LC;``cpgtGU+nXbE404A3Pa,_x19Y3vM:zlG>z>}EH4' );
define( 'AUTH_SALT',         'FCe^.Ty(kE-}u.(ypP-PjY2oObjA/;GYvu!uW/QEW~.}e:_qo<^xu+w!IVskPzMO' );
define( 'SECURE_AUTH_SALT',  '`qax~/)LV*eWMAei&7hdPk(48SzjH7#B~%s+4D$-VllVhKt`OmsZ0 QNjr+D>8>D' );
define( 'LOGGED_IN_SALT',    '#|)oje#WL|ExO)Amh&`W!UNue./>geFrLT;ImPiL_ LVR14bVtr5<zE*pPJqg}9V' );
define( 'NONCE_SALT',        'h!|cNIh3LtpSx=T5jtijczjW*-VLT{,Jq;x)&_&0pGlh/) %64jJi$-LVz3yR,b=' );
define( 'WP_CACHE_KEY_SALT', '~*_>jszh*-u4}}fQc668jlt9~/?8~AW7P%t F.[Ev{;/nDVi7 cJd3oag1-PkoKT' );

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';




/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';