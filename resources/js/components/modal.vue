<template>
    <div id="exampleModalCenter" ref="modal-gbp" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div :class="`modal-dialog modal-dialog-centered ${tamano ? tamano:''}`" role="document">
            <div class="modal-content">
                <div v-if="titulo" class="modal-header custom-modal-header">
                    <div class="w-100">
                        <div class="row">
                            <div class="col-sm-12 my-auto d-flex justify-content-center align-items-center">
                                <p v-if="titulo" class="modal-title f-600 f-18 my-2" :class="centrar?'text-center':''">
                                    <i :class="`${icono ? icono:''}`" style="position:relative; top:4px;" />
                                    {{titulo}}
                                </p>
                            </div>
                        </div>
                        <span class="cerrar-modal" data-dismiss="modal" aria-label="Close" aria-hidden="true">&times;</span>
                    </div>
                </div>
                <div :class="`modal-body ${clase}`">
                    <slot />
                </div>
            </div>
        </div>
    </div>
</template>

<script >
export default {
    // inject:['$validator'],
    name:'Modal',
    props:{
        titulo:{
            type:String,
            default:''
        },
        tamano:{
            type:String,
            default:''
        },
        icono:{
            type:String,
            default:''
        },
        centrar:{
            type:Boolean,
            default:true
        },
        clase:{
            type:String,
            default: ''
        }
    },
    methods:{
        toggle(){
            $(this.$refs['modal-gbp']).modal('toggle');
        }
    }
}
</script>

<style lang="scss" scoped>
span.cerrar-modal {
    z-index: 1;
    color: darkgray;
    font-size: 43px;
    position: absolute;
    top: -12px;
    right: 9px;
    cursor: pointer;
}
.custom-modal-header {
    padding: 0px 10px !important;
}
</style>
