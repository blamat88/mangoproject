from django.conf.urls.defaults import *
from django.conf import settings
from django.views.generic.simple import direct_to_template
from mango.contacts.views import AddContact,UpContact,view_all, view_contact, AddEvent


from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^admin/doc/', include('django.contrib.admindocs.urls')),
    (r'^admin/', include(admin.site.urls)),
    (r'^accounts/', include('userena.urls')),
    (r'^messages/', include('userena.contrib.umessages.urls')),
    (r'^AddContact/', AddContact),
    (r'^newContact/', UpContact),
    (r'^AddEvent/', AddEvent ),
    url(r'^accounts/(?P<username>[\.\w]+)/contact/', view_all,name="contact"),
    url(r'^accounts/(?P<id>[\.\w]+)/viewcontact/',view_contact,name="viewcontact"),
    ( r'^face/', include( 'facebook.urls' ) ),
    url(r'^$',
        direct_to_template,
        {'template': 'static/promo.html'},
        name='promo'),
    (r'^i18n/', include('django.conf.urls.i18n')),
    (r'^media/mugshots/(?P<path>.*)$', 'django.views.static.serve', {'document_root': '/home/user/mango/media/mugshots'}),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^media/(?P<path>.*)$',
         'django.views.static.serve',
         {'document_root': settings.MEDIA_ROOT, 'show_indexes': True, }),
)
