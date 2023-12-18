<template>
    <div class="section-row-layouts">
        <div :class="[ (this.toggleSide ? 'active': 'no-active') + ' sidemenu' ]">
            <div class="header-shop">
                <label class="header-shop-name">
                    <img class="logo" :src="require('../../img/lOGOfINAL.png')" />
                    <a class="navbar-brand" href="#" @click="ToggleSidebar">
                        <img :src="require('../../img/icons/dots.svg')"/>
                    </a>
                </label>
            </div>
            <ul class="menu-list">
                <!-- <li class="nav-item list-items-menu dropdown mobile-profile-dropdown" @click="toggleDropdown">
                    <img :src="require('../../img/Circle-icons-profile.svg.png')" />
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" >
                        {{ this.auth.user.email | handleEmail }}
                    </a>
                    <div v-if="toggle" class="dropdown-menus-vue">
                        <router-link tag="a" class="dropdown-item" :to="{name:'settings'}">
                            <i class="fas fa-users-cog"></i>
                            اعدادات الحساب
                        </router-link>
                        <a @click="LogOut" class="dropdown-item" href="#">
                            <i class="fas fa-sign-out-alt"></i>
                            تسجيل الخروج
                        </a>
                    </div>
                </li> -->
                <li class="list-items-menu active">
                    <a href="#"  @click="ToggleSidebar" class="item-menu active homemenuitem">
                        <!-- <i class="fas fa-tachometer-alt"></i> -->
                        <img :src="require('../../img/icons/menuhome.svg')" />
                        <label>القائمة {{ auth.user.role_name == 'admin' ? 'admin' : '' }} </label>
                    </a>
                </li>
                <br/><br/>
                <user-side-menu  v-if="auth.user.role_name == 'user'"></user-side-menu>
                <admin-side-menu v-else-if="auth.user.role_name == 'admin'"></admin-side-menu>
                <li class="list-items-menu">
                    <a class="item-menu" @click="LogOut">
                        <!-- <i class="fas fa-users-cog"></i> -->
                        <img :src="require('../../img/icons/logoutmenu.svg')" />
                        <label>تسجيل الخروج</label>
                    </a>
                </li>
            </ul>
        </div>
        <div :class="[ (this.toggleSide ? 'active': 'no-active') + ' container-dashboard' ]">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <label class="header-shop-name mobile">
                            <img class="logo" :src="require('../../img/lOGOfINAL.png')" />
                            <a class="navbar-brand" href="#" @click="ToggleSidebar">
                                <img :src="require('../../img/icons/dots.svg')"/>
                            </a>
                        </label>
                        <li class="nav-item search-container">
                            <input placeholder="Search..." name="" class="form-control search-navbar"/>
                        </li>
                        <li class="nav-item class-tootip-information">
                            <i class="fas fa-question-circle" v-popover:info.bottom></i>
                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                يتم تحديد التوقيت الزمني الخاص بك بناءًا على موقعك الجغرافي يمكنك تعديله من اعدادت الحساب 
                            </popover>
                        </li>
                        <li class="profile-dropdown nav-item dropdown" @click="toggleDropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" >
                                <!-- {{ this.auth.user.email | handleEmail }} -->
                            </a>
                            <img :src="require('../../img/Circle-icons-profile.svg.png')" />
                            <div v-if="toggle" class="dropdown-menus-vue">
                                <router-link tag="a" class="dropdown-item" :to="{name:'settings'}">
                                    <!-- <i class="fas fa-users-cog"></i> -->
                                    <img :src="require('../../img/icons/settingmenu.svg')" />
                                    اعدادات الحساب
                                </router-link>
                                <a @click="LogOut" class="dropdown-item" href="#">
                                    <!-- <i class="fas fa-sign-out-alt"></i> -->
                                    <img :src="require('../../img/icons/logoutmenu.svg')" />
                                    تسجيل الخروج
                                </a>
                            </div>
                        </li>
                        <li class="nav-item mobile-toggleIcon"  @click="ToggleSidebar">
                            <img :src="require('../../img/menu-2-svgrepo-com.svg')"/>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- <div class="container">
                <div class="row"> -->
                    <div class="container-content">
                        <!-- <div class="topbar-permalink">
                            <span>الرئيسية / </span>
                            <router-link tag="span" :to="{name:'add-schedules'}">
                                {{ this.$route.meta.arabicTitle }}
                                <template >
                                    {{ categories_ar[this.$route.params.category] }}
                                </template>
                            </router-link>
                        </div> -->
                        <div v-if="!auth.user.zid_config" class="alert alert-info alert-app-info">
                             <p>
                                <i class="fas fa-info-circle"></i>
                                الرجاء قم بتفعيل بوب أوتو على منصة زد لكى تقوم بالاستفادة من خدامتنا فى ادارة حملاتك
                                <a href="https://apps.zid.sa/application/1974" class="btn btn-warning" target="_blank">
                                  الذهاب الى التطبيق
                               </a>
                            </p>
                        </div>
                        <!-- :key="$route.fullPath" -->
                        <router-view  v-if="auth.user.role_name == $route.meta.middleware"></router-view>
                        <div class="container-404" v-else>
                              <img class="image-404" :src="require('../../img/3819740.jpg')" />
                        </div>
                    </div>
                <!-- </div>
            </div> -->
        </div>
        <alert-response :showsuccess="showsuccess" :showerrors="showerrors"></alert-response>
    </div>
