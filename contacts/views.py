import datetime
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
    t = Event.objects.none()
    later = Event.objects.none()
    today = Event.objects.none()
    after = Event.objects.none()

    todo = Event.objects.none()
    if contacts:
        for c in contacts:
            todo = todo|(Event.objects.select_related().filter(contact=c))
            t = t|todo.filter(to_do=0)
            later = later |t.filter(date_event__lt=datetime.datetime.now())
            today = today |t.filter(date_event=datetime.datetime.now())
            after = after |t.filter(date_event__gt=datetime.datetime.now())


    return render_to_response('userena/contact.html',{'contacts':contacts, 'later':later,'today':today,'after':after} ,context_instance=RequestContext(request))


def addhistory(request,contact,action):
    c = Contact.objects.get(id=contact)
    user = request.user.username
    contact_history = ContactHistory(contact=c,history=action)
    contact_history.save()
    return HttpResponseRedirect('/accounts/'+user+'/contact')


def view_contact(request,id):
    
    contact = Contact.objects.get(id=id)
    t = Event.objects.none()
    later = Event.objects.none()
    today = Event.objects.none()
    after = Event.objects.none()

    todo = Event.objects.none()
    if contact:
        todo = todo|(Event.objects.select_related().filter(contact=contact))
        t = t|todo.filter(to_do=0)
        later = later |t.filter(date_event__lt=datetime.datetime.now())
        today = today |t.filter(date_event=datetime.datetime.now())
        after = after |t.filter(date_event__gt=datetime.datetime.now())

    return render_to_response('userena/viewcontact.html' ,{'contact':contact, 'later':later,'today':today,'after':after} ,context_instance=RequestContext(request))

def edit_contact(request,id):

    contact = Contact.objects.get(id=id)
    if request.method == 'POST':
        form = ContactForm(request.POST, instance=contact)
        if (form.is_valid()):
            contact.name = request.POST["name"]
            contact.email=request.POST["email"]
            contact.phone=request.POST["phone"]
            contact.mobil=request.POST["mobil"]
            contact.user = request.user
            contact.save()
            return HttpResponseRedirect('/accounts/'+request.user.username+'/contact')
    else:
        form = ContactForm(instance=contact)

    return render_to_response('userena/editcontact.html' ,{'form': form},context_instance=RequestContext(request))




def UpContact(request):
    
    return render_to_response('userena/check.html',context_instance=RequestContext(request))

def delete_contact(request,contact):
    try:
        Contact.objects.filter(id=contact).delete()
    except:
        Contact.objects.filter(id=contact).delete()



    return HttpResponseRedirect('/accounts/'+request.user.username+'/contact')


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
        u = User.objects.get(id=request.user.id)

        phone = request.POST['phone']
        if (form.is_valid()):
            form2.name = name
            form2.user = u
            form2.phone = phone
            form2.email = email
            form2.mobil = mobil
            form2.save()
            return HttpResponseRedirect('/accounts/'+request.user.username+'/contact')
#        if form.is_valid():
#            return render_to_response('prueba.html', {'usera': usera}, context_instance=RequestContext(request))
#            form.save()

#            
    else:
        form = ContactForm()
    return render_to_response('userena/addcontact_form.html', {'form': form}, context_instance=RequestContext(request))


def AddEvent(request,id):
    
    form = EventForm(request.POST)
    contact = Contact.objects.get(id=id)
    if request.method == 'POST':
        form2 = Event()
        event = request.POST['event']
        date_event = request.POST['date_event']
        
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
       
            return HttpResponseRedirect('/accounts/'+request.user.username+'/contact')
    else:
        form = EventForm()
    return render_to_response('userena/addevent.html', {'form': form, 'contact': contact}, context_instance=RequestContext(request))

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
            return HttpResponseRedirect('/accounts/'+request.user.username+'/contact')
    else:
        form = EventForm(instance=event_model)

    return render_to_response('userena/editevent.html' ,{'form': form, 'contact':c},context_instance=RequestContext(request))