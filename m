Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7044F133E4B
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Jan 2020 10:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbgAHJ0A (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Jan 2020 04:26:00 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39387 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgAHJZ7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Jan 2020 04:25:59 -0500
Received: by mail-qk1-f196.google.com with SMTP id c16so2012772qko.6
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Jan 2020 01:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9itra/1hP66y5Vh1A/apsI7vVNMDV9CQI60fYE2iNo=;
        b=mWqduuy/+k1H4CJ3RmxwE369OYZjbQ91El877rL/H+x8wlktANqK8kcC4voHl2Sj9F
         BWPxcXnJgz1F9WIFJwkli10BS+NHOKcP6tM0yyKGvdBw2htSyoe13BdbGf7XPQMCdUhk
         KKAC3xbCwpVV74ByShIV2AhcfQ7oHmaS+egzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9itra/1hP66y5Vh1A/apsI7vVNMDV9CQI60fYE2iNo=;
        b=bSvirEp6nxy1T4/ZecJFjMU9J6Wz1Yqao7geU+JRR+HGC6tSRC9fUhhMZ0QIsGQehk
         c1Gr8VMB/4/lC4mivv8LgLlLzufBkKfodPQnuOD8sYh2KWUVKS0gdPTpIlUK04Nq5OeZ
         SguEFhGheGCKAxB5t1ToBnX5pocYgH8cKO14JBXq/Er3ywRwkoXs9Q8adTC2ylItPX5i
         s+8lIYBYWPJSgRmZa39JeNvCoO8eOTrxzY2wZPm58Va7Rs08FUdCqWYS0NO857D7x9Me
         U7dYMbOLho9gJzeDIWNaPWwW8kJ14R/LhijpW4zkJOVeLrmH3pcZ/CATtVqNitJ2Dyvs
         1/cg==
X-Gm-Message-State: APjAAAV2N5zBEjHbVFdh2ZNKU3E7g+DfEaNFWIs4yelz0hpFX2B6v6vE
        VfvrC4IBShFXjP32sFB5vFDRWMp51Zm+w3y7vbUh6w==
X-Google-Smtp-Source: APXvYqxUSfxCpOfPQeb5k2dIYC6xmY0+WG2Ufqb4kkw22kn9ZUvrNzcvtQ2APhviNZ1LTVVT4U0dZLh1RLVsQUCsLdo=
X-Received: by 2002:a37:6551:: with SMTP id z78mr3581807qkb.144.1578475558723;
 Wed, 08 Jan 2020 01:25:58 -0800 (PST)
MIME-Version: 1.0
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com> <1578280296-18946-3-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1578280296-18946-3-git-send-email-jiaxin.yu@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Wed, 8 Jan 2020 17:25:48 +0800
Message-ID: <CANMq1KD3n5r1ACy2acKgXTfTLHMsONzT-NscL=AoY1Jr-eqdww@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] watchdog: mtk_wdt: mt8183: Add reset controller
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     Yong Liang <yong.liang@mediatek.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        Stephen Boyd <sboyd@kernel.org>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jan 6, 2020 at 11:11 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add reset controller API in watchdog driver.
> Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.

You add support for reset controller on both 8183 and 2712, do you
want to say that in the commit title and message?

>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/watchdog/mtk_wdt.c | 105 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
