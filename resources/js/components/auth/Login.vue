<template>
    <div class="container-fluid">
        <section class="row" :style="`min-height:755px;background-color: #111827;`">
            <header style="color: white;background-color: #111827;margin: 0px;">
                <a href="/">
                    <img src="../../img/lOGOfINAL.png">
                </a>
            </header>
            <div class="col-lg-7 text-center">
                <h2 class="title-login" style="">مرحبا بك فى منصة بوب أوتو</h2>
                <div class="description-login">
                    بوب أوتو هى الأداة الأمثل لنمو تجارتك
                    نسهل عليك أطلاق العروض و التخفيضات و التعديل على المنتجات بشكل مؤتمت %100 لتركز نجاح تجارتك
                </div>
                <img class="img-marketing" :src="this.Marketing" />
            </div>
            <div class="col-lg-5 text-center">
                <div class="row row-form-ifram">
                    <form method="post" @submit.prevent="LoginSubmit()">
                        <div class="section-login-form">
                            <h4 class="frame-title-login">
                                تسجيل الدخول
                             </h4>
                             <p v-if="success_reset_password" class="alert alert-success">
                                {{ success_reset_password }}
                             </p>
                            <div class="form-group">
                                <label>البريد الالكترونى</label>
                                <input v-model="field.email" type="email" placeholder="" class="form-control"/>
                                <template v-if="errors.email">
                                    <p style="line-height: 2.5em;color: red;" v-for="(error,key) in errors.email" :key="key">{{ error }}</p>
                                </template>
                            </div>
                            <div class="form-group">
                                <label>كلمة المرور</label>
                                <input v-model="field.password" :type="[field.password_show == false ? 'password' : 'text']" placeholder="" class="form-control"/>
                                <i v-if="field.password_show == false" @click="field.password_show = !field.password_show" class="img-show-hide-password fas fa-eye"></i>
                                <i v-if="field.password_show == true" @click="field.password_show = !field.password_show" class="img-show-hide-password fas fa-eye-slash"></i>
                                <template v-if="errors.password">
                                    <p style="line-height: 2.5em;color: red;" v-for="(error,key) in errors.password" :key="key">{{ error }}</p>
                                </template>
                            </div>
                            <div class="remember-me">
                                <span>
                                    <input type="checkbox" checked/>
                                    <label>تذكرني</label>
                                </span>
                                <span class="forget-password">
                                    <router-link :to="{name:'forget-password'}">هل نسيت كلمة المرور</router-link>
                                </span>
                            </div>
                            <div class="submit-btns">
                                <button type="submit" class="btn submit-login">
                                    تسجيل الدخول
                                </button>
                            </div>
                            <!-- <div class="orContainer">
                                <span> أو </span>
                            </div> -->
                            <div class="RegisterSectionLink">
                                 <span>ليس لديك حساب ؟</span>
                            </div>

                            <router-link v-if="this.$route.params.service" tag="a" :to="{path:'/register'+ ( this.$route.params.service ? '/' + this.$route.params.service : '') }" class="link-register"> انشاء حساب جديد </router-link>
                            <a v-else href="https://apps.zid.sa/application/1974">انشاء حساب جديد </a>

                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</template>
