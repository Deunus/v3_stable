alter table fanfiction_authorinfo add primary key(uid,field);
alter table fanfiction_blocks drop index block_name;
alter table fanfiction_blocks add unique index block_name (block_name);
alter table fanfiction_categories drop index category;
alter table fanfiction_categories drop index parentcatid;
create index byparent on fanfiction_categories (parentcatid,displayorder);
create index forstoryblock on fanfiction_chapters (sid,validated);
create index byname on fanfiction_classes (class_type,class_name,class_id);
alter table fanfiction_classtypes drop index classtype_title;
create unique index classtype_name on fanfiction_classtypes(classtype_name);
create index code_type on fanfiction_codeblocks(code_type);
alter table fanfiction_comments drop index nid;
alter table fanfiction_comments add index commentlist (nid,time);
alter table fanfiction_favorites drop index uid;
create unique index byitem on fanfiction_favorites (item,type,uid);
create unique index byuid on fanfiction_favorites (uid,type,item);
alter table fanfiction_inseries drop index seriesid;
alter table fanfiction_inseries drop index inorder;
alter table fanfiction_inseries add index (seriesid,inorder);
alter table fanfiction_inseries drop index sid;
alter table fanfiction_inseries add primary key (sid,seriesid);
create index message_name on fanfiction_messages (message_name);
alter table fanfiction_pagelinks drop index link_text;
alter table fanfiction_panels drop index panel_hidden;
alter table fanfiction_panels drop index panel_type;
alter table fanfiction_panels add index panel_type (panel_type,panel_name);
create index avgrating on fanfiction_reviews(type,item,rating);
alter table fanfiction_reviews drop index sid;
create index bychapter on fanfiction_reviews (chapid,rating);
alter table fanfiction_reviews add index byuid (uid,item,type);
alter table fanfiction_series drop index owner;
create index owner on fanfiction_series (uid,title);
alter table fanfiction_stories drop index validated;
create index validateduid on fanfiction_stories (validated,uid);
create index recent on fanfiction_stories (updated,validated);