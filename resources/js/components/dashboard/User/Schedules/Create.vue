<template>
    <div class="container-body-schedule">
        <form method="post" @submit.prevent="CreateNewCampaigns">
            <h3 class="title-schedule">
                <label>
                    <!-- <i class="far fa-calendar-plus"></i> -->
                    <img :src="require('../../../../img/icons/newcampinner.svg')" />
                    إنشاء حملة جدولة جديدة
                </label>
            </h3>
            <div class="container-submit-btn-schedule">
                <button type="submit" class="btn">
                    <!-- <i class="far fa-calendar-check"></i> -->
                    <img :src="require('../../../../img/icons/savepublish.svg')" />
                    نشر الحملة
                </button>
                <button type="button" @click="CreateNewDraftCampaigns" value="0" class="btn">
                    <!-- <i class="fas fa-calendar-day"></i> -->
                    <img :src="require('../../../../img/icons/savedraft.svg')" />
                    حفظ الحملة كمسودة
                </button>
            </div>
            <div class="row">
                <div class="col-lg-6 container-form-new-schedule">
                    <div class="form-group camp-name">
                        <label for="schedule-name">
                            <!-- <i class="fas fa-clipboard-list"></i> -->
                            <img :src="require('../../../../img/icons/newcampinnerwhite.svg')" />
                            اسم الحملة
                        </label>
                        <input id="schedule-name" class="form-control" type="text" v-model="campaign.name"/>
                    </div>
                    <div class="form-group">
                        <label for="schedule-name">
                            <!-- <i class="fas fa-clipboard-list"></i> -->
                            <img :src="require('../../../../img/icons/descrip.svg')" />
                            وصف الحملة
                        </label>
                        <textarea id="schedule-name" class="form-control" rows="10" cols="20" v-model="campaign.description"></textarea>
                    </div>
                </div>
                <div class="col-lg-6 container-form-new-schedule left0side">
                    <div class="form-group">
                        <label for="schedule-name">
                            <!-- <i class="far fa-calendar-plus"></i> -->
                            <img :src="require('../../../../img/icons/actionevent.svg')" />
                            المهمة التى تريد انشاء جدولة لها
                        </label>
                        <p class="schedule-event-name">
                            <img :src="require('../../../../img/icons/answerevent.svg')" />
                            <!-- <i class="fas fa-project-diagram"></i> -->
                              {{ this.events[campaign.action] ? this.events[campaign.action] : this.events[0]  }}
                            <span @click="browseEvents = true" class="change-event">
                                <img :src="require('../../../../img/icons/changeevent.svg')" />
                                تغير المهمة
                            </span>
                        </p>
                    </div>
                    <div class="form-group">
                        <label for="schedule-name">
                            <!-- <i class="fas fa-retweet"></i> -->
                            <img :src="require('../../../../img/icons/retweet.svg')" />
                            تكرار الحملة المجدولة
                        </label>
                        <p class="schedule-event-name">
                            <!-- <i class="fas fa-project-diagram"></i> -->
                            <img :src="require('../../../../img/icons/answerevent.svg')" />
                            {{ repeates[campaign.repeate] ? repeates[campaign.repeate] : repeates[0] }}
                            <span @click="browseTimes = true" class="change-event">
                                <img :src="require('../../../../img/icons/changeevent.svg')" />
                                تغير تكرار الحملة
                            </span>
                        </p>
                    </div>
                    <div class="form-group">
                        <label for="schedule-name">
                            <!-- <i class="fas fa-database"></i> -->
                            <img :src="require('../../../../img/icons/selectproducts.svg')" />
                            تحديد 
                            <template v-if="this.campaign.type_selected == 2">
                                التصنيفات
                            </template>
                            <template v-else>
                                المنتجات
                            </template>
                        </label>
                        <p class="schedule-event-name">
                            <!-- <i class="fas fa-project-diagram"></i> -->
                            <img :src="require('../../../../img/icons/answerevent.svg')" />
                            عدد 
                            <template v-if="this.campaign.type_selected == 2">
                                التصنيفات
                                المحددة ( {{ this.campaign.categories.length !== 0 ? this.campaign.categories.length : 'بدون تحديد'  }} ) تصنيف
                            </template>
                            <template v-else>
                                المنتجات
                                المحددة ( {{ this.campaign.products.length !== 0 ? this.campaign.products.length : 'بدون تحديد'  }} ) منتج
                            </template>
                            <span @click="browseProducts = true" class="change-event">
                                <!-- <i class="fas fa-retweet"></i> -->
                                <img :src="require('../../../../img/icons/changeevent.svg')" />
                                تغير 
                                <template v-if="this.campaign.type_selected == 2">
                                    التصنيفات
                                </template>
                                <template v-else>
                                    المنتجات
                                </template>
                            </span>
                        </p>
                    </div>
                    <div v-if="campaign.action == '2'" class="form-group schedule-event-name" style="position:relative;font-size:15px;padding: 0px;">
                        <label for="schedule-name" style="font-size:15px">
                            <!-- <i class="fas fa-database"></i> -->
                            <img :src="require('../../../../img/icons/discount.svg')" />
                            حدد التخفيضات على 
                            <template v-if="this.campaign.type_selected == 2">
                                التصنيفات
                            </template>
                            <template v-else>
                                المنتجات
                            </template>
                        </label>
                        <span @click="browseProductsValues = true" class="change-event">
                            <img :src="require('../../../../img/icons/changeevent.svg')" />
                            حدد التخفيضات
                        </span>
                    </div>
                    <div v-if="campaign.action == '3'" class="form-group schedule-event-name" style="position:relative;font-size:15px;padding: 0px;">
                        <label for="schedule-name" style="font-size:15px">
                            <!-- <i class="fas fa-database"></i> -->
                            <img :src="require('../../../../img/icons/pricechange.svg')" />
                            حدد سعر 
                            <template v-if="this.campaign.type_selected == 2">
                                التصنيفات
                            </template>
                            <template v-else>
                                المنتجات
                            </template>
                        </label>
                        <span @click="browseProductsValues = true" class="change-event">
                            <img :src="require('../../../../img/icons/changeevent.svg')" />
                            حدد 
                            <template v-if="this.campaign.type_selected == 2">
                                التصنيفات
                            </template>
                            <template v-else>
                                المنتجات
                            </template>
                        </span>
                    </div>
                    <div v-if="(campaign.action == '4') && (campaign.type_selected != 2)" class="form-group schedule-event-name" style="position:relative;font-size:15px;padding: 0px;">
                        <label for="schedule-name" style="font-size:15px">
                            <!-- <i class="fas fa-database"></i> -->
                            <img :src="require('../../../../img/icons/tagsadd.svg')" />
                            مهمة اضافة التصنيف
                        </label>
                        <span @click="browseProductsValues = true" class="change-event">
                            <img :src="require('../../../../img/icons/changeevent.svg')" />
                            حدد التصنيفات
                        </span>
                    </div>
                    <div v-if="(campaign.action == '5') && (campaign.type_selected != 2)" class="form-group schedule-event-name" style="position:relative;font-size:15px;padding: 0px;">
                        <label for="schedule-name" style="font-size:15px">
                            <!-- <i class="fas fa-database"></i> -->
                            <img :src="require('../../../../img/icons/tagsadd.svg')" />
                            مهمة حذف التصنيف
                        </label>
                        <span @click="browseProductsValues = true" class="change-event">
                            <img :src="require('../../../../img/icons/changeevent.svg')" />
                            حدد التصنيفات
                        </span>
                    </div>
                </div>
            </div>
        </form>
        <events-model :show-events="browseEvents" :campaign="campaign"
         @updateFromEventCampaign="updateFromEventCampaign"
         @modelshow="updateshow"
         ></events-model>

        <times-model :show-times="browseTimes" :campaign="campaign"
         @updateFromTimesCampaign="updateFromTimesCampaign"
         @modelshow="updateshow"></times-model>

        <products-model :show-products="browseProducts" :campaign="campaign"
         @updateFromProductsCampaign="updateFromProductsCampaign"
         @modelshow="updateshow"></products-model>

         <!-- <products-values-model v-if="campaign.products.length != 0" :show-products-values="browseProductsValues" :campaign="campaign"
         @updateFromProductsValuesCampaign="updateFromProductsValuesCampaign"
         @updateFromProductsNotesCampaign="updateFromProductsNotesCampaign"
         @modelshow="updateshow"></products-values-model> -->

         <products-values-discount-model v-if="campaign.action == '2'" :show-products-values="browseProductsValues" :campaign="campaign"
         @updateFromProductsValuesCampaign="updateFromProductsValuesCampaign"
         @updateFromProductsNotesCampaign="updateFromProductsNotesCampaign"
         @modelshow="updateshow">
         </products-values-discount-model>

         <products-values-price-model v-if="campaign.action == '3'" :show-products-values="browseProductsValues" :campaign="campaign"
         @updateFromProductsValuesCampaign="updateFromProductsValuesCampaign"
         @updateFromProductsNotesCampaign="updateFromProductsNotesCampaign"
         @modelshow="updateshow">
         </products-values-price-model>

         <products-values-add-tags-model v-if="campaign.action == '4'" :show-products-values="browseProductsValues" :campaign="campaign"
         @updateFromProductsValuesCampaign="updateFromProductsValuesCampaign"
         @updateFromProductsNotesCampaign="updateFromProductsNotesCampaign"
         @modelshow="updateshow">
         </products-values-add-tags-model>

         <products-values-remove-tags-model v-if="campaign.action == '5'" :show-products-values="browseProductsValues" :campaign="campaign"
         @updateFromProductsValuesCampaign="updateFromProductsValuesCampaign"
         @updateFromProductsNotesCampaign="updateFromProductsNotesCampaign"
         @modelshow="updateshow">
         </products-values-remove-tags-model>

        <alert-response :showsuccess="showsuccess" :showerrors="showerrors"
        @update_success="showsuccess = false"
        @update_errors="showerrors = false" :errors="errors"
        :success_message="success_message"
        :error_message="error_message"></alert-response>

        <div v-show="showLoading" class="loading-snipper">
            <img src="../../../../img/Enso-2.gif" class="image-loading" />
        </div>

    </div>
