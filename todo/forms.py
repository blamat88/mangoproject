from django_extensions.db.fields import ModificationDateTimeField
from django_extensions.db.fields import CreationDateTimeField
from django import forms
from django.forms import ModelForm
from mango.todo.models import Event
from datetime import *


class EventForm(forms.Form):
    
    event = forms.CharField(max_length=255)
    date_event = forms.DateField(required=False)
    to_do = forms.BooleanField(required=False, initial=0)

class EventForm(ModelForm):
    class Meta:
        model = Event


