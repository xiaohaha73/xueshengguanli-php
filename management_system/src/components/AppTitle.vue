<template>
  <div id="apptitle">{{title}}</div>
</template>

<script>
export default {
  name: 'appTitle',
  props: ['title']
}
</script>

<style scoped>
#apptitle {
  height: 35px;
  width: 100%;
  background: #d9ecff;
  line-height: 31px;
  box-sizing: border-box;
  padding-left: 20px;
  color: #409eff;
  font-weight: bold;
}
</style>
