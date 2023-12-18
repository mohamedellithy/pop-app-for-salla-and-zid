<template>
    <div class="col-12" v-if="Object.keys(campaigns).length != 0">
        <div class="row container-top-content">
            <div class="col-lg-12">
                <p class="btn add-new-camp">
                    <img :src="require('../../../../img/icons/newcamp.png')"/>
                    الحملات المجدولة
                </p>
            </div>
        </div>
        <div class="row">
            <div class="container-card col-md-12">
                <div class="row">
                    <div class="col-md-4">
                        <advanced-search
                        :data-search="merchants"
                        :default-value="merchant"
                        @SelectedItem="SelectedMerchant"
                        @FetchOnceTime="FetchMerchants"></advanced-search>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group container-search-inputs">
                            <small class="label">حالة الحملة</small>
                            <select v-model="progress" class="form-control" @change="SelectedProgress">
                                <option :value="null">الكل</option>
                                <option value="0">انتظار</option>
                                <option value="1">جاري التنفيذ</option>
                                <option value="2">مكتملة</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group container-search-inputs">
                            <small class="label">تاريخ الحملة</small>
                            <date-range-picker ref="picker" v-model="dateRange"
                            :date-format="dateFormat"
                            :ranges="false" @select="DateUpdate"
                            :opens="opens">
                            </date-range-picker>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-dark table-campaigns">
                    <tr>
                        <th>
                           اسم الحملة
                        </th>
                        <th>
                           اسم التاجر
                        </th>
                        <th>
                           رابط المتجر
                        </th>
                        <th>
                           حالة
                        </th>
                        <th>
                            تقدم
                        </th>
                        <th>
                           تاريخ انشاء الحملة
                        </th>
                        <th>
                           تاريخ بدأ / انتهاء التنفيذ
                        </th>
                        <th>
                            توقيت التنفيذ
                        </th>
                        <th></th>
                    </tr>
                    <tr v-for="(campaign,index) in results.data" :key="index">
                        <td>{{ campaign.name }}</td>
                        <td>{{ campaign.merchant.name }}</td>
                        <td>
                            <a class="store-link" :href="campaign.merchant.zid_config.store_url" target="_blank">
                                <i class="fas fa-store"></i>
                                {{ campaign.merchant.zid_config.store_url }}
                            </a>
                        </td>
                        <td>
                            <template v-if="campaign.status == 0">
                                <i class="fas fa-circle icon-status-camp draft-camp"></i>
                                مسودة
                            </template>
                            <template v-else-if="campaign.status == 1">
                                <i class="fas fa-circle icon-status-camp active-camp"></i>
                                نشطة
                            </template>
                        </td>
                        <td>
                            <template v-if="campaign.progress == 0">
                                <i class="fas fa-circle icon-status-camp draft-camp"></i>
                                انتظار
                            </template>
                            <template v-else-if="campaign.progress == 1">
                                <i class="fas fa-circle icon-status-camp active-camp"></i>
                                جاري التنفيذ
                            </template>
                            <template v-else-if="campaign.progress == 2">
                                <i class="fas fa-circle icon-status-camp complete-camp"></i>
                                مكتملة
                            </template>
                        </td>
                        <td>{{ campaign.created_at }}</td>
                        <td>{{ campaign.end_at || 'غير منتهي' }} </td>
                        <td>{{ campaign.repeate_at_time }}</td>
                        <td>
                            <router-link tag="a"  :to="{path:'/admin/show-campiagn/'+campaign.id}">
                                <i class="fas fa-eye"></i>
                            </router-link>
                        </td>
                    </tr>
                </table>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a @click="pagedCampaigns(results.current_page != 1 ? results.current_page - 1 : 1)" class="page-link" aria-label="Previous" v-if="results.current_page != 1">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <!-- first page-->
                        <li>
                            <a @click="pagedCampaigns(1)" :class="`page-link ${ 1 == results.current_page ? 'active' : ''}`">1</a>
                        </li>

                        <!-- inner before active page-->
                        <li v-if="results.current_page - 1 > 2">
                            <a @click="pagedCampaigns(results.current_page - 2)" class="page-link">..</a>
                        </li>

                        <!-- active page-->
                        <li v-for="page in results.last_page -1" class="page-item" :key="page">
                            <a @click="pagedCampaigns(page)" v-if="(page != 1) && (page < results.current_page + 2 ) && (page > results.current_page - 2 )" :class="`page-link ${ page == results.current_page ? 'active' : ''}`">{{ page }}</a>
                        </li>

                        <!-- inner after active page-->
                        <li v-if="results.last_page - results.current_page > 2">
                            <a @click="pagedCampaigns(results.current_page + 2)" class="page-link">..</a>
                        </li>

                        <!-- last page-->
                        <li v-if="results.last_page">
                            <a @click="pagedCampaigns(results.last_page)" v-if="(results.last_page != 1)" :class="`page-link ${ results.last_page == results.current_page ? 'active' : ''}`">{{ results.last_page }}</a>
                        </li>
                        <li class="page-item">
                            <a @click="pagedCampaigns(results.current_page != results.last_page ? results.current_page + 1 : results.last_page)" class="page-link" aria-label="Next" v-if="results.current_page != results.last_page">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <alert-response :showsuccess="showsuccess" :showerrors="showerrors"
        @update_success="showsuccess = false"
        @update_errors="showerrors = false" :errors="errors"
        :success_message="success_message"
        :error_message="error_message"></alert-response>
    </div>
    <div v-else class="col-lg-8 show-alert-messaage" >
        <img class="schedule-img" :src="require('../../../../img/PAGENOPOP.png')">
        <div class="frame-btn-schedule">
            <router-link tag="button" class="btn" :to="{name:'add-schedules'}">
                <img :src="require('../../../../img/icons/noop.svg')" />
                اضافة حملة جديدة
            </router-link>
        </div>
    </div>

