
from django.conf import settings
from django.contrib.auth import models as auth_models
from django.contrib.auth.models import User
import cgi
import urllib
import simplejson

from userena.utils import generate_sha1, get_profile_model
from mango.facebook import models
from django.contrib.auth.models import UserManager
from guardian.shortcuts import assign, get_perms
import random

import string
PERMISSIONS = {
    'profile': ('view_profile', 'change_profile'),
    'user': ('change_user', 'delete_user')
}

class FacebookBackend(UserManager):

    def authenticate(self, token=None):

        facebook_session = models.FacebookSession.objects.get(
            access_token=token,
        )

        profile = facebook_session.query('me')

        try:
            user = auth_models.User.objects.get(username=profile['id'])
        except auth_models.User.DoesNotExist, e:
            user = auth_models.User(username=profile['id'])



            user.set_unusable_password()
            user.email = profile['email']
            user.first_name = profile['first_name']
            user.last_name = profile['last_name']
            password = self.password_generate()
            user.set_password(password)

            user.email_user("Registrado en libreta", 'your username:'+user.username+'\n'+'your password:'+password)

            user.save()
            profile_model = get_profile_model()
            new_profile = profile_model(user=user)
            #new_profile.location = profile['hometown']['name']
            new_profile.facebook_url = profile['link']
            new_profile.save(using=self._db)

            for perm in PERMISSIONS['profile']:
                assign(perm, user, new_profile)

            for perm in PERMISSIONS['user']:
                assign(perm, user, user)

            try:
                models.FacebookSession.objects.get(uid=profile['id']).delete()
            except models.FacebookSession.DoesNotExist, e:
                pass

            facebook_session.uid = profile['id']
            facebook_session.user = user
            facebook_session.save()



        return user

    def get_user(self, user_id):

        try:
            return auth_models.User.objects.get(pk=user_id)
        except auth_models.User.DoesNotExist:
            return None

    def password_generate(self):

        s=string.lowercase+string.digits
        c = ''.join(random.sample(s,10))
        return c