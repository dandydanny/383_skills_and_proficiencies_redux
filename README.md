<h2 id="toc_0">Objectives</h2>

<p>For this challenge, you&#39;ll be adding some new functionality to a very basic Sinatra+ActiveRecord application. The application in its current form includes:</p>

<ul>
<li>a <code>User</code> model (along with sign-in and sign-up functionality)</li>
<li>a <code>Skill</code> model (representing a skill that a user might have)</li>
</ul>

<p>Your task is to add the notion of &quot;proficiency&quot; to the application. A user can have many skills, and a skill can belong to many users. A &quot;proficiency&quot; is an association between <code>User</code>s and <code>Skill</code>s, and has the following additional <em>required</em> attributes:</p>

<ul>
<li>years of experience</li>
<li>a flag tracking whether or not the user has formal education for the given skill</li>
</ul>

<p>You&#39;ll need to provide an interface in the application for users to select the skills that they have. How you choose to provide this interface is up to you, but a user should only be able to edit her own skills, not the skills of other users.</p>

<p>Also, the home page of your application should simply show each user, along with each of her skills, how many years experience she has with said skill, and whether or not she&#39;s been formally educated in that skill. For example:</p>

<style>
tr.new-user {
  border-top: 1px dotted grey;
}
th {
  text-align: left;
}
td {
  padding-right: 40px;
}
</style>

<table>
  <tr>
    <th>Name</th><th>Skill</th><th>Years</th><th>Formal?</th>
  </tr>
  <tr class="new-user">
    <td>Amanda Huggenkyss</td><td>Ruby (technical)</td><td>1</td><td>yes</td>
  </tr>
  <tr>
    <td></td><td>JavaScript (technical)</td><td>2</td><td>yes</td>
  </tr>
  <tr class="new-user">
    <td>Ben Dover</td><td>Illustrator (creative)</td><td>5</td><td>no</td>
  </tr>
  <tr>
    <td></td><td>CSS (technical)</td><td>3</td><td>no</td>
  </tr>
</table>

<h3 id="toc_1">Skeleton Code</h3>

<p>You should start with <a href="http://cl.ly/0v0G1I273W3o">this applicaiton skeleton</a>.</p>

<h2 id="toc_2">Useful Notes / Tidbits</h2>

<ul>
<li>What&#39;s the <a href="http://guides.rubyonrails.org/association_basics.html#the-has_many-through-association">right kind of association</a> between <code>User</code> and <code>Skill</code>?</li>
<li>Validations on boolean fields <a href="http://stackoverflow.com/questions/10506575/rails-database-defaults-and-model-validation-for-boolean-fields">can be tricky</a>.</li>
<li>Before implementing a manual way to add new proficiencies for a user, you might try adding some through your <code>seeds.rb</code> file.</li>
</ul>