</template>
<script>
import AlertResponse from './Models/AlertResponse.vue';
import AdvancedSearch from './../../../Plugins/AdvancedSearch.vue';
import DateRangePicker from 'vue2-daterange-picker'
//you need to import the CSS manually
import 'vue2-daterange-picker/dist/vue2-daterange-picker.css'
export default {
    components:{
        AlertResponse,
        AdvancedSearch,
        DateRangePicker
    },
    data(){
        let startDate = new Date();
        let endDate = new Date();
        endDate.setDate(endDate.getDate() + 6);
        return{
            results:{},
            campaigns:{key:null},
            events:{
                0 : 'نشر المنتجات',
                1 : 'الغاء نشر المنتجات',
                2 : 'تخفيضات على المنتجات',
                3 : 'تغير فى سعر المنتج',
                4 : 'اضافة الترميزات الخاصة بالمنتح',
                5 : 'حذف الترميزات الخاصة بالمنتج',
                6 : 'انهاء تخفيضات على المنتجات'
            },
            Details:false,
            selectedCamp:{
                status:0
            },
            opens:'right',
            dateRange: {startDate, endDate},
            merchants:[],
            merchant:null,
            progress:null,
            errors:{},
            showsuccess:false,
            showerrors:false,
            success_message:'تم تحديث الحملة بنجاح',
            error_message:'حدث خطأ اثناء تحديث الحملة'
        }
    },
    methods:{
        changeCampaignStatus:async function(id,status){
            let self = this;
            await axios.post('/api/campaign/change_status/'+id+'/'+status).then(function({data}){
                self.fetchCampaigns(self.$route.params.page_no);
                self.showsuccess = true;
                console.log(data);
            }).catch(function({response}){
                console.log(response);
                self.showerrors  = true;
            });
        },
        pagedCampaigns:function(page = 1){
            this.$route.params.page_no = page;
            const params = this.$route.params;
            const query  = this.$route.query;
            this.$router.push({ params ,query});
            this.fetchCampaigns();
        },
        fetchCampaigns:async function(){
            let self = this;
            await axios.get('/api/admin/campaigns/',{
                params:{
                    page      :self.$route.params.page_no,
                    merchant  :self.$route.query.merchant || null,
                    progress  :self.$route.query.progress || null,
                    startDate :self.$route.query.startDate || null,
                    endDate   :self.$route.query.endDate || null
                }
            }).then(function({data}){
                console.log(data);
                self.results   = data.campaigns;
                console.log(self.results);
            }).catch(function({response}){
                console.log(response);
            });
        },
        TrashCampaign:function(id){
            let self = this;
            axios.delete('/api/campaigns/'+id).then(function({data}){
                self.fetchCampaigns();
                self.success_message = 'تم حذف الحملة بنجاح';
                self.showsuccess = true;
                console.log(data);
            }).catch(function({response}){
                self.error_message = 'حدث خطأ اثناء حذف الحملة';
                self.showerrors  = true;
                console.log(response);
            });
        },
        ShowCampDetails:function(campaign){
             this.selectedCamp = campaign;
             this.Details = true;
        },
        closeModel:function(){
             this.selectedCamp = {};
             this.Details = false;
        },
        SelectedMerchant:function(value){
            const currentQueryParams = {};
            currentQueryParams.merchant = value;
            this.$router.push({ ...this.$route,
                query:{
                    ...this.$route.query,
                    ...currentQueryParams
                }
            });
        },
        FetchMerchants:async function(value){
            let self = this;
            await axios.get('/api/admin/merchants').then(function({data}){
                console.log(data);
                self.merchants   = data.merchants;
            }).catch(function({response}){
                console.log(response);
            });
        },
        dateFormat (classes, date) {
            if (!classes.disabled) {
                classes.disabled = date.getTime() > new Date()
            }
            return classes
        },
        DateUpdate:function(value){
            let startDate = new Date(value.startDate);
            let endDate = new Date(value.endDate);
            const currentQueryParams = {};
            let options = {day:'2-digit',month:'2-digit',year:'numeric'};
            currentQueryParams.startDate = startDate.toLocaleDateString('en-US',options);
            currentQueryParams.endDate = endDate.toLocaleDateString('en-US',options);
            this.$router.push({ ...this.$route,
                query:{
                    ...this.$route.query,
                    ...currentQueryParams
                }
            });
        },
        SelectedProgress:function(event){
            console.log(event);
        }
    },
    created(){
        this.fetchCampaigns();
    },
    mounted(){
        this.dateRange.startDate = this.$route.query.startDate;
        this.dateRange.endDate = this.$route.query.endDate;
        this.progress = this.$route.query.progress;
        this.merchant = this.$route.query.merchant;
    },
    filters:{
        CropeDescription:function(value){
            if(!value){
               return null;
            }
            return value.substring(0, 150) + ' ... ';
        }
    },
    watch:{
        progress:function(value){
            console.log(value);
            const currentQueryParams = {};
            currentQueryParams.progress = value;
            this.$router.push({ ...this.$route,
                query:{
                    ...this.$route.query,
                    ...currentQueryParams
                }
            });
        },
        "$route":function(value){
            console.log(value,"bbb");
            this.fetchCampaigns();
        }
    }
}
</script>
<style scoped>
.row{
    margin: 0px;
}
.show-alert-messaage{
    height:auto;
    /*background-color: antiquewhite;*/
    padding:20px;
    text-align:center;
    margin:auto;
    margin-top:5%;
}

