from urllib2 import Request
from django.conf.urls.defaults import *
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect
from mango.contacts.models import *
from mango.todo.models import Event
from mango.contacts.forms import ContactForm
from mango.todo.forms import EventForm
from django.template import RequestContext
from django import forms
from django.shortcuts import get_object_or_404
from django.contrib.auth.models import User

# Create your views here.

def view_all(request,username):
    user=User.objects.get(username=username)
    contacts = Contact.objects.filter(user=user)
    
    todo = Event.objects.none()
    if contacts:
        for c in contacts:
            todo = todo|(Event.objects.select_related().filter(contact=c))

    return render_to_response('userena/contact.html',{'contacts':contacts, 'todo':todo} ,context_instance=RequestContext(request))

def addhistory(request,contact,action):
    c = Contact.objects.get(id=contact)
    user = request.user.username
    contact_history = ContactHistory(contact=c,history=action)
    contact_history.save()
    return HttpResponseRedirect('/accounts/'+user+'/contact')


def view_contact(request,id):
    
    contact = Contact.objects.get(id=id)
    if request.method == 'POST':
        form = ContactForm(request.POST, instance=contact)
        if (form.is_valid()):
            contact.name = request.POST["name"]
            contact.email=request.POST["email"]
            contact.phone=request.POST["phone"]
            contact.mobil=request.POST["mobil"]

            contact.save()
            return HttpResponseRedirect('')
    else:
        form = ContactForm(instance=contact)

    return render_to_response('userena/viewcontact.html' ,{'form': form},context_instance=RequestContext(request))

def UpContact(request):
    
    return render_to_response('userena/check.html',context_instance=RequestContext(request))

def AddContact(request):
#    contact = get_object_or_404(Contact, user_id=2,)
#
#    contact.name = "Daniel"
#    contact.save()
    
    form = ContactForm(request.POST)
    if request.method == 'POST':
        form2 = Contact()
        name = request.POST['name']
        email = request.POST['email']
        mobil = request.POST['mobil']
        u = User.objects.get(id=request.POST['user_id'])

        phone = request.POST['phone']
        if (form.is_valid()):
            form2.name = name
            form2.user = u
            form2.phone = phone
            form2.email = email
            form2.mobil = mobil
            form2.save()
            return HttpResponseRedirect('/check')
#        if form.is_valid():
#            return render_to_response('prueba.html', {'usera': usera}, context_instance=RequestContext(request))
#            form.save()

#            
    else:
        form = ContactForm()
    return render_to_response('userena/addcontact_form.html', {'form': form}, context_instance=RequestContext(request))


def AddEvent(request,id):
    
    form = EventForm(request.POST)
    
    if request.method == 'POST':
        form2 = Event()
        event = request.POST['event']
        date_event = request.POST['date_event']
        
        contact = Contact.objects.get(id=id)
        
        try:
            to_do = request.POST['to_do']
        except:
            to_do = 0
        if (form.is_valid()):

            form2.event = event
            form2.contact = contact
            form2.date_event = date_event
            form2.to_do = to_do
            form2.save()
       
            return HttpResponseRedirect('/check')
    else:
        form = EventForm()
    return render_to_response('userena/addevent.html', {'form': form}, context_instance=RequestContext(request))

def edit_event(request,id,contact):

    event_model= Event.objects.get(id=id)
    form = EventForm(request.POST, instance=event_model)
    c=Contact.objects.get(id=contact)
    if request.method == 'POST':
        try:
            to_do = request.POST['to_do']
        except:
            to_do = 0
        if (form.is_valid()):
            event_model.event = request.POST["event"]
            event_model.date_event=request.POST["date_event"]
            
            event_model.contact = c
            event_model.save()
            return HttpResponseRedirect('/check')
    else:
        form = EventForm(instance=event_model)

    return render_to_response('userena/editevent.html' ,{'form': form},context_instance=RequestContext(request))