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
    <table>
        <thead>
            <tr>
                <th>
                    <input type="checkbox" /> 
                </th>
                <th>Users({users.length})</th>
                <th>Locations()</th>
                <th>Groups()</th>
                <th>Title</th>
                <th></th>
            </tr>
        </thead>

        <tbody>
            {#each users as user}
                <tr class="listed-user"> 
                    <td>
                        <input type="checkbox" />
                    </td>
                    <td >
                        <button class="profile"></button>
                        <span style="vertical-align: super;">{user.lastName} , {user.firstName}</span>
                    </td>
                    <td>{user.location}</td>
                    <td>{user.group}</td>
                    <td>{user.title}</td>
                    <td class="final-col">
                        <button class="list-more-options">...</button>
                    </td>
                </tr>
            {/each}
        </tbody>
    </table>
    <!-- <ul>
        <li>
            <input type="checkbox" /> 
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
                <input type="checkbox" />
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
    </ul> -->
</div>

<style>
    table{
        background-color: #ffffff;
        border-collapse: collapse;
        width: 100%;
        color: black;
        margin: 0 1vw;
    }

    div{
        margin: 0 2vw;
    }
    
    td, th {
        text-align: left;
        padding: 1vh 0;
    }

    th{
        border: 2px solid #7f7f7f;
        border-style: none none solid none;
        padding: 2vh 0;
    }

    input{
        margin: 1em;
        color-scheme: light;
    }
</style>