<script>
import backgroundPatternImage from '../../img/pattern.png';
import HideIcon from '../../img/Hide.png';
import Marketing from '../../img/Digital-Marketing-Transparent-PNG.png';
export default {
    components: {backgroundPatternImage,HideIcon,Marketing},
    data(){
        return{
            field:{
                password_show:false
            },
            errors:{},
            backgroundPatternImage,
            HideIcon,
            Marketing,
            success_reset_password:null
        }
    },
    methods:{
        LoginSubmit:async function(){
            let self = this;
            this.field.service = this.$route.params.service;
            if(this.field.service == "salla"){
                this.field.code    = this.$route.query.code;
            }
            await axios.post('/api/login',this.field).then(function({data}){
                self.auth.setAuthToken(data.access_token);
                if(data.service){
                    if(data.service == 'zid'){
                        window.location.href=data.redirectTo;
                    } else if(data.service == 'salla'){
                        self.$router.push({
                            name: data.redirectTo,
                            query : {
                                service: data.service
                            }
                        });
                    }
                } else {
                    if(data.role_name === 'admin'){
                        self.$router.push({name: 'admin-show-schedules'});
                    } else {
                        self.$router.push({name: 'show-schedules'});
                    }
                }
            }).catch(function({response}){
                if(response.status == 429){
                    self.errors = {email:[
                        'محاولات تسجيل دخول كثيرة جدًا. يرجى المحاولة مرة أخرى فى غضون 60 ثانية'
                    ]};
                } else {
                    console.log(response);
                    self.errors = response.data.errors;
                }
            });
        }
    },
    created:function(){
        let self = this;
        // if(this.success_reset_password = window.localStorage.getItem("success_reset_password")){
        //     window.localStorage.removeItem('success_reset_password');
        // }
    }
}
</script>
<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Tajawal:wght@200;300;400;500;700;800;900&display=swap');
.title-login {
    margin-top: 1%;
    margin-right: 10%;
    width: 500px;
    height: 191px;
    font: var(--unnamed-font-style-normal) normal bold 72px/90px var(--unnamed-font-family-poppins);
    letter-spacing: var(--unnamed-character-spacing-0);
    color: var(--surface);
    text-align: right !important;
    font: normal normal bold 72px/90px 'Tajawal', sans-serif;
    letter-spacing: 0px;
    color: #FFFFFF;
    opacity: 1;
}
header{
    color: white;
    background-color: rgb(17, 24, 39);
    margin: 0px;
    padding: 1% 6%;
}
header img{
    width: 158px;
}
.description-login {
    top: 808px;
    margin-right: 10%;
    width: 650px;
    height: 44px;
    font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-15)/var(--unnamed-line-spacing-23) var(--unnamed-font-family-poppins);
    letter-spacing: var(--unnamed-character-spacing-0);
    color: var(--surface);
    text-align: right;
    font: normal normal normal 15px/23px 'Tajawal', sans-serif;
    letter-spacing: 0px;
    color: #FFFFFF;
    text-align: right !important;
}
.section-login-form{
    /* Layout Properties */
    margin-top: 0px;
    padding: 10% 10% 10% 10%;
    height: auto;
    position: relative;
    /* UI Properties */
   /* background: var(--surface) 0% 0% no-repeat padding-box;*/
    background: #FFFFFF 0% 0% no-repeat padding-box;
    box-shadow: 16px 0px 50px #0B115840;
    border-radius: 8px;
    opacity: 1;
}
.frame-title-login{
    /* margin-top:150px; */
    margin-top: 1% !important;
    height: 39px;
    /* font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-medium) var(--unnamed-font-size-28)/var(--unnamed-line-spacing-42) var(--unnamed-font-family-poppins); */
    letter-spacing: var(--unnamed-character-spacing-0);
    color: var(--heading);
    text-align: center;
    /* font: normal normal medium 28px/42px Poppins; */
    letter-spacing: 0px;
    color: #3B3B3B;
    opacity: 1;
    position: relative;
    /* font-weight: bolder;
    font-size: 25px; */
    font: normal normal medium 28px/42px 'Tajawal', sans-serif;
}
.section-login-form .form-group{
    text-align: right;
    padding: 7px 0px;
    position: relative;
}
.section-login-form .form-group label{
    line-height: 2.5em;
    font-size: 15px;
}
.section-login-form .form-group input{
    height: 48px;
    /* UI Properties */
    background: var(--grey-100) 0% 0% no-repeat padding-box;
    background: #F5F5F5 0% 0% no-repeat padding-box;
    border-radius: 8px;
    opacity: 1;
}
.remember-me{
    text-align: right;
    padding: 0px;
}
.remember-me label{
    color:#636363;
    height: 20px;
    /* UI Properties */
    font: var(--unnamed-font-style-normal) normal var(--unnamed-font-weight-normal) var(--unnamed-font-size-14)/var(--unnamed-line-spacing-21) var(--unnamed-font-family-poppins);
    letter-spacing: var(--unnamed-character-spacing-0);
    color: var(--body-dark);
    text-align: right;
    font: normal normal normal 14px/21px 'Tajawal', sans-serif;
    letter-spacing: 0px;
    color: #636363;
    opacity: 1;
}
.forget-password{
    float: left;
    font: normal normal normal 12px/12px 'Tajawal', sans-serif;
    text-decoration: none !important;
}
.forget-password a{
    text-decoration: none !important;
}
.submit-btns{
    text-align: right;
    padding: 35px 40px;
}
.submit-login{
    display: block;
    width: 100%;
    /* UI Properties */
    background: var(--accent) 0% 0% no-repeat padding-box;
    background: #81f9e4  0% 0% no-repeat padding-box;
    border-radius: 0px;
    padding: 9px;
    color: black;
    opacity: 1;
    font-weight: bold;
    box-shadow: 0px 3px 5px 0px #eee;


}
.row-form-ifram{
    padding-right: 80px;
    padding-left: 20px;
}
.img-show-hide-password{
    position: absolute;
    left: 20px;
    top: 63px;
    cursor: pointer;
}
.img-marketing{
    width: 50%;
    margin-top: 1%;
    margin-right: 10%;
    float: right;
}
.section-login{
    margin-top: 15%;
}
.facebook-btn{
    width: 100%;
    border-radius: 0px;
    font-size: 14px;
    padding: 10px;
}
.orContainer{
    margin-top: 18px;
}
.orContainer::after,
.orContainer::before{
    content: "";
    width: 30%;
    background-color: #eee;
    height: 1px;
    display: inline-block;
    margin-right: 14px;
    margin-left: 14px;
}
.frame-title-login::after,
.frame-title-login::before{
    content: "";
    width: 10%;
    background-color: #eee;
    height: 1px;
    display: inline-block;
    margin-right: 10px;
    margin-left: 10px;
}
.RegisterSectionLink{
    margin-top: 20px;
}
.RegisterSectionLink span
{
    font-size: 13px;
}
.RegisterSectionLink::after,
.RegisterSectionLink::before{
    content: "";
    width: 20%;
    background-color: #eee;
    height: 1px;
    display: inline-block;
    margin-right: 10px;
    margin-left: 10px;
}
.link-register{
    text-decoration: none;
}
@media(max-width:1000px){
    .title-login{
        margin-top:10px;
        font-size: 50px !important;
        width: 100% !important;
        margin-right:auto;
    }
    .description-login{
        width: 90% !important;
        height: auto;
    }
    .section-login-form{
        padding: 5% 9%;
        margin-top: 40px;
    }
    .frame-title-login
    {
        margin-top: 23px !important;
        line-height: 2em;
        padding: 0px 15px;
        margin-bottom: 4%;
        font-size: 17px;
    }
    .row-form-ifram{
        padding-right: 10px;
        padding-left: 10px;
    }
    .container-fluid section{
        height: auto !important;
        padding: 10px;
    }
    .img-marketing{
        width: 80%;
        margin-top: 10%;
    }
}
</style>
