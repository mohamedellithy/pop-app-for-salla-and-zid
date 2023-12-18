/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;

// we import the vue router from our router/index.js file
import router from './router';

import axios from 'axios';
import VueAxios from 'vue-axios';
import Auth from './auth.js';

import Popover from 'vue-js-popover'

Vue.use(VueAxios, axios);

Vue.use(Popover);

Vue.prototype.auth = Auth;

router.beforeEach(async(to, from, next) => {
    if (to.matched.some(record => record.meta.requiresAuth)) {
        if (await Auth.authCheck()) {
            next();
            return;
        } else {
            router.push('/login');
        }
    } else if (to.matched.some(record => record.meta.PreventAuth)) {
        if (Auth.token != null) {
            await Auth.authCheck();
            console.log(Auth.user);
            if (Auth.user.role_name == 'user') {
                if (to.params.service) {
                    let field = {};
                    field.service = to.params.service;
                    if (to.params.service == 'salla') {
                        field.code = to.query.code;
                    }

                    let { data } = await axios.post('/api/validate-authenticated-app', field);

                    if (data.service) {
                        if (data.service == 'salla') {
                            router.push({
                                name: data.redirectTo,
                                query: {
                                    service: data.service
                                }
                            });
                        } else {
                            window.location.href = data.redirectTo;
                            return;
                        }
                    } else {
                        router.push({ name: 'show-schedules' });
                    }

                } else {
                    console.log('bb');
                    router.push({ name: 'show-schedules' });
                }
            } else {
                router.push({ name: 'admin-show-dashboard' });
            }
            //return router.back();
        } else {
            console.log('go any where');
            next();
        }
    }
});

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

//Vue.component('master-content', require('./components/MasterContent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router
});