.schedule-img{
    width: 70%;
    /* height: 220px;
    border-radius: 60%; */
}
.frame-btn-schedule{
    padding: 30px;
}
.frame-btn-schedule .btn{
    border-radius: 26px;
    background: #a9dfd8;
    font-weight: bold;
    font-size: 15px;
    padding: 10px 23px;
}
p.description-schedule-empty{
    padding: 6% 15%;
}
.container-card{
    padding: 20px;
}
.card{
    padding: 25px;
    /* border: 1px solid #e0dfdf; */
    border-radius: 1px;
    /* box-shadow: 0px 5px 10px 8px #eee; */
    border-radius: 10px;
    /* box-shadow:0px 10px 10px 10px #eee; */
    box-shadow: inset 0px 6px 4px 0px #a9dfd8;
    /* background: #A9DFD8; */
    background: #21222D;
}
.body-card{
    color:white
}
.header-top-card h6{
    line-height: 2em;
    padding: 14px 0px;
    color: white;
    color:white;
    font-weight: bold;
    font-size: 16px;
}
.props-card{
    width: 100%;
    padding: 0px 12px;
}
.props-card li{
    padding: 12px 0px;
}
.badge{
    font-size: 13px !important;
}
.footer-card .btn{
    font-size: 11px;
}
.container-top-content{
    padding: 16px 9px 0px;
}
.card .status{
    position: relative;
}
.card .status .fa-trash{
    position: absolute;
    left: 0;
    top: 4px;
    color: #b71c1c;
    font-size: 18px;
    cursor: pointer;
    width: 16px;
}
.container-top-content .add-new-camp{
    background: #21222D;
    color:white;
    border-radius: 10px;
    font-size: 18px;
    font-weight: bold;
    padding: 14px;
}
.container-top-content img
{
    margin: 0px 8px;
}
.card .status .badge{
    margin: 0px 0px 0px 5px;
}
.card .status .badge img
{
    color: white;
    width: 15px;
    margin: 0px 0px 0px 6px;
}
.container-description hr{
    width: 80%;
    height: 6px;
    background: #A9DFD8;
    opacity: 1;
    border: 0px;
    margin: 16px auto;
    border-radius: 11px;
}
.footer-card .btn{
    background: #A9DFD8;
    color: #21222D;
    border-radius: 20px;
    font-weight: bold;
    font-size: 12px;
}
.card::after{
    content: "";
    width: 7px;
    height: 60%;
    background: #2E9E8F;
    position: absolute;
    left: 0;
    top: 17%;
}
.header-top-card h6 img{
    width: 15px;
    margin: 0px 8px;
}
.active_noactive_camp{
    float: left;
}
.props-card{
    list-style: none;
}
.props-card li label img{
    width:15px;
}
.props-card li strong
{
    padding-right: 17px;
    font-size: 16px;
    font-weight: 400;
}
.props-card li label
{
    font-size: 16px;
}
.table-campaigns tr td,
.table-campaigns tr th{
    padding: 12px 12px;
}
.table-campaigns tr th
{
    background-color: #006167;
}
.table-campaigns tr td
{
    background-color: #56f5ff26;
}
.pagination li a{
    cursor:pointer;
    background-color: #006167;
    color: white;
    border: 0px;
    margin: 5px 5px;
    border-radius: 11px;
}
.pagination li a.active
{
    background-color: orange;
    color: black;
}
.icon-status-camp{
    background:transparent;
}
.icon-status-camp.active-camp
{
    color: orange;
}
.icon-status-camp.draft-camp
{
    color: red;
}
.icon-status-camp.complete-camp{
    color: green;
}
td i{
    background-color: transparent;
    cursor:pointer;
}
td .store-link
{
    background-color: transparent;
    color: #a9dfd8;
}
td a{
    background-color: transparent;
    color:white;
}
.container-search-inputs{
    padding:0px 10px;
    color:white;
}
.container-search-inputs select
{
    line-height: 28px;
}
.container-search-inputs small{
    font-weight: bold;
    color: #4faeb4;
    line-height: 3em;
}
.vue-daterange-picker{
    display: block !important;
}


@media(max-width:1000px){
    .schedule-img{
        width: 70%;
        height: auto;
    }
}
</style>
<style>
.calendar-table table{
    color: #006167 !important;
}

</style>