</template>
<script>
import EventsModel from './Models/Events.vue';
import TimesModel from './Models/Times.vue';
import ProductsModel from './Models/Products.vue';
import ProductsValuesDiscountModel from './Models/ProductsValuesDiscount.vue';
import ProductsValuesPriceModel from './Models/ProductsValuesPrice.vue';
import productsValuesAddTagsModel from './Models/productsValuesAddTags.vue';
import ProductsValuesRemoveTagsModel from './Models/ProductsValuesRemoveTags.vue';
import SnipperLoading from '../../../../img/Enso-2.gif';
import AlertResponse from './Models/AlertResponse.vue';
export default {
    components: {
        EventsModel,
        TimesModel,
        ProductsModel,
        ProductsValuesDiscountModel,
        ProductsValuesPriceModel,
        productsValuesAddTagsModel,
        ProductsValuesRemoveTagsModel,
        SnipperLoading,
        AlertResponse
    },
    data(){
        return{
            schedule:{},
            campaign:{
                status:1,
                reapete_on:[],
                action:"0",
                end_type_cal:"0",
                unit_repeate:"0",
                repeate:"0",
                type_set:"0",
                type_repeate:'0',
                products:[],
                categories:[],
                set_values_products:null,
                set_notes_products:null,
                repeate_at_time:null,
                end_at:null,
                count_repeate:null,
                type_selected:1
            },
            default:{
                status:1,
                reapete_on:[],
                action:"0",
                end_type_cal:"0",
                unit_repeate:"0",
                repeate:"0",
                type_set:"0",
                type_repeate:'0',
                products:[],
                categories:[],
                repeate_at_time:null,
                end_at: null,
                set_values_products:null,
                set_notes_products:null,
                count_repeate:null,
                type_selected:1
            },
            events:{
                0 : 'نشر المنتجات',
                1 : 'الغاء نشر المنتجات',
                2 : 'تخفيضات على المنتجات',
                3 : 'تغير فى سعر المنتج',
                4 : 'اضافة التصنيفات الخاصة بالمنتح',
                5 : 'حذف التصنيفات الخاصة بالمنتج',
                6 : 'انهاء تخفيضات على المنتجات'
            },
            repeates:{
                0        : "بدون تكرار",
                daily    : "يوميا",
                weekly   : "اسبوعيا كل خميس",
                monthly  : "شهريا كل اول خميس",
                annually : "سنويا كل مطلع شهر يناير",
                weekends : "كل ايام العطلات من الجمعة حتى الاثنين",
                custom   : "تكرار مخصص",
            },
            ProductsValues:[],
            Products:[],
            browseEvents:false,
            browseTimes:false,
            browseProducts:false,
            browseProductsValues:false,
            errors:{},
            showLoading:false,
            SnipperLoading,
            count_repeate_set:'off',
            showsuccess:false,
            showerrors:false,
            success_message:'تم انشاء الحملة بنجاح',
            error_message:'حدث خطأ اثناء انشاء الحملة'
        }
    },
    methods:{
        updateshow:function(status){
            this.browseEvents          = status;
            this.browseTimes           = status;
            this.browseProducts        = status;
            this.browseProductsValues  = status;
        },
        CreateNewCampaigns:function(){
            let self = this;
            // if values not updated
            // if(this.campaign.set_values_products != null){
            //     if(this.campaign.action == '2' || this.campaign.action == '3' || this.campaign.action == '4' || this.campaign.action == '5'){
            //         if(self.campaign.type_set == '0'){
            //             self.campaign.set_values_products = null;
            //             if(Object.values(self.campaign.products_values)[0] == null){
            //                 self.campaign.set_values_products = null;
            //             } else {
            //                 if(typeof Object.values(this.campaign.products_values)[0] == "object"){
            //                     self.campaign.set_values_products = Object.values(this.campaign.products_values)[0].join('-');
            //                 }
            //                 else {
            //                     self.campaign.set_values_products = Object.values(this.campaign.products_values)[0];
            //                 }
            //             }
            //         }
            //         else if(self.campaign.type_set == '1'){
            //             self.campaign.set_values_products = {};
            //             Object.keys(this.campaign.products_values).forEach(function(key){
            //                 if(self.campaign.products_values[key] == null){
            //                     self.campaign.set_values_products[key] = null;
            //                 } else {
            //                     if(typeof self.campaign.products_values[key] == "object"){
            //                         self.campaign.set_values_products[key] = self.campaign.products_values[key].join('-');
            //                     } else {
            //                         self.campaign.set_values_products[key] = self.campaign.products_values[key];
            //                     }
            //                 }
            //             });
            //         }
            //     }
            // }

            this.showLoading = true;
            this.showsuccess = false;
            this.showerrors  = false;
            axios.post('/api/campaigns',this.campaign).then(function({data}) {
                self.showsuccess = true;
                self.errors = {};
                self.campaign = self.default;
            }).catch(function({response}) {
                self.showerrors = true;
                self.errors = response.data;
            }).then(function(){
                self.showLoading = false;
            });
        },
        CreateNewDraftCampaigns:function(){
            this.campaign.status = 0;
            this.CreateNewCampaigns();
        },
        updateFromEventCampaign:function(value,updated){
           this.campaign = value;
        },
        updateFromTimesCampaign:function(value){
           this.campaign = value;
        },
        updateFromProductsCampaign:function(value){
           this.campaign = value;
           console.log(this.campaign);
        },
        updateFromProductsValuesCampaign:function(value){
           this.campaign.set_values_products = value;
        },
        updateFromProductsNotesCampaign:function(value){
           this.campaign.set_notes_products = value;
        }
    },
    created(){
    }
}
</script>

