from django.conf.urls.defaults import *
from django.conf import settings
from django.views.generic.simple import direct_to_template
from mango.contacts.views import *


from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^admin/doc/', include('django.contrib.admindocs.urls')),
    (r'^admin/', include(admin.site.urls)),
    (r'^accounts/', include('userena.urls')),
    (r'^messages/', include('userena.contrib.umessages.urls')),
    url(r'^AddContact/', AddContact,name="addcontact"),
    (r'^check/', UpContact),
    url(r'^deletecontact/(?P<contact>[\.\w]+)/', delete_contact, name="deletecontact"),
    url(r'^accounts/(?P<id>[\.\w]+)/AddEvent/', AddEvent, name="newevent" ),
    url(r'^accounts/(?P<id>[\.\w]+)/editcontact/', edit_contact, name="editcontact" ),
    url(r'^accounts/(?P<username>[\.\w]+)/contact/', view_all,name="contact"),
    url(r'^accounts/contact/(?P<id>[\.\w]+)/(?P<contact>[\.\w]+)/', edit_event,name="editevent"),
    url(r'^accounts/(?P<contact>[\.\w]+)/(?P<action>[\.\w]+)/contact/', addhistory,name="history"),
    url(r'^accounts/(?P<id>[\.\w]+)/viewcontact/',view_contact,name="viewcontact"),
    ( r'^face/', include( 'facebook.urls' ) ),
    url(r'^$',
        direct_to_template,
        {'template': 'static/promo.html'},
        name='promo'),
    (r'^i18n/', include('django.conf.urls.i18n')),
    (r'^media/mugshots/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT+'/mugshots'}),
)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^media/(?P<path>.*)$',
         'django.views.static.serve',
         {'document_root': settings.MEDIA_ROOT, 'show_indexes': True, }),
)
