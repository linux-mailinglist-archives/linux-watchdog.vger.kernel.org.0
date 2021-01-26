Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F453036E3
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jan 2021 07:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389281AbhAZG4x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Jan 2021 01:56:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:34846 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389275AbhAZG4b (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Jan 2021 01:56:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 4EDD3AE91;
        Tue, 26 Jan 2021 06:55:49 +0000 (UTC)
Date:   Tue, 26 Jan 2021 07:55:47 +0100
Message-ID: <s5hbldc2nm4.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pau Oliva Fora <pof@eslack.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Hannes Reinecke <hare@suse.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Finn Thain <fthain@telegraphics.com.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/3] isa: Make the remove callback for isa drivers return void
In-Reply-To: <20210122092449.426097-1-uwe@kleine-koenig.org>
References: <20210122092449.426097-1-uwe@kleine-koenig.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 22 Jan 2021 10:24:46 +0100,
Uwe Kleine-König wrote:
> 
> Hello,
> 
> changes since v1
> (https://lore.kernel.org/r/20210121204812.402589-1-uwe@kleine-koenig.org):
>  - fix build failure, found by the kernel test robot
>    (my grep missed the struct isa_driver embedded in struct
>    radio_isa_driver). For this I introduced patch 2 and adapted patch 3
>    a bit. An interdiff is below.
>  - Added Acks/Reviews by Guenter Roeck, William Breathitt Gray, Marc
>    Kleine-Budde, Wolfram Sang and Takashi Iwai <tiwai@suse.de>
> 
> The base-commit I specified (by hand *sigh*) in v1 was broken, must be a
> cut-n-paste-error, sorry for that.
> 
> Takashi suggested to take this series via sound.git given that this is
> the most affected tree. This is fine for me. Otherwise I can also
> provide an immutable branch. For both variants we still need a few acks
> though.

Now I applied all three patches to my sound.git tree.
It's found in isa-void-remove-callback signed tag, in case anyone else
wants to merge in.  The branch is based on 5.11-rc4.

git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/isa-void-remove-callback


thanks,

Takashi
