<!-- Users need: last name, firstname, location group, title -->

<script>
    // api call? users will become a request -- title, group and location will likely take a numbered key
    let users = [{
        "firstName" : "Chad",
        "lastName" : "Gouin",
        "location" : "Hales Corners",
        "group" : 1,
        "title" : "Technician",
    }, 
    {
        "firstName" : "Chris",
        "lastName" : "Haliga",
        "location" : "Milwaukee",
        "group" : 1,
        "title" : "Software Engineer II",
    }
    ];
    
</script>

<div>
    <ul>
        <li>
            <input type="checkbox" /> <!--  Ensure this targets the user object -->
            <div class="user-data">
                <p>Users({users.length})</p>
                <p>Locations()</p>
                <p>Groups()</p>
                <p>Title</p>
            </div>
            <div class="hidden-div"></div>
        </li>
    
        <hr>
    
        {#each users as user}
            <li class="listed-user"> 
                <input type="checkbox" /> <!--  Ensure this targets the user object -->
                <div class="user-data">
                    <p class="user-name">
                        <button class="profile"></button>
                        {user.lastName} , {user.firstName}
                    </p>
                    <p>{user.location}</p>
                    <p>{user.group}</p>
                    <p>{user.title}</p>
                </div>
                <button class="list-more-options">...</button>
            </li>
        {/each}
    </ul>
</div>

<style>
    div{
        margin: 0 2vw;
    }

    ul {
        list-style: none;
        padding-inline-start: 0%;
        margin: 0 1vw;
    }

    li {
        display: flex;
        flex-direction: row;
        align-items: center;
        color: black;
        height: 8vh;
        padding: 0 1vw;
    }
    
    li p{
        width: 25%;
    }

    input{
        color-scheme: light;
    }
</style>