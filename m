Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F18623B59
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 16:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731245AbfETO5W convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 10:57:22 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46424 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730351AbfETO5V (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 10:57:21 -0400
Received: by mail-ed1-f66.google.com with SMTP id f37so24258152edb.13;
        Mon, 20 May 2019 07:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+tTKrGaZbZAWn5dajRxbdafRjHqzlUJiRVVSR6xwRss=;
        b=dAP55o4sap/ep1EL2VRkswg8vqjB94gaDu6x4YlfB0lVTEq28FYy5+7U7Il8+nttW3
         KjnDwDZPzU+MNZAZ0bvkL7buMlZCcsT/F0uTytmwjm+GB6spN5869OeZI7UyaTO9wJZH
         SsL+yotjsb15EIenBv6upKRapq7G9o07APH2ebO4wf4coK15jmdJ00hcVns7TX2f1hSF
         sGndOPiRluN2E8lDLrkB0JgeXKs8LCS1jTZX+rTORzgrCqvIbwH16R8p9gWcNoBgD6jQ
         ScKOSghsdo+LdOjJBOaY1PstAXD0lypl4KSiNM36lgya3waVTzabAt4EOdyvsEzlK+hv
         ozoQ==
X-Gm-Message-State: APjAAAVvlEiaOW40EyDIYdOE48j4xyXGnZh1VkWLkFnxc5gbqXGDrBDc
        NdvimJp3ZGCnXT+6KqZ0CYE172/g5WQ=
X-Google-Smtp-Source: APXvYqwYUltTtgEaV/LPP1or7X7oyVvUT72UbUlSiW5yHKeCauyoECqqWOVIjNg8uYwe3UGiQR55cw==
X-Received: by 2002:a50:9056:: with SMTP id z22mr76319431edz.72.1558364239098;
        Mon, 20 May 2019 07:57:19 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id hb11sm3161651ejb.43.2019.05.20.07.57.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 07:57:17 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 198so13641380wme.3;
        Mon, 20 May 2019 07:57:16 -0700 (PDT)
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr12164236wmd.43.1558364236763;
 Mon, 20 May 2019 07:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190518152355.11134-1-peron.clem@gmail.com> <20190518152355.11134-3-peron.clem@gmail.com>
 <20190520073652.itk452vrpnicta5v@flea> <CAJiuCceEL9xH45P6Gj99YTir_1tkyraf5HefDNfm9p+UtdLs8w@mail.gmail.com>
 <20190520144404.zprbuqt3d7uuxgr2@flea>
In-Reply-To: <20190520144404.zprbuqt3d7uuxgr2@flea>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 20 May 2019 22:57:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65P1tne+-FuJ-tLTRMaPdBPYd9eJS+rS5TXaAULNCLBZg@mail.gmail.com>
Message-ID: <CAGb2v65P1tne+-FuJ-tLTRMaPdBPYd9eJS+rS5TXaAULNCLBZg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: h6: add watchdog node
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 20, 2019 at 10:44 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Mon, May 20, 2019 at 10:21:40AM +0200, Clément Péron wrote:
> > Hi,
> >
> > On Mon, 20 May 2019 at 09:36, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Sat, May 18, 2019 at 05:23:53PM +0200, Clément Péron wrote:
> > > > Allwinner H6 has a watchog node which seems broken
> > > > on some boards.
> > > >
> > > > Test has been performed on several boards.
> > > >
> > > > Chen-Yu Tsai boards:
> > > > Pine H64 - H6448BA 7782 => OK
> > > > OrangePi Lite 2 - H8068BA 61C2 => KO
> > > >
> > > > Martin Ayotte boards:
> > > > Pine H64 - H8069BA 6892 => OK
> > > > OrangePi 3 - HA047BA 69W2 => KO
> > > > OrangePi One Plus - H7310BA 6842 => KO
> > > > OrangePi Lite2 - H6448BA 6662 => KO
> > > >
> > > > Clément Péron board:
> > > > Beelink GS1 - H7309BA 6842 => KO
> > > >
> > > > As it seems not fixable for now, declare the node
> > > > but leave it disable with a comment.
> > > >
> > > > Signed-off-by: Clément Péron <peron.clem@gmail.com>
> > >
> > > If it doesn't work most boards, then why do we need to merge that
> > > patch in the first place?
> >
> > My personnal opinion, is that having the IP declared and disabled with
> > a comment saying "it's broken on some boards" in the device-tree is
> > better than not having at all.
> >
> > This will explicit say "the IP exist but don't use it!".
> > Maybe some people with a functionnal board would like to explicitly
> > use it on their dts.
>
> Yeah, that makes sense. Chen-Yu, any opinion on the matter?

Works for me.
