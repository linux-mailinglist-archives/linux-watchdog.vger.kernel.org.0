Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D0327F00
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 May 2019 16:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730843AbfEWOCk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 23 May 2019 10:02:40 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:33989 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730323AbfEWOCk (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 23 May 2019 10:02:40 -0400
Received: by mail-yb1-f194.google.com with SMTP id v78so2319570ybv.1;
        Thu, 23 May 2019 07:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sqmYovtDH2Cha2ixUIjp55v47f+tfN+Y/9nD/H0oaXU=;
        b=S0WIOvfhxfwfAv7ibPxBjD1HBQmHhdi/cM0k2xwZ5e8ECTMVUNqunHYdnAhuKwbDjN
         Xu8BiJho9SPuTk4wu04jroQpaoDnl0YqNbEBdkaBe0laaCkOz5PxNJYrP4byiu9iu+Ni
         eV4lSa657lsml6+XQgvFORwIB0LQsbP42cOpgFiECUEFMVbmejiHv41dxvs0CX90H/zU
         eO/mQkOQphWmY9HEo7Bhr0TaEcA4QYzakZtp2LXeixe/zuJ9XD/QjJrLOVSYQGCPuHv6
         dIknKspngjhSiFsIIKxxDn6P2LsfxGt8rRbCGnUedOOG7Y5tW1z4iLSqn1Ik8Fr5CK/9
         SiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sqmYovtDH2Cha2ixUIjp55v47f+tfN+Y/9nD/H0oaXU=;
        b=FM2P4M8e1PAahJdGlYeyKtF0lacsyWsmdRMgRPY6dtsr7hhbMg7+oUk4z8B5yjgJeL
         5XMrO+xK5qxwu2w9N4saWItPJ2StW60capq3MBk+xCEx7+mVwxid/wJ+06P/b6Hu8VN7
         ZHK+hgav1d8AZ29hTxcOwEY5MPFV0je6YXVcDo67DEhO8C21uYmRmG4l8TrkdB0Wj0ey
         HOd8O4kA4F5yckfSvOiCXm4DBbpPXjQwaosxC8EPGXIilLwGGM/zckfGjX/XC4b73bmE
         MawLdOm7HIyxun1C5gqQj8CutNx+YddZmskGsH4oPGecEZWc08/zWFKatlK5KOBR0Ony
         g3RA==
X-Gm-Message-State: APjAAAWpUszFfhl+CzyoIgT7Fn0O8OH7kmHJDjlkC39kaIFnX7RZdJcG
        7mvA4tpgait4j1a+BFxqIkLlJBZl9M/etCXcrMc=
X-Google-Smtp-Source: APXvYqxgIVauTGVCqLlR4n4GbP/KO2TXbfyg5FKYwg7m799qm8qa/AQBMYaFifalBrQB2p3zYAor1U7RqgV1eyk1QRs=
X-Received: by 2002:a25:340e:: with SMTP id b14mr4677744yba.82.1558620159194;
 Thu, 23 May 2019 07:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190521160330.28402-1-peron.clem@gmail.com> <20190521160330.28402-4-peron.clem@gmail.com>
 <20190522103243.mmrfato5p2mhtf4j@flea> <CAJiuCcdaZVLQyupEf8HPaUySakufXXAhzundo6VeyQaAyZ8Trw@mail.gmail.com>
 <20190523125716.g4euwplfsvw4vqzl@flea>
In-Reply-To: <20190523125716.g4euwplfsvw4vqzl@flea>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Thu, 23 May 2019 16:02:28 +0200
Message-ID: <CAJiuCcdE-RtiGpPKe-BMJpS-m=wOXy+30vS7iAvd6Ng7gaZWNg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: add Allwinner H6 r_watchdog
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

On Thu, 23 May 2019 at 14:57, Maxime Ripard <maxime.ripard@bootlin.com> wro=
te:
>
> On Wed, May 22, 2019 at 06:15:26PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Maxime,
> >
> > On Wed, 22 May 2019 at 12:32, Maxime Ripard <maxime.ripard@bootlin.com>=
 wrote:
> > >
> > > On Tue, May 21, 2019 at 06:03:28PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > Allwinner H6 has a second watchdog on the r-blocks which is
> > > > compatible with the A31.
> > > >
> > > > This commit add the H6 compatible for the r_watchdog.
> > > >
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > >
> > > Unless you have some evidence that the two blocks are different, then
> > > you should just reuse the same one.
> >
> > I have no evidence it's different nor identical, it's not documented
> > in the user manual.
> > I thought it would better to have separate bindings in case there is a
> > difference.
> > Than don't have and find later that we have to introduce one.
>
> It's a tradeoff. Pushing your logic to the limit, we would have a
> compatible for each controller embedded in an SoC.
>
> This would be unmaintainable, and slightly useless since that case is
> very unlikely.
>
> However, having differences between SoCs is quite common, hence why we
> have different compatibles for each SoC.
Yes, that make sense, I will send a new version soon,

Thanks for the review,
Cl=C3=A9ment

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
