Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC13280252
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Oct 2020 17:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732498AbgJAPQm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 1 Oct 2020 11:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732361AbgJAPQm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 1 Oct 2020 11:16:42 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7050C0613D0;
        Thu,  1 Oct 2020 08:16:41 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id i17so5930811oig.10;
        Thu, 01 Oct 2020 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Xfo+wi8t+ry7BWDgiqCTQIEDykykW+Wdj6olsxhBuHM=;
        b=DUkMQOvwX9tEFpayXGRxRPn++TYJ9jiz9fwz/633eCw9tR3sQKE4FKsR/jzjr+s/YX
         g0o1fbnY3WutEp3eHUWQo3YPoGazs1ktGnBmH2R4qIgqJEKQbgESECy7F88ZPX/4+DL1
         HAIa9j9AL0e6zNXnGhymwc5s4KQ+OfvYt5S8pDmX4yzTNd24aFHBi3ny3Gq/o9rQ2Xcw
         0d6/ITBVFV8pcaKkFqbH8KOZK1oXOTn7A/nevTUZKb5RpvHnVOlWK0rFUCq5kIb/Sa8P
         IJQkDT1fRXEwv1M1FPnuBWqGh6bLKfPDwM5tLUvFALeJLdYy6yDhuf251DtZ0lWrptXL
         qC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xfo+wi8t+ry7BWDgiqCTQIEDykykW+Wdj6olsxhBuHM=;
        b=CzSh+cKJIhx+xHtas89Qos4+CakZd0r7WiKWRvQt+ajWxpHOsFddu3F6Mug7pZV8Ks
         QpXnjCaqk93YHsvnUuKwHF/Okk3AXjhJoWbu7U3SXCZZAAvjn225a1cTINeRt9zKV8T+
         dBiGBaFw96sjY+ssUnckpt23Sh344erD853WZv+Td5CaRUTGg5A3txmFJLuOuKKFk5zG
         7AfSNLhMKXdWl46Z76Qqf0+fUXZMCE2lMTOwKZUEOp1BDl30lQtyQ8+yjpxU5NGIjTm3
         y3Q4SvrumorP7jF+5Rziv0AXfUkTGJzckF4zqxcu2RuSCsg8z80k/bpWznko8xvttuk7
         1Qtg==
X-Gm-Message-State: AOAM531MDsLIju0nkLqWS9erjNhgFGopEkEknzj6j7fy0hUdLZW7E8Cl
        OdjeMu1E1HwjN5mqBoLAXLA=
X-Google-Smtp-Source: ABdhPJzNY7ZqiaCZjpk22anICOz/42ohUgqmMs/7vgXX1GSTHq9VQpTOE4Uio9zydoJgs6seiTebtw==
X-Received: by 2002:aca:4142:: with SMTP id o63mr257451oia.167.1601565401239;
        Thu, 01 Oct 2020 08:16:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 34sm1250405otg.23.2020.10.01.08.16.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 08:16:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 1 Oct 2020 08:16:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
Message-ID: <20201001151639.GC64648@roeck-us.net>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Oct 01, 2020 at 04:23:02PM +0200, Matthias Brugger wrote:
> Hi Crystal,
> 
> It seems you forgot to send the email to one of the maintainers, Wim.
> Please make sure you add all the maintainers from get_maintainers.pl when
> you send a series.
> 
> Regards,
> Matthias
> 
> On 29/09/2020 05:20, Crystal Guo wrote:
> > v5 changes:
> > fix typos on:
> > https://patchwork.kernel.org/patch/11697493/
> > 
> > v4 changes:
> > revise commit messages.
> > 
> > v3 changes:
> > https://patchwork.kernel.org/patch/11692731/
> > https://patchwork.kernel.org/patch/11692767/
> > https://patchwork.kernel.org/patch/11692729/
> > https://patchwork.kernel.org/patch/11692771/
> > https://patchwork.kernel.org/patch/11692733/

This is less than helpful. It doesn't tell me anything. It expects me to 
go back to the earlier versions, download them, and run a diff, to figure
out what changed. That means the patch or patch series ends at the bottom
of my pile of patches to review. Which, as it happens, is quite deep.

I will review this and similar patches without change log after (and only
after) I have reviewed all other patches in my queue.

Guenter

> > 
> > Crystal Guo (4):
> >    dt-binding: mediatek: watchdog: fix the description of compatible
> >    dt-binding: mediatek: mt8192: update mtk-wdt document
> >    dt-binding: mt8192: add toprgu reset-controller head file
> >    watchdog: mt8192: add wdt support
> > 
> >   .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
> >   drivers/watchdog/mtk_wdt.c                         |  6 +++++
> >   .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
> >   3 files changed, 39 insertions(+), 2 deletions(-)
> >   create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
> > 
