<template>
    <div class="container-search-advanced">
        <small class="label">البحث فى التجار</small>
        <input v-model="search" @focus="startfuncsearch"  :class="`search-box form-control ${startsearch == true ? 'active' : ''}`" placeholder="البحث فى التجار"/>
        <div v-if="startsearch" class="show-search-result">
            <ul>
                <template v-if="search">
                    <li v-for="(item,key) in results" class="item-list" :key="key">
                        <p @click="SelectedItem(item)" style="margin-bottom: 0px;">
                            {{ item }}
                        </p>
                    </li>
                </template>
                <template v-else>
                    <li v-for="(item,key) in DataSearch" class="item-list" :key="key">
                        <p @click="SelectedItem(item)" style="margin-bottom: 0px;">
                            {{ item }}
                        </p>
                    </li>
                </template>
            </ul>
        </div>
    </div>
</template>
<script>

export default{
    name:'AdvancedSearch',
    props:{
        DataSearch:{
            default :[],
            type    : Array
        },
        defaultValue:{
            default :null,
            type    : String
        }
    },
    data(){
        return{
            search:this.defaultValue,
            startsearch:null,
            results:[]
        }
    },
    methods:{
        startfuncsearch:function(){
            this.startsearch = true;
            console.log(this.DataSearch.length);
            if(this.DataSearch.length === 0){
                this.$emit('FetchOnceTime','hi this fetched');
            }
        },
        endfuncsearch:function(){
            this.startsearch = null;
        },
        SelectedItem:function(value){
            this.endfuncsearch();
            this.search = value;
            this.$emit('SelectedItem',value);
        }
    },
    created(){
        let self = this;
        document.addEventListener('click',function(event){
            if((event.target.classList[0] != 'search-box') && ( event.target.classList[0] != 'item-list' )){
                self.endfuncsearch();
            }
        });
    },
    watch:{
        search:function(search_value){
            this.results = this.DataSearch.filter(function(item){
                let searc= item;
                if(searc.search(new RegExp(search_value, "ig")) != -1){
                    return item;
                }
            });
            
            if(!search_value){
                this.$emit('SelectedItem',search_value);
            }
        }
    }
}
</script>
<style scoped>
.container-search-advanced{
    padding: 0% 0% 6% 0%;
    position: relative;
}

.show-search-result ul{
    padding: 0px 20px;
    list-style: none;
}
.show-search-result ul li
{
    line-height: 2em;
    padding: 6px 0px;
    border-bottom: 1px solid #293342;
}
.show-search-result ul li:last-child{
    border-bottom: 0px;
}
.container-search-advanced input
{
    line-height: 2em;
    border-bottom: 0px;
    background-color: #3a3b4a;
    color: white;
    border: 1px solid #3a3b4a;
}
.container-search-advanced input.active
{
    border-radius: 6px 6px 1px 0px;
}
small.label{
    font-weight: bold;
    color: #4faeb4;
    line-height: 3em;
}
.show-search-result{
    background-color: white;
    position: absolute;
    left: 0;
    right: 0;
    max-height: 400px;
    overflow-y:auto;
    cursor: pointer;
    box-shadow: 0px 4px 5px 2px #0b0a0a5c;
    background-color: #1d2737;
    color: white;
    border: 1px solid #1d2737;
}
</style>