</template>
<script>
import AlertResponse from './User/Schedules/Models/AlertResponse.vue';
import AdminSideMenu from './Sidemenu/AdminSideMenu.vue';
import UserSideMenu from './Sidemenu/UserSideMenu.vue';
export default{
    components: { AlertResponse,UserSideMenu,AdminSideMenu},
    data(){
        return {
           toggle:false,
           toggleSide:false,
           categories_ar:{
                'published' : 'المنشورة',
                'draft' : 'المسودة',
                'working'  : 'قيد التنفيذ',
                'ended'    : 'المنتهية'
           },
           showsuccess:false,
           showerrors:false,
           errors:{},
        }
    },
    methods: {
        toggleDropdown:function(){
            this.toggle        = !this.toggle;
        },
        LogOut:async function(){
            let self = this;
            await axios.post('/api/logout').then(async function({data}){
               await self.auth.logoutAuthToken();
               self.$router.go();
            }).catch(function({response}){
                console.log(response);
            });
        },
        ToggleSidebar:function(){
            this.toggleSide = !this.toggleSide;
        }
    },
    created(){
        let self = this;
        document.addEventListener('click',function(event){
            if((event.target.classList[0] != 'dropdown-menus-vue') && (event.target.classList[0] != 'profile-dropdown') && (event.target.classList[0] != 'nav-link')){
                self.toggle = false;
            }
        });
    },
    filters:{
        handleEmail:function(value){
           return value.substring(0,10) + ' .... ';
        }
    },
    watch:{
        showsuccess:function(value){
            let self = this;
           if(value == true){
              setTimeout(function(){
                self.showsuccess = false;
              },5000);
           }
        },
        showerrors:function(value){
            let self = this;
           if(value == true){
              setTimeout(function(){
                self.showerrors = false;
              },5000);
           }
        }
    }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@200;300;400;500;700;800;900&display=swap');
body{
    font-family: 'Tajawal', 'Helvetica';
    background: #1D2737;

}
.loading-snipper{
    position: fixed;
    left: 0;
    right: 0;
    top:0;
    bottom:0;
    text-align: center;
    background-color: #6161614a;
    z-index: 100000;
}
.loading-snipper img
{
    margin: 15%;
}
.vue-popover{
    padding:10px !important;
}
/* Show from bottom transition */
.show-from-bottom-enter-active,
.show-from-bottom-leave-active {
  transition: transform 0.3s, opacity 0.3s;
}
.show-from-bottom-enter,
.show-from-bottom-leave-to {
  opacity: 0;
  transform: translateY(20px);
}

/* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #15655a;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background:#15655a;
}
</style>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@200;300;400;500;700;800;900&display=swap');
.section-row-layouts{
    position: relative;
}
.sidemenu{
    position: fixed;
    top: 0px;
    right: 0px;
    bottom: 0px;
    width: 18%;
    background: var(--bg) 0% 0% no-repeat padding-box;
    /* background: #F2F2F2 0% 0% no-repeat padding-box; */
    background: #1d2737 0% 0% no-repeat padding-box;
    border-left: 1px solid #eee;
}
.container-dashboard{
    /* position: absolute;
    top: 0px;
    left: 12px;
    bottom: 0px;
    width: 82%;
    height: 1184px;
    padding: 0px; */
    position: absolute;
    top: 0px;
    right: 18%;
    bottom: 0px;
    padding: 0px;
    width: 82%;
}
.header-shop-logo{
    /* margin-top: 24px;
    margin-left: 16px; */
    /* width: 30px;
    height: 30px; */
    /* UI Properties */
    background: #FFBC5D 0% 0% no-repeat padding-box;
    opacity: 1;
}
.header-shop-name
{
    /* margin-top: 21px;
    margin-left:20px; */
    width: auto;
    /* height: 36px; */
    font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-600) 26px/39px var(--unnamed-font-family-poppins);
    letter-spacing: var(--unnamed-character-spacing-0);
    color: var(--heading);
    text-align: left;
    font: normal normal 600 26px/39px 'Tajawal', sans-serif;
    letter-spacing: 0px;
    color: #3B3B3B;
    opacity: 1;
    text-align: right;
    padding: 15px 32px 15px 0px;
}
.header-shop-name img.logo
{
    width: 50%;
}
.menu-list{
    padding: 20px;
    display: inline-block;
    width:100%;
}
.list-items-menu{
    opacity: 1;
    list-style: none;
    display: inline-block;
    padding: 2px 10px;
}
.list-items-menu a img
{
    width: 20px;
    margin-left: 8px;
}
.list-items-menu a.item-menu{
    cursor: pointer;
    width: auto !important;
    border-radius: 28px;
    padding: 13px 16px;
    color: white;
}
.list-items-menu a.active{
    background: var(--surface) 0% 0% no-repeat padding-box;
    background: #FFFFFF 0% 0% no-repeat padding-box;
    box-shadow: -2px 2px 1px #00000008;
    box-shadow: -2px 2px 1px #00000008;
    background: #006167;
    color: white;
}
.item-menu{
    color:rgb(22, 21, 21);
    font-size: 15px;
    text-decoration: none;
    cursor: pointer !important;
    width: 100%;
    display: block;
}
.item-menu label{
    cursor: pointer !important;
}
.item-menu i
{
    width: 25px;
    height: 26px;
    /* UI Properties */
    opacity: 1;
    color: #666666;
}
.navbar-expand-lg .navbar-collapse {
    display: block !important;
    flex-basis: auto;
}
.navbar.navbar-expand-lg.navbar-light.bg-light{
    /* background-color: #f2f2f2 !important; */
    background: #1D2737 !important;
    padding: 15px 0px;
    position: fixed;
    left: 0;
    right: 17%;
    z-index: 10000;
}
.container-content{
    margin-top: 4%;
    padding: 20px 0px;
}
.search-navbar,
.search-navbar:hover,
.search-navbar:focus{
    top: 16px;
    left: 334px;
    width: 630px;
    height: 40px;
    /* background: var(--grey-300) 0% 0% no-repeat padding-box;
    background: #E8E8E8 0% 0% no-repeat padding-box; */
    background: #21222D;
    border-radius: 8px;
    opacity: 1;
    border: 2px solid #21222D !important;
    padding: 15px;
    color: white;
    text-align: left;
}
.topbar-permalink{
    padding: 19px 31px;
    /*padding: 10px 10px;*/
    background-color: #edecea;
    background-color: #ffecb34d;
}
.navbar-nav .nav-item.dropdown{
    /* background-color: #fafafa; */
    background-color: #1d2737;
    padding: 0px 20px;
    direction: rtl;
    margin: 0px 15px;
}
.navbar-expand-lg .navbar-nav .nav-item img{
    width: 30px;
    display: inline-block;
}
.navbar-expand-lg .navbar-nav .nav-link{
    display: inline-block;
    color: white;
}
.dropdown-menus-vue{
    position: fixed;
    background-color: #21222d;
    padding: 0px;
    left: 2%;
    right: auto;
    top: 8%;
    color: white;
}
.dropdown-menus-vue::before{
    content: "";
    background: #2E9E8F;
    position: absolute;
    left: 32px;
    top: -7%;
    border: 8px solid #21222d;
    transform: rotateZ(45deg);
    background: #21222d;

}
.dropdown-menus-vue .dropdown-item{
    border-bottom: 1px solid #5f5a5a;
    padding: 10px 15px;
    font-size: 13px;
}
.dropdown-menus-vue .dropdown-item img
{
    width: 17px !important;
}


