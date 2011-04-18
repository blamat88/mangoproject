from django.conf.urls.defaults import *
from mango.facebook.views import login,logout
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',

    # Example:
   # (r'^facebook/', include('django_facebook.urls')),
    
    url( r'^$', login, name='login',),
   url( r'^logout/', logout, name='logout' ),
    # Uncomment the admin/doc line below to enable admin documentation:
    # (r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # (r'^admin/', include(admin.site.urls)),
)
