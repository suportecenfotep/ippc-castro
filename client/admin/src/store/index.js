import { createStore } from 'vuex'

const store =  createStore({
  state: {
    user:JSON.parse(localStorage.getItem("user")),
    token:localStorage.getItem("token"),
    isAuthenticated:false
  },
  getters: {
    getToken: state => state.token,
    isAuthenticated: state => state.isAuthenticated,
    getUser: state => state.user,
  },
  mutations: {
    login(state, {user,token}){
      state.isAuthenticated = true;
      state.user = JSON.parse(localStorage.getItem("user"));
      state.authUser = user;
      state.token = token;
      localStorage.setItem("user", JSON.stringify(user));
      localStorage.setItem("token", token);
    },
    logout(state) {
      state.isAuthenticated = false;
      state.user = null;
    }
  },
  actions: {
  },
  modules: {
  }
})

export default store;