<style scoped>
.container-body-schedule{
    padding: 4%;
}
.title-schedule{
    line-height:2.5em;
    color: #795548;
}
.title-schedule label
{
    padding: 0px 18px;
    background-color: #21222d;
    border-radius: 10px;
    color: #87888c;
    font-size: 17px;
    font-weight: bold;
}
.container-form-new-schedule{
    padding: 1% 3%;
}
.container-form-new-schedule .form-group{
    margin-bottom: 16px;
}
.container-form-new-schedule .camp-name input{
    height: 50px;
}
.container-form-new-schedule .form-group textarea
{
    box-shadow: 0px 4px 4px #FFFFFF;
}
.container-form-new-schedule .form-group label
{
    line-height: 3em;
    font-size: 16px;
    color: #87888c;
    font-weight: bold;
}
.container-form-new-schedule .form-group label img
{
    margin: 0px 6px 0px;
}
.container-submit-btn-schedule{
    text-align: left;
}
.schedule-event-name{
    padding: 10px 8px;
    background-color: #21222d;
    font-weight: bold;
    position: relative;
    border: 1px solid #21222d;
    color: gray;
    font-size: 15px;
    font-weight: bold;
}
.change-event{
    position: absolute;
    left: 0;
    top: 0;
    padding: 7px;
    background: #5CB6A9;

    /* box-shadow: 0px 9px 15px 8px #d0d0d0; */
    cursor: pointer;
    color:black;
    border-radius: 10px;
}
.container-errors{
    padding: 20px 30px 0px 26px;
}
.container-errors .alert
{
    border-radius: 0px;
    background-color: #ffeced;
    box-shadow: 0px 0px 0px 0px #eee;
    border: none;
}
.form-control{
    color: white;
    background-color: #21222d;
    border: 1px solid #21222d;
}
.container-submit-btn-schedule .btn{
    background: #a9dfd8;
    color: black;
    font-weight: bold;
    border-radius: 19px;
    margin: 10px;
}
.container-form-new-schedule.left0side{
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 5px 2px 1px #5cb6a9;
}
.schedule-event-name img{
    margin: 0px 0px 0px 6px;
}
@media(max-width:1000px){
    .title-schedule label{
        font-size: 14px;
    }
    .container-submit-btn-schedule .btn{
        margin: 10px 1px;
        display: inline-block !important;
        font-size: 12px;
    }
}
</style>
