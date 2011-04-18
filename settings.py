import os, sys

abspath = lambda *p: os.path.abspath(os.path.join(*p))

PROJECT_ROOT = abspath(os.path.dirname(__file__))
USERENA_MODULE_PATH = abspath(PROJECT_ROOT, '..')
sys.path.insert(0, USERENA_MODULE_PATH)

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    # ('Your Name', 'your_email@domain.com'),
)

MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'mysql', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'book',                      # Or path to database file if using sqlite3.
        'USER': 'root',                      # Not used with sqlite3.
        'PASSWORD': '',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    }
}

if DEBUG:
    # Use the Python SMTP debugging server. You can run it with:
    # ``python -m smtpd -n -c DebuggingServer localhost:1025``.
    EMAIL_PORT = 1025

TIME_ZONE = 'America/Chicago'
LANGUAGE_CODE = 'en-us'

ugettext = lambda s: s

SITE_ID = 1

USE_I18N = True
USE_L10N = True

MEDIA_ROOT = abspath(PROJECT_ROOT, 'media')
DOCUMENT_ROOT = abspath(PROJECT_ROOT, 'docs')

MEDIA_URL = '/media/'

ADMIN_MEDIA_PREFIX = '/media/admin/'

SECRET_KEY = 'sx405#tc)5m@s#^jh5l7$k#cl3ekg)jtbo2ds(n(kw@gp0t7x@'

TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'userena.middleware.UserenaLocaleMiddleware',
)
TEMPLATE_CONTEXT_PROCESSORS = (
    "django.contrib.auth.context_processors.auth",
    "django.core.context_processors.debug",
    "django.core.context_processors.i18n",
    "django.core.context_processors.media",
    "django.contrib.messages.context_processors.messages",
    "django.core.context_processors.request",
    'django_facebook.context_processors.facebook',
)

AUTHENTICATION_BACKENDS = (
    'userena.backends.UserenaAuthenticationBackend',
    'guardian.backends.ObjectPermissionBackend',
    'django.contrib.auth.backends.ModelBackend',
    'mango.facebook.backends.FacebookBackend',
    'django_facebook.auth_backends.FacebookBackend',
)

ROOT_URLCONF = 'mango.urls'

TEMPLATE_DIRS = (
    abspath(PROJECT_ROOT, 'templates')
)

STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)


INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.admin',
    'mango.profiles',
    'mango.contacts',
    'mango.facebook',
    'easy_thumbnails',
    'guardian',
    'south',
    'userena',
    'userena.contrib.umessages',
)

# Facebook
FACEBOOK_APP_ID = '153309531399400'
FACEBOOK_API_KEY = 'd4063a43fbb2cabe938fd019688a2e65'
FACEBOOK_API_SECRET = 'b70771477eb887d305681148b1c7778f'
FACEBOOK_REDIRECT_URI = 'http://localhost:8000/face/'
FACEBOOK_APP_SECRET= 'b70771477eb887d305681148b1c7778f'


# Userena settings
LOGIN_REDIRECT_URL = '/accounts/%(username)s/'
LOGIN_URL = '/accounts/signin/'
LOGOUT_URL = '/accounts/signout/'
AUTH_PROFILE_MODULE = 'profiles.Profile'

USERENA_DISABLE_PROFILE_LIST = True
USERENA_MUGSHOT_SIZE = 140

# Test settings
TEST_RUNNER = 'django.test.simple.DjangoTestSuiteRunner'
SOUTH_TESTS_MIGRATE = False

# Guardian
ANONYMOUS_USER_ID = -1
