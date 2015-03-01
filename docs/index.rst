Wand
====

Wand is a :mod:`ctypes`-based simple ImageMagick_ binding for Python. ::

    from wand.image import Image
    from wand.display import display

    with Image(filename='mona-lisa.png') as img:
        print(img.size)
        for r in 1, 2, 3:
            with img.clone() as i:
                i.resize(int(i.width * r * 0.25), int(i.height * r * 0.25))
                i.rotate(90 * r)
                i.save(filename='mona-lisa-{0}.png'.format(r))
                display(i)

User's guide
------------

.. toctree::
   :maxdepth: 2

   whatsnew/0.4
   guide/install
   guide/read
   guide/write
   guide/resizecrop
   guide/transform
   guide/draw
   guide/colorspace
   guide/exif
   guide/sequence
   guide/resource
   test
   roadmap
   changes
   talks


References
----------

.. toctree::
   :maxdepth: 2

   wand


Indices and tables
------------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`


Troubleshooting
---------------

Mailing list
''''''''''''

Wand has the list for users.  If you want to subscribe the list, just send a
mail to:

    wand@librelist.com

The `list archive`_ provided by Librelist_ is synchronized every hour.

.. _list archive: http://librelist.com/browser/wand/
.. _Librelist: http://librelist.com/


Stack Overflow
''''''''''''''

There's a Stack Overflow tag for Wand:

http://stackoverflow.com/questions/tagged/wand

Freely ask questions about Wand including troubleshooting.  Thanks for
sindikat_'s contribution.

.. _sindikat: http://stackoverflow.com/users/596361/sindikat


Quora
'''''

There's a Quora topic for Wand: `Wand (ImageMagick binding)`__.  Be free
to add questions to the topic, though it's suitable for higher-level questions
rather than troubleshooting.

__ https://www.quora.com/Wand-ImageMagick-binding


Open source
-----------

Wand is an open source software written by `Hong Minhee`_ (initially written
for StyleShare_).  See also the complete list of contributors_ as well.
The source code is distributed under `MIT license`_ and you can find it at
`GitHub repository`_. Check out now:

.. sourcecode:: bash

   $ git clone git://github.com/dahlia/wand.git

If you find a bug, please notify to `our issue tracker`_. Pull requests
are always welcome!

We discuss about Wand's development on IRC.  Come #wand channel on
freenode network.

Check out :doc:`changes` also.

.. _Hong Minhee: http://hongminhee.org/
.. _StyleShare: https://stylesha.re/
.. _contributors: https://github.com/dahlia/wand/graphs/contributors
.. _MIT license: http://minhee.mit-license.org/
.. _GitHub repository: https://github.com/dahlia/wand
.. _our issue tracker: https://github.com/dahlia/wand/issues

