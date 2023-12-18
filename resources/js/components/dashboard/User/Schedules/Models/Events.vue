<template>
    <div v-if="ShowEvents" class="model-browose-products">
        <div class="card card-model">
            <form method="post" @submit.prevent="AddEventForCampaign">
                <div class="top-header-model">
                    <p class="title-model">
                        <label class="inner-title-model">
                            <img :src="require('../../../../../img/icons/browsevents.svg')" />
                            تصفح المهمات المتوفرة التى يمكن جدولتها
                        </label>
                    </p>
                </div>
                <div class="body-of-model">
                    <table class="list-items">
                        <tbody>
                            <tr :class="campaign.action == '0' ? 'active' : ''">
                                <td class="even-td">
                                    <input type="radio" v-model="campaign.action" value="0" class="event_type" required/>
                                    <h6>
                                        <img :src="require('../../../../../img/icons/answerevent.svg')" />
                                        نشر المنتجات
                                    </h6>

                                </td>
                            </tr>
                            <tr :class="campaign.action == '1' ? 'active' : ''">
                                <td class="even-td">
                                    <input type="radio" v-model="campaign.action" value="1" class="event_type" required/>
                                    <h6>
                                        <img :src="require('../../../../../img/icons/nopublish.svg')" />
                                        الغاء نشر المنتجات
                                    </h6>

                                </td>
                            </tr>
                            <tr :class="campaign.action == '6' ? 'active' : ''">
                                <td class="even-td">
                                    <input type="radio" v-model="campaign.action" value="6" class="event_type" required/>
                                    <h6>
                                        <img :src="require('../../../../../img/icons/discountpop.svg')" />
                                        الغاء تخفيضات على المنتجات
                                    </h6>

                                </td>
                            </tr>
                            <tr :class="campaign.action == '2' ? 'active' : ''">
                                <td class="even-td">
                                    <input type="radio" v-model="campaign.action" value="2" class="event_type" required/>
                                    <h6>
                                        <img :src="require('../../../../../img/icons/pricechange.svg')" />
                                        تخفيضات على المنتجات
                                    </h6>

                                </td>
                            </tr>
                            <tr :class="campaign.action == '3' ? 'active' : ''">
                                <td class="even-td">
                                    <input type="radio" v-model="campaign.action" value="3" class="event_type" required/>
                                    <h6>
                                        <img :src="require('../../../../../img/icons/pricechange.svg')" />
                                        تغير فى السعر المنتجات
                                    </h6>

                                </td>
                            </tr>
                            <tr :class="campaign.action == '4' ? 'active' : ''">
                                <td class="even-td">
                                    <input type="radio" v-model="campaign.action" value="4" class="event_type" required/>
                                    <h6>
                                        <img :src="require('../../../../../img/icons/tagsadd.svg')" />
                                        اضافة التصنيفات الخاصة للمنتجات
                                    </h6>

                                </td>
                            </tr>
                            <tr :class="campaign.action == '5' ? 'active' : ''">
                                <td class="even-td">
                                    <input type="radio" v-model="campaign.action" value="5" class="event_type" required/>
                                    <h6>
                                        <img :src="require('../../../../../img/icons/tagsadd.svg')" />
                                        حذف التصنيفات الخاصة للمنتجات
                                    </h6>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="top-footer-model">
                    <button type="submit" class="btn">
                        <img :src="require('../../../../../img/icons/addevent.svg')" />
                        اضافة المهمة
                    </button>
                    <button @click="CloseModel" type="button" class="btn">
                        <img :src="require('../../../../../img/icons/close.svg')" />
                        اخفاء
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
<script>
    export default {
        props:{
            ShowEvents:{
                default:false,
                type: Boolean
            },
            campaign:{
                default:{},
                type: Object
            }
        },
        data(){
            return{
                checked:null,
                updated:false,
                errors:{},
            }
        },
        methods:{
            CloseModel:function(){
                this.$emit('modelshow', false);
            },
            AddEventForCampaign:function(){
                this.CloseModel();
                this.$emit('updateFromEventCampaign', this.campaign,this.updated);
            }
        },
        watch:{
            campaign:{
                handler(value){
                    this.updated = true;
                },
                deep:true
            }
        }
    }
</script>
<style scoped>
   .model-browose-products{
        position: fixed;
        left:0%;
        right:0%;
        top:0%;
        bottom:0%;
        /* background-color:#00000047; */
        background: #000000a6;
        text-align: center;
        overflow-y:auto;
        z-index: 100000;
   }
   .card-model{
        /* background-color:white; */
        background-color: #151c28;
        color: white;
        width:40%;
        height:auto;
        margin:auto;
        margin-top: 5%;
   }
   .title-model{
        padding: 9px 15px;
        text-align: right;
        font-size: 17px;
        line-height: 3em;
        border-bottom: 1px solid #151c28;
   }
   .title-model .inner-title-model{
        background: #181920;
        padding: 2px 10px;
        border-radius: 10px;
        font-weight: bold;
   }
   .list-items{
         overflow-y: auto;
   }
   .body-of-model
   {
        max-height:400px;
        overflow-y: auto;
   }
   .list-items tr{
        padding: 14px;
        border-right: 10px solid #151c28;
   }
   .list-items tr.active{
        border-right: 10px solid #23a593;
   }
   .top-footer-model{
        text-align: left;
        padding: 10px;
        border-top: 1px solid #151c28;
   }
   .top-footer-model .btn{
        background: #A9DFD8;
        color: black;
        border-radius: 25px;
        margin: 0px 10px;
        font-weight: bold;
        font-size: 13px;
   }
   .even-td
   {
        text-align: right;
        width: 90%;
        padding: 3px 23px 7px 23px;
        position: relative;
   }
   td input.event_type[type="radio"]
   {
        /* float: right;
        margin-top: -40px;
        margin-right: 20px;
        height: 20px;
        width: 20px;
        vertical-align: middle; */
        position: absolute;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        opacity: 0;
        cursor: pointer;
   }
   .list-items td h6
   {
        color: #87888C;
        font-size: 18px;
        font-weight: bold;
   }
   @media(max-width:1000px){
        .card-model{
            width: 95%;
        }
        .even-td{
            width:100%;
            /* padding: 3px 0px 7px 10px; */
            padding: 3px 15px 7px 10px;
        }
        td input.event_type[type="radio"]{
            margin-top: -56px;
            margin-right: 10px;
            margin-left: 10px;
        }
    }
</style>
