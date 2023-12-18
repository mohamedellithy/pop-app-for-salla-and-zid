<template>
    <div v-if="ShowProductsValues" class="model-browose-products">
        <div class="card card-model">
            <div class="top-header-model">
                <p class="title-model">
                    <label class="inner-title-model">
                        <img :src="require('../../../../../img/icons/timespop.svg')" />
                        حذف تصنيفات المنتجات التى قمت يتحديدها
                    </label>
                </p>
            </div>
            <div class="body-of-model">
                <div class="overlayer-products" v-if="startfetch == true">
                    <img src="../../../../../img/Enso-2.gif" class="image-loading" style="width: 47px;margin-top: 20%;"/>
                </div>
                <table class="list-items">
                    <tbody>
                        <!-- ----------- -->
                        <!-- الجزء الاول اضافة قيم عامة لكل المنتجات -->
                        <!-- حذف الترميذات الخاصة لكل منتج -->
                        <template>
                            <tr>
                                <td class="container-check" colspan="6">
                                    <input class="set_type" type="radio" v-model="campaign.type_set" value="0"/>
                                    <label style="text-align: right;margin-bottom: 5px;">حذف التصنيفات الخاصة بالمنتجات</label>
                                    <ul class="container-tags" v-if="campaign.type_set == '0'" style="margin-top: 10px;">
                                        <template>
                                            <li v-for="(tag,key) in looped_categories" :key="key">
                                                <span v-if="(globalValues == null) || (globalValues.indexOf(key) == -1)">
                                                    {{ tag }}
                                                    <i @click="removeTag(key)" class="far fa-times-circle"></i>
                                                </span>
                                            </li>
                                        </template>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td class="container-check" colspan="6">
                                    <input class="set_type" type="radio" v-model="campaign.type_set" value="1"/>
                                    <label style="text-align: right;margin-bottom: 15px;"> حذف التصنيفات لكل منتج</label>
                                </td>
                            </tr>
                        </template>
                        <!-- حذف الترميذات الخاصة لكل منتج -->
                        <!-- ----------- -->
                        <!-- جزء اضافة تفاصيل لكل منتج على حدي -->
                        <!-- ----------- -->
                        <!-- اضافة قيم مفصلة لكل منتج على حدي -->
                        <template v-if="campaign.type_set == '1'">
                            <template v-if="campaign.type_selected === 1">
                                <template v-for="(single_product,index_product) in selected_products">
                                    <tr :key="index_product" v-if="campaign.products.indexOf(single_product.id) != -1">
                                        <template>
                                            <td>
                                                <img :src="(single_product.image ? single_product.image : require('../../../../../img/product.png'))"  class="product-img"/>
                                            </td>
                                            <td>
                                                <h6> {{ single_product.name }}</h6>
                                            </td>
                                            <td>
                                                <!-- حذف تاج لكل منتج -->
                                                <template>
                                                    <ul class="container-tags">
                                                        <li v-for="(tag,index_category) in single_product.categories" :key="index_category">
                                                            <span v-if="(privateValues[single_product.id] == null ) || (privateValues[single_product.id].indexOf(tag.id) == -1)">
                                                                {{ tag.name.ar || tag.name  }} <i @click="removePrivateTag(index_product,index_category,single_product.id,tag.id)" class="far fa-times-circle"></i>
                                                            </span>
                                                        </li>
                                                    </ul>
                                                </template>
                                            </td>
                                        </template>
                                    </tr>
                                </template>
                            </template>
                        </template>
                        <!-- اضافة قيم مفصلة لكل منتج على حدي -->
                    </tbody>
                </table>
            </div>
            <div class="top-footer-model">
                <button @click="AddProductsValuesForCampaign" class="btn">
                    <img :src="require('../../../../../img/icons/addevent.svg')" />
                    تحديد التصنيفات
                </button>
                <button @click="CloseModel" type="button" class="btn">
                    <img :src="require('../../../../../img/icons/close.svg')" />
                    الغاء
                </button>
            </div>
        </div>
    </div>