.active.sidemenu .list-items-menu label ,
.active.sidemenu .header-shop .header-shop-name{
   display: none;
}
.active.sidemenu .list-items-menu a.item-menu{
    text-align: center;
}

.nav-link.dropdown-toggle{
    direction: ltr;
}

.alert-app-info{
    margin: 1% 3% 0% 3%;
    border-radius: 0px;
    /* box-shadow: 1px 8px 7px 4px #eee; */
    border: 0px;
}
.alert-app-info p{
    margin-bottom:0px;
}

.class-tootip-information > i{
    padding: 6px;
    background-color: white;
    border-radius: 25px;
    font-size: 18px;
    margin: 3px 10px;
    cursor: pointer;
    color: #880e4f;
}
.navbar-collapse .navbar-nav{
    float:left;
}
.homemenuitem{
    background: #A9DFD8 !important;
    color:black !important;
    font-weight: bold;
}
.navbar-brand{
    margin-top: 8%;
}
.navbar-brand img
{
    margin-top: 12px;
    width: 28px;
}
.header-shop-name.mobile{
    padding: 0px 29px 12px 0px;
}
.active.sidemenu .list-items-menu a img {
    margin-left: 0px;
}
.container-404{
   text-align:center;
   padding: 10% 0px;

}
.image-404{
    width: 50%;
}
@media(min-width:1000px){
    .active.sidemenu {
        height: 100%;
        overflow: auto;
        animation: activeSubmenu .2s ease-in-out 0s forwards;
    }
    @keyframes activeSubmenu{
        to{
            width: 8%;
        }
    }

    .no-active.sidemenu{
        animation: noactiveSubmenu .4s inline 0s forwards;
    }
    @keyframes noactiveSubmenu{
        to{
        width: 18%;
        }
    }

    .active.container-dashboard {
        animation: activeContainerDashboard .2s ease-in-out 0s forwards;
    }
    @keyframes activeContainerDashboard{
        to{
            width: 92%;
            right: 8%;
        }
    }
    .active.container-dashboard .navbar.navbar-expand-lg.navbar-light.bg-light{
        right: 8%;
    }
    .mobile-header-logo ,
    .mobile-toggleIcon{
        display: none;
    }
    .mobile-profile-dropdown{
        display: none;
    }
    .header-shop-name.mobile{
        display: none;
    }
}
@media(max-width:1000px){
    .sidemenu{
        left: 200%;
        right: auto;
    }
    .navbar.navbar-expand-lg.navbar-light.bg-light{
        right:0%;
    }
    .container-dashboard{
        right:0%;
        width:100%;
    }
    .navbar-nav{
        flex-direction: row;
        padding: 5px;
    }
    .profile-dropdown{
        display: none;
    }
    .mobile-header-logo .header-logo{
        font-size: 1.3pc;
    }
    .mobile-header-logo .header-shop-logo{
        margin-top: 8px;
        margin-left: 5px;
        width: 23px;
        height: 22px;
    }
    .navbar-brand{
        display: none;
    }
    .mobile-toggleIcon{
        padding: 2px 14px;
    }
    .mobile-toggleIcon img{
        width: 23px !important;
    }
    .container-content{
        margin-top: 15%;
    }
    .mobile-header-logo{
        width:30%;
    }
    .search-container{
        width: 80%;
       padding: 0px;
    }
    .search-container .search-navbar
    {
        width: 100%;
    }
    .sidemenu{
        width: 70%;
    }
    .item-menu{
        font-size: 14px;
    }
    .sidemenu .list-items-menu a.item-menu{
       text-align: right !important;
    }
    .active.sidemenu {
        animation: activeSubmenu .2s ease-in-out 0s forwards;
        z-index: 1000000;
        box-shadow: 0px 4px 14px 9px #74747438;
        height: 100%;
        overflow: auto;
    }
    @keyframes activeSubmenu{
        to{
            left:40%;
            right: 0%;
        }
    }
    .sidemenu .list-items-menu label ,
    .sidemenu .header-shop .header-shop-name{
        display: inline-block !important;
        text-align:right !important;
    }
    .list-items-menu a.item-menu{
        padding: 15px 10px;
    }
    .mobile-profile-dropdown{
        padding: 15px 10px 15px 0px;
        border-bottom: 1px solid #e6e6e6;
        border-top: 1px solid #e6e6e6;
        background-color: #e6e6e6;
        border-radius: 0px;
    }
    .mobile-profile-dropdown img{
        width: 20px;
    }
    .mobile-profile-dropdown a.dropdown-toggle{
        display: inline-block;
    }
    .sidemenu{
        border-left: 1px solid #21222d;
        box-shadow: 0px 4px 14px 9px #101723 !important;

    }
}
</style>
