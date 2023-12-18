import Vue from 'vue'
import VueRouter from 'vue-router'
import Auth from './auth.js';

Vue.use(VueRouter)

import MasterLayout from './components/MasterLayout.vue';
import LoginForm from './components/auth/Login.vue';
import ForgetPassword from './components/auth/ForgetPassword.vue';
import PasswordReset from './components/auth/PasswordReset.vue';
import RegisterForm from './components/auth/Register.vue';
import Dashboard from './components/dashboard/DashboardLayout.vue';
import ShowSchedules from './components/dashboard/User/Schedules/Show.vue';
import AddSchedules from './components/dashboard/User/Schedules/Create.vue';
import EditSchedule from './components/dashboard/User/Schedules/Edit.vue';
import ContactUs from './components/dashboard/User/Schedules/ContactUs.vue';
import TrashSchedules from './components/dashboard/User/Schedules/Trash.vue';
import Settings from './components/dashboard/User/Schedules/Settings.vue';
import AppIntegrated from './components/apps/AppIntegrated.vue';

// section admin
import AdminShowSchedules from './components/dashboard/Admin/Schedules/Index.vue';
import AdminSettings from './components/dashboard/Admin/Schedules/Settings.vue';
import ShowCampiagnDetails from './components/dashboard/Admin/Schedules/Show.vue';

const routes = [{
    path: '/',
    name: 'master-layout',
    component: MasterLayout,
    children: [{
            path: 'forget-password',
            name: 'forget-password',
            component: ForgetPassword,
            meta: {
                requiresAuth: false,
                PreventAuth: true
            }
        }, {
            path: 'password/reset/:token',
            name: 'password-reset',
            component: PasswordReset,
            query: {
                email: null
            },
            meta: {
                requiresAuth: false,
                PreventAuth: true
            }
        }, {
            path: 'login/:service?',
            name: 'login',
            component: LoginForm,
            meta: {
                requiresAuth: false,
                PreventAuth: true
            }
        },
        {
            path: 'register/:service?',
            name: 'register',
            component: RegisterForm,
            meta: {
                requiresAuth: false,
                PreventAuth: true
            }
        }, {
            path: 'app/integrated',
            name: 'app-integrated',
            query: {
                service: null,
                token: null
            },
            component: AppIntegrated,
            meta: {
                requiresAuth: false,
                PreventAuth: true
            }
        },
        // Admin Dashboard
        {
            path: 'admin',
            name: 'admin-show-dashboard',
            component: Dashboard,
            meta: {
                requiresAuth: true,
                middleware: 'admin'
            },
            children: [{
                    path: 'schedules/:page_no?/:category?/',
                    name: 'admin-show-schedules',
                    query: {
                        merchant: null,
                        progress: null,
                        from: null,
                        to: null
                    },
                    component: AdminShowSchedules,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'جميع الحملات',
                        middleware: 'admin'
                    }
                },
                {
                    path: 'add-schedules',
                    name: 'admin-add-schedules',
                    component: AddSchedules,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'اضافة حملة جديدة',
                        middleware: 'admin'
                    }
                },
                {
                    path: 'settings',
                    name: 'admin-settings',
                    component: AdminSettings,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'اعدادات الحساب',
                        middleware: 'admin'
                    }
                },
                {
                    path: 'show-campiagn/:camp_id',
                    name: 'show-campiagn',
                    component: ShowCampiagnDetails,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'تفاصيل الحملة',
                        middleware: 'admin'
                    }
                }

            ]
        },
        // users dashboard
        {
            path: 'dashboard',
            name: 'show-dashboard',
            component: Dashboard,
            meta: {
                requiresAuth: true,
                middleware: 'user'
            },
            children: [{
                    path: 'schedules/:category?',
                    name: 'show-schedules',
                    component: ShowSchedules,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'جميع الحملات',
                        middleware: 'user'
                    }
                },
                {
                    path: 'add-schedules',
                    name: 'add-schedules',
                    component: AddSchedules,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'اضافة حملة جديدة',
                        middleware: 'user'
                    }
                },
                {
                    path: 'edit-schedule/:id',
                    name: 'edit-schedule',
                    component: EditSchedule,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'تعديل الحملة',
                        middleware: 'user'
                    }
                },
                {
                    path: 'contact-us',
                    name: 'contact-us',
                    component: ContactUs,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'تواصل معنا',
                        middleware: 'user'
                    }
                },
                {
                    path: 'trash-schedules',
                    name: 'trash-schedules',
                    component: TrashSchedules,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'الحملات المحذوفة',
                        middleware: 'user'
                    }
                },
                {
                    path: 'settings',
                    name: 'settings',
                    component: Settings,
                    meta: {
                        requiresAuth: true,
                        arabicTitle: 'اعدادات الحساب',
                        middleware: 'user'
                    }
                }

            ]
        }
    ]
}];

const router = new VueRouter({
    mode: 'history',
    routes,
    base: '/',
});


export default router;