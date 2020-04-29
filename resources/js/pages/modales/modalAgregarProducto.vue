<template>
    <modal ref="agregarProducto" titulo="Agregar producto" tamano="modal-lg">
        <div class="row mx-0 my-3">
            <div class="col-5">
                <label>Bodega</label>
                <el-select v-model="bodega_select" placeholder="Select" class="w-100">
                    <el-option
                    v-for="bodega in bodegas"
                    :key="bodega.id"
                    :label="bodega.nombre"
                    :value="bodega.id"
                    />
                </el-select>
            </div>
            <div class="col-5">
                <label>Producto</label>
                <el-select v-model="producto_select" placeholder="Select" class="w-100">
                    <el-option
                    v-for="producto in productos"
                    :key="producto.id"
                    :label="producto.nombre"
                    :value="producto.id"
                    />
                </el-select>
            </div>
            <div class="col-2">
                <label>Cantidad</label>
                <input type="text" v-model="cantidad" ref="cant" class="form-control" name="" value="" />
            </div>
            <div class="col-3">
               <button type="button" class="btn btn-sm btn-primary" @click="agregarInventario" name="button">Guardar</button>
            </div>
        </div>
    </modal>
</template>

<script>
import axios from 'axios'
import EventBus from '../../event-bus.js'
export default {
    components: {
        modal: () => import('~/components/modal')
    },
    data(){
        return {
            bodega_select: null,
            producto_select: null,
            cantidad: 0,
            options: [],
            bodegas: [],
            productos: [],
            value: '',
        }
    },
    mounted() {
        this.bodegasActivas();
        this.productosActivos();
    },
    methods: {
        toggle(){
            this.$refs.agregarProducto.toggle()
        },
        productosActivos() {
            axios.get('http://localhost:8000/api/productosActivos')
            .then(response => {
                if (response.status == 200) {
                    this.productos = response.data
                }
            })
            .catch( err => {
                console.log(err);
            })
        },
        bodegasActivas() {
            axios.get('http://localhost:8000/api/bodegasActivas')
            .then(response => {
                if (response.status == 200) {
                    this.bodegas = response.data
                }
            })
            .catch( err => {
                console.log(err);
            })
        },
        agregarInventario() {
            let url = 'http://localhost:8000/api/addInventario'
            axios.post(url, {
                bodega_select: this.bodega_select,
                producto_select: this.producto_select,
                cantidad: this.cantidad, 
            })
            .then( res => {
                console.log(res.data)
                this.toggle()
                // EventBus.$emit('add-prod-inventario', res.data.inventario)

            })
            .catch( err => {
                console.log(error)
            })
        }
    }
}
</script>

<style lang="css" scoped>
</style>
