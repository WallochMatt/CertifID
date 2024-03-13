<script>
    function showDropdown() {
        document.getElementById("myDropdown").classList.toggle("show");
    }
</script>



<!-- three dot menu -->

        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
        <ul class="icons clickable" on:click={showDropdown}>
            <li></li>
            <li></li>
            <li></li>
        </ul>

        <!-- menu -->
        <!-- <div id="myDropdown" class="dropdown-content">
            <a href="#home">Open</a>
            <a href="#about">Edit</a>
    </div> -->



<style>
    .clickable {
        margin: 2vw;
        padding-inline-start: 0ch;
        background-color: #cccccc;
        border-radius: 50%;
        height: 2vw;
        width: 2vw;
        display: flex;
        align-items: center;
        justify-content: space-evenly;
    }

    .icons li {
        background: none repeat scroll 0 0 black;
        height: 5px;
        width: 5px;
        list-style: none outside none;
        border-radius: 50%;
        pointer-events: none;
    }

    .dropdown {
        position: absolute;
        display: inline-block;
        right: 0.4em;
    }






/* .showLeft {
    background-color: white !important;
    border: 1px solid white !important;
    text-shadow: white !important;
    color: black !important;
    padding: 10px;
}
.btn-right {
    right: 0.4em;
}

.btn-right {
    position: absolute;
    top: 0.24em;
}

    .dropbtn {
    background-color: #4caf50;
    position: fixed;
    color: white;
    font-size: 16px;
    border: none;
    cursor: pointer;
    }

    .dropbtn:hover,
    .dropbtn:focus {
    background-color: #3e8e41;
    }



    .dropdown-content {
    display: none;
    position: relative;
    margin-top: 60px;
    background-color: #f9f9f9;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    z-index: 1;
    }

    .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    }

    .dropdown a:hover {
    background-color: #f1f1f1;
    }

    .show {
    display: block;
    } */

</style>







