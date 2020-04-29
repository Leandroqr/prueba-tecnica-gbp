<template>
    <modal ref="TransferirProducto" titulo="Agregar producto" tamano="modal-lg">
        <div class="row mx-0 my-3">
            <div class="col-6">
                <label>Bodega origen</label>
                <el-select v-model="value" placeholder="Select" class="w-100">
                    <el-option
                    v-for="item in options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                    />
                </el-select>
            </div>
            <div class="col-6">
                <label>Bodega destino</label>
                <el-select v-model="value" placeholder="Select" class="w-100">
                    <el-option
                    v-for="item in options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                    />
                </el-select>
            </div>
        </div>
        <div class="row mx-0 my-3">
            <div class="col-6">
                <label>Producto</label>
                <el-select v-model="value" placeholder="Select" class="w-100">
                    <el-option
                    v-for="item in options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                    />
                </el-select>
            </div>
            <div class="col-2">
                <label>Cantidad</label>
                <input type="text" class="form-control" name="" value="" />
            </div>
        </div>
    </modal>
</template>

<script>
export default {
    components: {
        modal: () => import('~/components/modal')
    },
    data(){
        return {
            options: [{
                value: 'Option1',
                label: 'Option1'
            }, {
                value: 'Option2',
                label: 'Option2'
            }, {
                value: 'Option3',
                label: 'Option3'
            }, {
                value: 'Option4',
                label: 'Option4'
            }, {
                value: 'Option5',
                label: 'Option5'
            }],
            value: '',
        }
    },
    methods: {
        toggle(){
            this.$refs.TransferirProducto.toggle()
        }
    }
}
</script>

<style lang="css" scoped>
</style>
