<!-- Users need: last name, firstname, location group, title -->

<script>
    // api call? users will become a request -- title, group and location will likely take a numbered key
    let users = [{
        "firstName" : "Chad",
        "lastName" : "Gouin",
        "location" : "Hales Corners",
        "group" : 1,
        "title" : "Technician",
        "image" : null,
        "theme" : "blue",
    }, 
    {
        "firstName" : "Chris",
        "lastName" : "Haliga",
        "location" : "Milwaukee",
        "group" : 1,
        "title" : "Software Engineer II",
        "image" : null,
        "theme" : "pink",
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
                    <td style="display: inline-flex;">

                        <!-- Come back to this with actual images -->
                        <button type="button" class="profile" style="background-color: {user.theme}">
                            {#if user.image === null}
                                {user.firstName[0]}{user.lastName[0]}
                            {:else}
                                <img src="-{user.image}" alt="-{user.firstName}'s Profile Picture"/>
                            {/if}
                        </button>

                        <p>{user.lastName} , {user.firstName}</p>
                    </td>
                    <td>{user.location}</td>
                    <td>{user.group}</td>
                    <td>{user.title}</td>
                    <td class="final-col">
                        <button type="button" class="list-more-options">...</button>
                    </td>
                </tr>
            {/each}
        </tbody>
    </table>
</div>

<style>
    table{
        background-color: #ffffff;
        border-collapse: collapse;
        width: 100%;
        color: black;
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