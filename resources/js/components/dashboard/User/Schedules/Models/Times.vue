<template>
    <div v-if="ShowTimes" class="model-browose-products">
        <form method="post" @submit.prevent="AddTimesForCampaign">
            <div class="card card-model">
                <div class="top-header-model">
                    <p class="title-model">
                        <label class="inner-title-model">
                            <img :src="require('../../../../../img/icons/timespop.svg')" />
                            اعدادات مرات تكرار المهمة
                        </label>
                    </p>
                </div>

                <div class="body-of-model">
                    <table class="list-items">
                        <tbody>
                            <tr>
                                <td colspan="3" class="even-td">
                                    <h6>
                                        <i class="fas fa-stop-circle"></i>
                                        تكرار المهمة
                                        <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                        <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                            <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                            اختيار نظام تنفيذ الحملة
                                        </popover>
                                    </h6>
                                    <select @change="ResetCampDefault" v-model="campaign.repeate" class="form-control">
                                        <option value="0">بدون تكرار</option>
                                        <option value="daily">يوميا</option>
                                        <option value="weekly">اسبوعيا</option>
                                        <option value="monthly">شهريا</option>
                                        <option value="annually">سنويا</option>
                                        <option value="weekends"> ايام العطلات</option>
                                        <option value="custom">تحديد معاد اخر</option>
                                    </select>
                                </td>
                            </tr>
                            <template v-if="campaign.repeate == '0'">
                                <tr class="sub">
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار التاريخ
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                اختيار تاريخ تنفيذ الحملة
                                            </popover>
                                        </h6>
                                    </td>
                                    <td class="td-3-col" colspan="2">
                                        <input id="on" class="form-control" v-model="campaign.end_at" :min="new Date().toISOString().slice(0,10)" type="date"/>
                                    </td>
                                </tr>
                                <tr class="sub">
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار الوقت
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                اختيار توقيت تنفيذ الحملة
                                            </popover>
                                        </h6>
                                    </td>
                                    <td class="td-3-col" colspan="2">
                                        <input class="form-control" type="time" v-model="campaign.repeate_at_time" />
                                    </td>
                                </tr>
                            </template>
                            <template v-if="campaign.repeate == 'daily'">
                                <tr>
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار الوقت
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                اختيار توقيت تنفيذ الحملة
                                            </popover>
                                        </h6>
                                    </td>
                                    <td class="td-3-col" colspan="2">
                                        <input class="form-control" type="time" v-model="campaign.repeate_at_time" />
                                    </td>
                                </tr>
                            </template>
                            <template v-if="campaign.repeate == 'monthly'">
                                <tr>
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار موعد التنفيذ
                                        </h6>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-3-col" colspan="2">
                                        <div class="container-repeate-on">
                                            <ul>
                                                <li v-for="day in 31" :class="[campaign.reapete_on == day ? 'active' : '']" :key="day">
                                                    <label v-if="day == 1 || day == 2">{{ `${day}st` }}</label>
                                                    <label v-else>{{ `${day}th` }}</label>
                                                    <input type="radio" v-model="campaign.reapete_on" :value="day" class="reapete_on" />
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار الوقت
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                اختيار توقيت تنفيذ الحملة
                                            </popover>
                                        </h6>
                                    </td>
                                    <td class="td-3-col" colspan="2">
                                        <input class="form-control" type="time" v-model="campaign.repeate_at_time" />
                                    </td>
                                </tr>
                            </template>
                            <template v-if="campaign.repeate == 'annually'">
                                <tr>
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار موعد التنفيذ
                                        </h6>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-3-col" colspan="2">
                                        <div class="container-repeate-on">
                                            <ul>
                                                <li v-for="day in 31" :class="[campaign.reapete_on == day ? 'active' : '']" :key="day">
                                                    <label v-if="day == 1 || day == 2">{{ `${day}st` }}</label>
                                                    <label v-else>{{ `${day}th` }}</label>
                                                    <input type="radio" v-model="campaign.reapete_on" :value="day" class="reapete_on" />
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار الوقت
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                اختيار توقيت تنفيذ الحملة
                                            </popover>
                                        </h6>
                                    </td>
                                    <td class="td-3-col" colspan="2">
                                        <input class="form-control" type="time" v-model="campaign.repeate_at_time" />
                                    </td>
                                </tr>
                            </template>
                            <template v-if="campaign.repeate == 'weekly' || campaign.repeate == 'weekends'">
                                <tr>
                                    <td colspan="3" class="even-td" style="padding: 18px 0px;">
                                        <h6>
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار الايام
                                        </h6>
                                        <div class="container-repeate-on">
                                            <ul>
                                                <li :class="[this.campaign.reapete_on.indexOf('SATURDAY') !== -1 ? 'active' : '']">
                                                    <label for="">السبت</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="SATURDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('SUNDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الاحد</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="SUNDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('MONDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الاثنين</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="MONDAY" class="reapete_on" />
                                                </li>
                                                <li  :class="[this.campaign.reapete_on.indexOf('TUESDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الثلاثاء</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="TUESDAY" class="reapete_on" />
                                                </li>
                                                <li  :class="[this.campaign.reapete_on.indexOf('WEDNESDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الاربعاء</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="WEDNESDAY" class="reapete_on" />
                                                </li>
                                                <li  :class="[this.campaign.reapete_on.indexOf('THURSDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الخميس</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="THURSDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('FRIDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الجمعة</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="FRIDAY" class="reapete_on" />
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار الوقت
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                اختيار توقيت تنفيذ الحملة
                                            </popover>
                                        </h6>
                                    </td>
                                    <td class="td-3-col" colspan="2">
                                        <input class="form-control" type="time" v-model="campaign.repeate_at_time" />
                                    </td>
                                </tr>
                            </template>
                            <template v-if="campaign.repeate != '0'">
                                <tr class="sub">
                                    <td colspan="3">
                                        <h6 class="second-title">
                                            <i class="fas fa-stop-circle"></i>
                                            تحديد تكرار
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                تحديد نوع تكرار المهمة
                                            </popover>
                                        </h6>
                                    </td>
                                </tr>
                                <tr class="sub">
                                    <td class="td-3-col">
                                        <h6>
                                            <input type="radio"  v-model="campaign.type_repeate" value="0"/>
                                            تكرار لا محدود
                                        </h6>
                                    </td>
                                </tr>
                                <tr class="sub">
                                    <td class="td-3-col">
                                        <h6>
                                            <input type="radio" v-model="campaign.type_repeate" value="1"/>
                                            عدد مرات التكرار
                                        </h6>
                                    </td>
                                    <td class="td-3-col">
                                        <input class="form-control" type="number" v-model="campaign.count_repeate" :disabled="campaign.type_repeate == '0'"/>
                                    </td>
                                </tr>
                            </template>
                            <template v-if="campaign.repeate == 'custom'">
                                <tr class="even-td">
                                    <td class="td-3-col">
                                        <h6>
                                            <i class="fas fa-stop-circle"></i>
                                            وحدة التكرار
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                تحديد موعد التكرار
                                            </popover>
                                        </h6>
                                    </td>
                                    <td class="td-3-col">
                                        <select @change="resetUpdateRepeate" v-model="campaign.unit_repeate" class="form-control">
                                            <option value="0">يوميا</option>
                                            <option value="1">اسبوعيا</option>
                                            <option value="2">شهريا</option>
                                            <option value="3">سنويا</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="td-3-col">
                                        <h6 style="text-align:right">
                                            <i class="fas fa-stop-circle"></i>
                                            التكرار في
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                تخديد التكرار باختيار يوم من ايام الاسبوع
                                            </popover>
                                        </h6>
                                        <div v-if="campaign.unit_repeate == 0 || campaign.unit_repeate == 1" class="container-repeate-on">
                                            <ul>
                                                <li :class="[this.campaign.reapete_on.indexOf('SATURDAY') !== -1 ? 'active' : '']">
                                                    <label for="">السبت</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="SATURDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('SUNDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الاحد</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="SUNDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('MONDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الاثنين</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="MONDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('TUESDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الثلاثاء</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="TUESDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('WEDNESDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الاربعاء</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="WEDNESDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('THURSDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الخميس</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="THURSDAY" class="reapete_on" />
                                                </li>
                                                <li :class="[this.campaign.reapete_on.indexOf('FRIDAY') !== -1 ? 'active' : '']">
                                                    <label for="">الجمعة</label>
                                                    <input type="checkbox" v-model="campaign.reapete_on" value="FRIDAY" class="reapete_on" />
                                                </li>
                                            </ul>
                                        </div>
                                        <div v-if="campaign.unit_repeate == 2 || campaign.unit_repeate == 3" class="container-repeate-on">
                                            <ul>
                                                <li v-for="day in 31" :class="[campaign.reapete_on == day ? 'active' : '']" :key="day">
                                                    <label v-if="day == 1 || day == 2">{{ `${day}st` }}</label>
                                                    <label v-else>{{ `${day}th` }}</label>
                                                    <input type="radio" v-model="campaign.reapete_on" :value="day" class="reapete_on" />
                                                </li>
                                            </ul>
                                        </div>

                                    </td>
                                </tr>

                                <tr>
                                    <td class="td-3-col">
                                        <h6 style="text-align: right;">
                                            <i class="fas fa-stop-circle"></i>
                                            اختيار الوقت
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                اختيار توقيت تنفيذ الحملة
                                            </popover>
                                        </h6>
                                    </td>
                                    <td class="td-3-col" colspan="2">
                                        <input class="form-control" type="time" v-model="campaign.repeate_at_time" />
                                    </td>
                                </tr>
                                <tr class="sub">
                                    <td colspan="3" class="td-3-col">
                                        <h6 style="text-align:right">
                                            <i class="fas fa-stop-circle"></i>
                                            موعد الانتهاء
                                            <i style="color:#880e4f" class="fas fa-question-circle" v-popover:info.left></i>
                                            <popover :width="250" style="line-height:2em" transition="show-from-bottom" event="hover"  name="info">
                                                <i style="font-size:15px;color:#880e4f" class="fas fa-info-circle"></i>
                                                موعد لانتهاء الحملة
                                            </popover>
                                        </h6>
                                    </td>
                                </tr>
                                <tr class="sub">
                                    <td  class="td-3-col">
                                        <input id="never" v-model="campaign.end_type_cal" type="radio" value="0" />
                                        <label class="label-end" for="never">ابدا</label>
                                    </td>
                                </tr>
                                <tr class="sub">
                                    <td class="td-3-col">
                                        <input id="on"  v-model="campaign.end_type_cal" type="radio" value="1" />
                                        <label class="label-end" for="on">فى</label>
                                    </td>
                                    <td colspan="2">
                                        <input id="on" class="form-control" v-model="campaign.end_at" type="date" :min="new Date().toISOString().slice(0,10)" :disabled="this.campaign.end_type_cal != '1' ? true : false"/>
                                    </td>
                                </tr>
                            </template>
                        </tbody>
                    </table>
                </div>
                <div class="top-footer-model">
                    <button type="submit" class="btn btn-sm" :disabled="disable_form">
                        <img :src="require('../../../../../img/icons/addevent.svg')" />
                        اضافة المحدد
                    </button>
                    <button @click="CloseModel" type="button" class="btn btn-sm" :disabled="disable_form">
                        <img :src="require('../../../../../img/icons/close.svg')" />
                        الغاء
                    </button>
                </div>
            </div>
        </form>
        <alert-response :showsuccess="showsuccess" :showerrors="showerrors"
        @update_success="showsuccess = false"
        @update_errors="showerrors = false" :errors="errors"
        :success_message="success_message"
        :error_message="error_message"></alert-response>
    </div>
</template>
<script>
    import AlertResponse from './../Models/AlertResponse.vue';
    export default {
        components: {
            AlertResponse
        },
        props:{
            ShowTimes:{
                default:false,
                type: Boolean
            },
            campaign:{
                default:{},
                type: Object
            },
            count_repeate_set:{
                default:'off',
                type: String
            }
        },
        data(){
            return{
                checked:null,
                repeate:0,
                unit:0,
                time:1,
                errors:{},
                disable_form:false,
                showsuccess:false,
                showerrors:false,
                success_message:{},
                error_message:{},
                repeate_set:this.count_repeate_set,
                //errors:null
            }
        },
        methods:{
            CloseModel:function(){
                this.$emit('modelshow', false);
            },
            AddTimesForCampaign:function(){
                this.CloseModel();
                this.$emit('updateFromTimesCampaign', this.campaign);
            },
            ResetCampDefault:function(){
                if(this.campaign.repeate != 'monthly'){
                    this.campaign.reapete_on = [];
                }else{
                    this.campaign.reapete_on = null;
                }
            },
            resetUpdateRepeate:function(){
                if((this.campaign.unit_repeate == 0) || (this.campaign.unit_repeate == 1)){
                    this.campaign.reapete_on = [];
                }else{
                    this.campaign.reapete_on = null;
                }
            },
            timeNow:function(){
                let options = { timeZone: this.auth.user.time_zone,hour12: false, hour: '2-digit',hour: 'numeric', minute: 'numeric', second: 'numeric' };
                let currentTimeString = new Date().toLocaleString('en-US', options);
                return currentTimeString;
            },
            DateNow:function(){
                let currentTime = new Date();
                let options = { timeZone: this.auth.user.time_zone, year: 'numeric', month: 'numeric', day: 'numeric' };
                let currentTimeString = currentTime.toLocaleString('en-US', options);
                return new Date(currentTimeString).getTime();
            },
            FilterDate:function(item){
                let options = { timeZone: this.auth.user.time_zone, year: 'numeric', month: 'numeric', day: 'numeric' };
                let currentTimeString = new Date(item).toLocaleString('en-US', options);
                return new Date(currentTimeString).getTime();
            },
            FilterTime:function(item){
                let options = {hour12: true,hour: 'numeric', minute: 'numeric', second: 'numeric' };
                let datat = item.split(':');
                let datay   = new Date();
                datay.setHours(datat[0]);
                datay.setMinutes(datat[1]);
                return datay;
                // let currentTimeString = datay.toLocaleTimeString('en-US', options);
                // console.log(currentTimeString);
                // return currentTimeString;
            },
        },
        async created(){},
        watch:{
            campaign:{
                handler(value){
                    //console.log(this.auth.user);
                    if(value.repeate == '0' || value.repeate == 'custom'){
                        if(value.end_type_cal == '0' && value.repeate == 'custom'){
                            this.showerrors = false;
                            this.disable_form = false;
                        } else {
                            if(value.end_at || value.repeate_at_time){
                                if(this.FilterDate(value.end_at) < this.DateNow()){
                                    this.showerrors = true;
                                    this.error_message = "التاريخ المحدد منتهي الصلاحية الرجاء ضبط التاريخ";
                                    this.disable_form = true;
                                }
                                else {
                                    let time_entered = this.FilterTime(value.repeate_at_time);
                                    let time_now = this.timeNow().split(":");
                                    let hour = time_entered.getHours(); //> 12 ? time_entered.getHours() - 12 : time_entered.getHours();
                                    time_now[0] = (time_now[0] == '24' ? 0 : time_now[0]);
                                    if (hour < time_now[0] || (hour == time_now[0] && time_entered.getMinutes() < time_now[1])) {
                                        this.showerrors = true;
                                        this.error_message = "التاريخ المحدد منتهي الصلاحية الرجاء ضبط التاريخ";
                                        this.disable_form = true;
                                    } else {
                                        this.showerrors = false;
                                        this.disable_form = false;
                                    }
                                }
                            }
                        }
                    } else {
                        this.showerrors = false;
                        this.disable_form = false;
                    }
                },
                deep:true
            },
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
        background-color: #151c28;
        color: white;
        width: 45%;
        height:auto;
        margin:auto;
        margin-top: 5%;
   }
   .title-model{
        padding: 9px 15px;
        text-align: right;
        font-size: 17px;
        font-weight: bold;
        line-height: 2em;
        border-bottom: 1px solid #151c28;
   }
   .title-model .inner-title-model{
        background: #181920;
        padding: 2px 10px;
        border-radius: 10px;
        font-weight: bold;
   }
   .list-items{
        max-height:400px;
        overflow-y: auto;
        width: 100%;
   }
   .list-items tr{
        padding: 14px;
   }
   .top-footer-model{
        text-align: left;
        padding: 10px;
        /* border-top:1px solid #eee; */
   }
   .even-td
   {
        text-align: right;
   }
   .body-of-model{
        padding: 0px 16px;
   }
   td input.event_type[type="radio"]
   {
        /* float: right;
        margin-top: -40px;
        margin-right: 20px; */
   }
   .second-title{
        padding: 25px 7px 4px 0px;
        text-align: right;
   }
   .td-3-col{
       width: 30%;
       padding:10px;

   }
   .container-repeate-on ul li
   {
        display:inline-block;
   }
   .container-repeate-on{
        text-align:right;
   }
   .container-repeate-on ul li
   {
        list-style: none;
   }
   .container-repeate-on ul li
   {
        padding: 17px 0px;
        border-radius: 46px;
        height: 54px;
        width: 55px;
        background-color: #eee;
        margin: 5px;
        text-align: center;
        font-size: 12px;
        cursor: pointer;
        position: relative;
   }
   .container-repeate-on ul li.active
   {
        background-color: #42a5f5;
        color: white;
   }
   .title-repeate-on{
        text-align: right;
        padding: 5px 30px;
   }
   td p.times-text{
        text-align: right;
        padding: 10px;
        line-height: 2em;
   }
   .label-end{
        font-weight: bold;
        padding: 2px;
   }
   .container-repeate-on ul li .reapete_on{
        width: 100%;
        position: absolute;
        left: 0;
        height: 100%;
        top: 0;
        bottom: 0;
        opacity: 0;
        cursor: pointer;
   }
   .td-2-col{
    width:19%;
   }
   table tr:not(tr.sub){
        /* border-bottom: 1px solid #eee; */
   }
   .list-items td h6
   {
        color: #87888C;
        font-size: 15px;
        font-weight: bold;
   }
   .list-items .vue-popover{
      color:black;
   }
   .top-footer-model .btn{
        background: #A9DFD8;
        color: black;
        border-radius: 25px;
        margin: 0px 10px;
        font-weight: bold;
        font-size: 13px;
   }
   .form-control{
        color: white;
        background-color: #087869;
        border: 1px solid #087869;
    }
    .container-repeate-on ul li label {
        color:black;
    }
   @media(max-width:1000px){
        .card-model{
            width: 95%;
        }
        .container-repeate-on ul{
            padding: 10px 25px 0px 0px;
        }
    }
</style>
