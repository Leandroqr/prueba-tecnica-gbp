<template>
    <modal ref="crearUsuario" titulo="Crear usuario">

    </modal>
</template>

<script>
export default {
    components: {
        modal: () => import('~/components/modal')
    },
    methods: {
        toggle(){
            this.$refs.crearUsuario.toggle()
        }
    }
}
</script>

<style lang="css" scoped>
</style>
