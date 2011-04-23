from django_extensions.db.fields import ModificationDateTimeField
from django.utils.translation import ugettext_lazy as _
from django_extensions.db.fields import CreationDateTimeField
from django.contrib.auth.models import User
from mango.contacts.models import Contact
from django.db import models

from datetime import *

class Event(models.Model):


    DETAIL_EVENT_CHOICES = (('call', _('Call')),('send email', _('Send Email')),)
    contact = models.ForeignKey(Contact, related_name='event',blank=True,null=True)
    event = models.CharField(_('detail event'),
            choices=DETAIL_EVENT_CHOICES,blank=False,null=False,max_length=255)
    date_event = models.DateField(_('event date'),blank=False,null=False)
    to_do = models.BooleanField(blank=True,default=0)

    def __unicode__(self):
        return ' %s to %s ' % (self.event, self.contact)