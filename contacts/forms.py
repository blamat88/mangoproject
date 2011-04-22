from django import forms
from django.forms import ModelForm
from mango.contacts.models import Contact

class ContactForm(forms.Form):

        user= forms.CharField(max_length=255)
        name = forms.CharField(max_length=255)
        email = forms.EmailField(max_length=255)
        phone = forms.CharField(max_length=255)
        mobil = forms.CharField(max_length=255)


class ContactForm(ModelForm):
    class Meta:
        model = Contact






