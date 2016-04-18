#B-MU201/PRINCIPAL STUDY 2 (MUSIC TECHNOLOGY)/AY15-16

# Assignment C for B-MU201 Principal Study
# Wong Chong Hao 16536
# http://amonmakesoriginalnoises.tumblr.com/tagged/processing


## Assignment C

[Video](https://vimeo.com/150841540)

![image](http://41.media.tumblr.com/094dd5c702f4ec1051b8f9aeb8aecb10/tumblr_o4nri3ZjyN1udcd6jo1_1280.jpg)


![image](http://41.media.tumblr.com/131c5534b4f27097a36250258bdc7163/tumblr_o4nri3ZjyN1udcd6jo2_1280.jpg)  <b>1DDCB (New Age Dark Age) by Raven Kwok</b>

# Why I chose this project? 
I chose Raven Kwok’s 1DDCB <i>(New Age Dark Age)</i> because it’s a hybrid derivative to two of his other generative art pieces <i>(Skyline and Stickup)</i>. The entire system is done with real-time processing and blends the two works' visual elements. The forms introduced are audio-reactive and camera-reactive and despite its seemingly complex visual elements, you can see how he manipulates the colour between foreground and background to bring our attention to different algorithm forms. 

What I enjoy particularly about this piece is the use of Voronoi tessellation and how they interact with the music. I am interested in the idea of “<i>organic</i>” creative coding and real-time processing using sound as the core element. Raven’s work inspires me to work towards that direction visually. 

# How does it work? 
Raven describes 1DDCB as <i>"consisting of multiple layers of quadtree structures. These structures partition the 3D space into block quadrants which further subdivides within itself"</i>. He further explains that <i>"the vertices of each cell within the quadtree are used as seeds to generate a layer of Voronoi tessellation, collectively forming a fragmental geometric chaos."</i> 
 
He could have used Karsten Schmidt's <b>toxiclibs</b> or Lee Byron's <b>Mesh</b> to generate the quadtree structures. When the sketch switches colour between the backgrounds, the quadtree structures are refreshed, generating quads within it. The vertices of each cell are then sorted into different agents driven by the song's audio spectrum (<i>Damien Di Fede's</i> <b>Minim</b>) to generate the different Voronoi tessellations. He could have possibly used <b>PeasyCam</b> or a z-axis camera to move down the z-axis. To get this sort of precision, he could have used something like <b>Duration</b> to sync the audio and visual. 




