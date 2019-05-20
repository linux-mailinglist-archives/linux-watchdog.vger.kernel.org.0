Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E62222E4D
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 10:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfETIVx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 04:21:53 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:43363 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfETIVx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 04:21:53 -0400
Received: by mail-yw1-f68.google.com with SMTP id t5so5513022ywf.10;
        Mon, 20 May 2019 01:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6qhO6B8/Z9D9GEePABEHToMQA2Zs+IWYeC8mEzi25YY=;
        b=R5Z+RjbqwZV78P9ToAX8cdQxWCGGQYpG1b6umNEBYkosWgExwZSU1q71Zp4WbGmGoc
         op/1g+RlSnWhVDVr7/H45rTEmKBCB4wb688alowDLxBL6pV0XbRjLU5Gi0BBFccrvmuC
         Ec1i+bsCKfe4Jteg4849yH84Lki5NlCEColC4Uzgr5WhH+nycTgaEI+nX2cHyWddzsQD
         Ah42AhDZoAVxhulQEcfV5SywwNSXTT2ZWi0y+ciBePITT9EpBXPKtYwiolfHgVgnAOtY
         ElcQ2Lke+RZepMdrTWaQJ1sKMR0IW4Kp9HSZYG0YbaY/IR1g+Qw6Ji1ngvrX8u6KIBlW
         Obhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6qhO6B8/Z9D9GEePABEHToMQA2Zs+IWYeC8mEzi25YY=;
        b=MF0TauXYXnZ7rru9kywuNuX7ShJye0MQ5zq+U1mwNAvVgurnU9ZcG/M/0lsBU28EKp
         NFn5AN2J1O6zlMLpJMbrOQCx0hZcnvEUg4qukJWqx2ZjeFvgq83avTLrKjG9eu7EKjUW
         6OCyFfqlyrnEKRUVkVwDX+7p7pIPAtm7xLHkB3kY+txbkOQwRu/k4fhoPA9GlXKAEaih
         RQ055wYFNwUUDF7VcTJyq73pRZwGU7xmVdy1RzlC+knuBIzxMcTbYKd4cn5GVZ/XdeHS
         vb3xbtnv18RiQNIybf2vbJU2/YVwKOCkFFYYO51cUMWA7mjkyJuS6nJTxmIb0M1QHjg1
         883A==
X-Gm-Message-State: APjAAAWz/rmjwNdi2TwL0wUXDyAI2RLzl7Fqjh505nddKQHgXep+Kj9G
        waKggtBYWgtXWQxYJFUH+amoKY6jHU5TTXJ5DBTNeVoF
X-Google-Smtp-Source: APXvYqxTV7Y4TX39GVp8m3uUIqRHuAd4Xg7evnIjykjVPrMlj+RftBbiQ1AZDp3Zzok2g/gdO2GsZt9sT8nrTtl+3xE=
X-Received: by 2002:a81:59c2:: with SMTP id n185mr33786741ywb.21.1558340511959;
 Mon, 20 May 2019 01:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190518152355.11134-1-peron.clem@gmail.com> <20190518152355.11134-3-peron.clem@gmail.com>
 <20190520073652.itk452vrpnicta5v@flea>
In-Reply-To: <20190520073652.itk452vrpnicta5v@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 20 May 2019 10:21:40 +0200
Message-ID: <CAJiuCceEL9xH45P6Gj99YTir_1tkyraf5HefDNfm9p+UtdLs8w@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: h6: add watchdog node
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Mon, 20 May 2019 at 09:36, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Sat, May 18, 2019 at 05:23:53PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Allwinner H6 has a watchog node which seems broken
> > on some boards.
> >
> > Test has been performed on several boards.
> >
> > Chen-Yu Tsai boards:
> > Pine H64 - H6448BA 7782 =3D> OK
> > OrangePi Lite 2 - H8068BA 61C2 =3D> KO
> >
> > Martin Ayotte boards:
> > Pine H64 - H8069BA 6892 =3D> OK
> > OrangePi 3 - HA047BA 69W2 =3D> KO
> > OrangePi One Plus - H7310BA 6842 =3D> KO
> > OrangePi Lite2 - H6448BA 6662 =3D> KO
> >
> > Cl=C3=A9ment P=C3=A9ron board:
> > Beelink GS1 - H7309BA 6842 =3D> KO
> >
> > As it seems not fixable for now, declare the node
> > but leave it disable with a comment.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> If it doesn't work most boards, then why do we need to merge that
> patch in the first place?

My personnal opinion, is that having the IP declared and disabled with
a comment saying "it's broken on some boards" in the device-tree is
better than not having at all.

This will explicit say "the IP exist but don't use it!".
Maybe some people with a functionnal board would like to explicitly
use it on their dts.

Again just my personnal opinion,
Thanks for the review,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