</template>
<script>
    import MultipleSelect from 'multiple-select-js'
    export default {
        components:{
            MultipleSelect
        },
        props:{
            ShowProductsValues:{
                default:false,
                type: Boolean
            },
            campaign:{
                default:{},
                type: Object
            },
        },
        data(){
            return{
                globalValues:[],
                privateTags:[],
                privateValues:[],
                products:[],
                categories:[],
                selected_products:[],
                selected_categories:[],
                privatetag:[],
                privatevalue:[],
                errors:{},
                counter:0,
                current_event:this.campaign.action,
                startfetch:false,
                fetched_products:[],
                fetched_categories:[],
                looped_categories:{},
                all_categories:[]
            }
        },
        methods:{
            CloseModel:function(){
                this.ShowEvents = false;
                this.$emit('modelshow', false);
            },
            removePrivateTag:function(index_product,index_category,product_id,tag){
                if(!this.privateValues[product_id]){
                    this.counter = 0;
                } else if(typeof this.privateValues[product_id] !== 'object'){
                    this.privateValues[product_id] = null;
                    this.counter = 0;
                } else{
                    this.counter = this.privateValues[product_id].length;
                }

                this.privateValues[product_id] = this.privateValues[product_id] || [];
                this.privateValues[product_id][this.counter++] = tag;
                this.selected_products[index_product].categories.splice(index_category,1);
            },
            removeTag:function(tag){
                if(typeof this.globalValues !== 'object'){
                    this.globalValues = [];
                }
                this.globalValues.push(tag);
            },
            AddProductsValuesForCampaign:function(){
                this.CloseModel();
                let set_values_products = null;
                // tags
                if(this.campaign.type_set == '0'){
                        set_values_products = this.globalValues.join('-');
                } else {
                    for(let product_id in  this.privateValues){
                        set_values_products[product_id] = this.privateValues[product_id].join('-');
                    }
                }

                // update from products values
                this.$emit('updateFromProductsValuesCampaign',set_values_products);
            },
        },
        filters:{
            filter_tags_loop(tags){
               return tags;
            }
        },
        watch:{
            ShowProductsValues:async function(value){
                let self         = this;
                if(value == true){
                    self.privateValues = self.campaign.products_values || {};
                    self.globalValues  = Object.values(self.privateValues)[0] || [];
                    self.startfetch    = true;
                    if(self.campaign.type_selected == 1){
                        const promises = self.campaign.products.map(async function(element){
                            if(self.fetched_products.indexOf(element) == -1){
                                self.fetched_products.push(element);
                                await axios.get('/api/single-app-product/' + element).then(async function({data}){
                                    if(self.selected_products.indexOf(data.product) == -1){
                                        self.selected_products.push(data.product);
                                        for await (const element_cat of data.product.categories){
                                            self.looped_categories[element_cat.id] = element_cat.name.ar || element_cat.name;
                                        }
                                    }
                                }).catch(function({response}){
                                });
                            }
                        });
                        
                        // Wait for all promises to resolve using Promise.all
                        await Promise.all(promises);
                    } else if(self.campaign.type_selected == 2){
                        const promises = self.campaign.categories.map(async function(element){
                            if(self.fetched_categories.indexOf(element) == -1){
                                self.fetched_categories.push(element);
                                await axios.get('/api/app-categories').then(function({data}){
                                    console.log(data,'nn');
                                    self.all_categories  = data.categories.results;
                                }).catch(function({response}){});

                                await axios.get('/api/single-app-category/' + element).then(async function({data}){
                                    if(self.selected_categories.indexOf(data.category) == -1){
                                        self.selected_categories.push(data.category);
                                        for await (const element_cat of self.all_categories){
                                            self.looped_categories[element_cat.id] = element_cat.name.ar || element_cat.name;
                                        }
                                    }
                                }).catch(function({response}){
                                });
                            }
                        });

                        // Wait for all promises to resolve using Promise.all
                        await Promise.all(promises);
                    }
                    self.startfetch = false;
                }
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
        background-color: #151c28;
        color: white;
        width:60%;
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
   .body-of-model{
        padding: 0px 20px;
        max-height:400px;
        overflow-y: auto;
   }
   .overlayer-products{
        position: absolute;
        top:0;
        right:0;
        left:0;
        bottom:0;
        background: #000000a6;
        z-index: 100;
   }
   .list-items{
     width:100%;
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
   td input.event_type[type="radio"]
   {
        float: right;
        margin-top: -40px;
        margin-right: 20px;

        height: 20px;
        width: 20px;
        vertical-align: middle;
   }
   .list-items tr{
        border-bottom: 1px solid #eee
   }
   .list-items tr:first-child
    {
        position: sticky;
        top: 0px;
        /* background: #e3f8e3; */
        background: #0b1017;
        border-bottom: 0px solid #ffffff;
    }
    .list-items tr:nth-child(2){
        position: sticky;
        top: 48px;
        /* background: #e3f8e3; */
        background: #0b1017;
        border-bottom: 1px solid #eee;
    }
    .list-items tr td
   {
    padding: 5px;
   }
   .list-items tr:nth-child(2) td,
   .list-items tr:first-child td
   {
    padding: 0px 20px;
   }
   .list-items tr:nth-child(2) td label,
   .list-items tr:first-child td label
   {
        line-height: 3em;
        padding: 0px 5px;
   }
   .product-img{
       width: 50px;
   }
   .container-check{
    text-align: right;
   }
   .set_type{
        height: 20px;
        width: 20px;
        vertical-align: middle;
   }
   .input_values
   {
        width: 100%;
        margin: 0% 0% 0%;
   }
   .container-tags{
        /* background-color: white; */
        background-color: #0b1017;
        border-bottom: 1px solid white;
        padding: 15px;
        text-align: right;
        height: 171px;
        overflow: auto;
   }
   .container-tags li{
        display: inline-block;
        color: white;
        margin: 8px 3px;
   }
   .container-tags li span{
        background-color: rgb(9, 9, 84);
        padding: 4px 10px;
        margin: 3px;
   }
   .fa-times-circle{
        cursor: pointer;
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
        background-color: #1f1f1f;
        border: 1px solid #1f1f1f;
        height: 46px;
        margin: 10px 0px;
        color: white;
   }
   .list-items tr:last-child{
        border-bottom: 0px;
   }
   @media(max-width:1000px){
        .card-model{
            width: 95%;
        }
        .product-img{
            width: 40px;
        }
    }
</style>
