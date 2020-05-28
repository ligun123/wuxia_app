import 'package:flutter/material.dart';

class XChapterView extends StatefulWidget {
  XChapterView({Key key}) : super(key: key);

  _XChapterViewState createState() => _XChapterViewState();
}

class _XChapterViewState extends State<XChapterView> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter"),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemBuilder: (ctx, index) {
              print("$index");
              return Text(testData);
            },
          ),
        ],
      ),
    );
  }

  final testData = '''
  Three figures stepped into the conference room and saluted Velvund as soon as they laid eyes on him. Although they were nobility of the North, none of them had enough status to ignore the former King of the North's presence.

Velvund waved his left hand and said, "Come now, don't be so rigid, you three. I would never hold my grandson's darling friends to such formalities. Please, come in and take a seat."

The first to respond was her, the one in between what seemed to be her personal escorts -- the other two fellows in military uniforms. She had grown considerably since Reed had last seen her, to the point his mind froze when he laid eyes on her. In truth, she had always been a humble beauty in her own right, different from the cold, elegant flower that Astrid had been.

If Astrid had been a frozen rose and Lu'um a fiery sunflower, then Ophelia would have been best described as a tender lily. Out of the three of them, she had always been the most balanced in all respects, which was something Reed always found particularly endearing.

She might not have been an Ancient Mulian princess, but it never seemed to have stopped her from catching the attention of other trainees during the days at the Spire. There was something to be said about that feat, which few ever recognized.

But she had changed. Ophelia was no longer the tender lily Reed once remembered. She had completely bloomed, to such an extent that almost did not recognize her. Were it not for her warm, almond-blonde eyes, he would have never made the connection.

Her sweet, homely features had matured dramatically. No longer could she be called a hidden, overshadowed flower. Her full, red lips had a frightening ability to pull in his attention. Before Reed was a mature, young woman that had developed a... motherly appearance about her in a variety of ways.

It took all of Reed's willpower not to stare at her well endowed, motherly... assets. Lu'um was no slouch herself, but Ophelia was clearly in her own weight class. Reed confidently came to the conclusion that she had even beat the reigning champion, Violett, at her own game. There was a new overlord atop the mountain of womanly virtues... and it was Ophelia.

Ophelia, surprisingly, was the only one of the three that come without a military uniform. Instead, she wore formal civilian clothes and a large, black overcoat that had a golden brooch of some sort pinned on it.

It was a shiny brooch of a golden moon that had a small red gemstone embedded on it in the of a drop of blood. It certainly had some major significance in the North, but Reed was unaware as he knew next to nothing on the matter.

The other two had undergone transformations that were no less amazing than Ophelia's. 

The royal cub had grown into a lion befitting of his own bloodline. Astor, though seemingly normal on the outside, now had the makings of something formidable within him. The Anima fluctuations that rolled off of him were nothing like what Reed remembered of his old friend. He wagered that Astor must have gone hell and back to have received the Will of the World's approval and its fortuitous blessings since the Twilight War. 

 


Astor's long, golden mane had grown considerably since their last meeting. His charming, princely features had also developed well. Reed mused over the fact that there was now an actual semblance of a kingly lion to his natural visage. Although it was indubitably regal and majestic to gaze upon, Reed wondered how much work it took to maintain that sort of hairstyle. 

Horatio seemed to have changed the most of the three, though. The last Reed had seen him, the stoic fellow had sported a no-nonsense crew cut reminiscent of a freshly conscripted recruit. That clean-cut image had been destroyed in totality with the arrival of the present-day Horatio.

His dark, ruffled hair drooped down to his shoulders, which completely threw Reed off. If that wasn't enough, the scruffy beard on his chin also contributed to Reed's initial confusion. His deep, black eyes held a calm and pure serenity to them, as if they had been trained to see the past the filth of the world.

Had it not been for the fact that Astor and Ophelia were present, Reed would have never made the connection as to who the brooding man in black could have been...    

The fluctuations coming off of Horatio seemed to suggest that he was probably on the verge of being able to attempt what was impossible for contenders. He was well on his way towards crossing over and become a conqueror. One could only imagine the herculean efforts the young man must have made to have been rewarded by the Will of the World so excessively.

It was borderline outrageous though, to be honest. Even Violett, who was considered among the brightest and fastest of her generation, had spent the better part of eighty years in order to be awarded enough of blessings to make the leap from contender to a conqueror.

Yet here was Horatio who was already approaching the verge of crossing over to the other side. There was something wrong here. It was the with Astor and Ophelia as well -- they were way out of line for what was expected of relatively fresh contenders such as them.

It was to be expected. Last time they met, everyone had been in the midst of their adolescence. It was only normal for growing children to sprout into who they were meant to become. Nearly three years had passed since their final meeting, but even so, Reed had been blown away by how all three had changed.

In truth, the trio felt the same way about Reed and Lu'um. They looked nothing like their former selves, either. Not a single bit.

Lu'um had become something that was for the lack of a better word -- otherwordly. Her preternatural beauty was so powerful that it had even momentarily enraptured Horatio, who possessed the strongest willpower of the three until he used an Anima technique to break free of the horrifying charm Lu'um had developed. The most ominous thing about her was the fact that they couldn't detect a single Anima fluctuation off of her. It was a chilling reminder of her insane skill with Anima and what was she likely capable of...

As for Reed himself? In the old days, Astor and Horatio would often tease Reed for his shorter-than-average stature in jest, but now things had changed. The once malnourished boy from the slums now towered over them to such an extent that they, for the first time, had been forced to look up at him instead. Reed was so tall that they almost couldn't believe it was him.

To put things into perspective, the old Avunian king beside Reed stood somewhere at two and a half meters in height and this was not a normal thing. It was because Velvund was a genuine High-Alf himself, one of the original highborne children of the original race all modern Avunians were descended from. The average Avunian only stood at around two meters in comparison to their former king.

Although Reed was not all tall as Velvund, he had clearly grown beyond what was considered normal by humanity. He stood at around the lower part of Velvund's shoulders in height, easily over two meters in height with plenty of change to spare. Lu'um, too, had experienced the same growth, but not as dramatically as Reed. She was a bit shorter than Reed, though it was out of the norm, even for extremes a human female could grow...

It genuinely begged an important question. Were these two even humans? They couldn't spot any Alf-ears on them or any other distinguishing characteristics that might separate them from humanity, though. Were they Half-Alf or were they just genetic anomalies? Even with the blessings of an Alma, they should have not grown this much during their adolescence.

His light-brown eyes had a mysterious glimmer about them that made them seem like jewels. The longer you gaze into them, the harder it was to tear yourself away. It was in many ways, a charm-like effect much akin to what Lu'um naturally possessed, although weaker.

Something had definitely happened to these two, the trio suspected in their hearts.

Reed dumbly observed the three of them until Astor walked over to Reed and said, "...Been a while hasn't, buddy?" He hugged Reed and patted his back like he always used to...

Horatio and Ophelia followed in Astor's footsteps and warmly greeted Reed and Lu'um. It was a joyous moment for everyone involved.

The Council of Sages, as wayward as they might have been, had finally reunited.

While there was much everyone wanted to talk about, there was a more pressing matter at hand. The fissure at Itroch had to be closed by the end of the day, no matter what. The world itself was already on a final countdown, therefore no one in the conference room wasted any more breath on anything unnecessary to their mission.

It was time to get down to business.
-----------------------------------------
-----------------------------------------
-----------------------------------------
-----------------------------------------
  ''';
}
