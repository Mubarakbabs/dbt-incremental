{% set config_unique_key = "(id || name || number)" %}
{% set unique_key_list = (config_unique_key | replace('(', '') | replace(')', '') | replace(' ', '')).split('||') %}

select 
*
from test

where 1=1 and 

{% for column in unique_key_list %}
test.{{ column }} is not null
{% endfor %}



