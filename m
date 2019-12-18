Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5516312537E
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2019 21:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfLRUeG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 18 Dec 2019 15:34:06 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41045 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfLRUeG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 18 Dec 2019 15:34:06 -0500
Received: by mail-ot1-f68.google.com with SMTP id r27so4016835otc.8;
        Wed, 18 Dec 2019 12:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=F/E8A+1Ejaf5X51OroqwzDdI/kh4qPtQG6sI+b5/ucQ=;
        b=KHbDT4LHG4gq95Lt0Sh8FSMcyNBcflMbuFfblWwGfM1bSBG0cOrXvIuPjErT5JAw27
         GMw1/0H38n6Db5806e5ZZNroZor0lSd/tXF+bX07k+s0mIsWqyrnkfloO7Q3ViE341PL
         /hqgS4Z3Pm45po/sG7M6LDDfYAvLpz0oFOzt0Qgn3DJ2N5ByFBPi26TPR+qpoVGiMzXu
         FTRQb1K9h4NTI5JdwUoyQWhojGCO5GOhj9j+DojkCOuLMzZ8PDBMXOUkyaIsBOS5d/GO
         BVNI3BF7urvXuY0HsfICLbclQthukawenb8ptq4KSzsxSEnGGVxywLbQ5Rva/oWTd/JY
         Lc+g==
X-Gm-Message-State: APjAAAXfu0rYvBYQvFUIerOvS8o1hAPpoWWHtIXAxsnKJBQA466GZi0I
        iiLyrJ4MwI02U6ivkvhk7g==
X-Google-Smtp-Source: APXvYqzuX/bUGktSf48gje5dDS5VMPiozApAjRV8yxUKvFqiGyVOtl2EyZFUSO8wCq3HcPH4iRrETw==
X-Received: by 2002:a9d:7a8a:: with SMTP id l10mr4794909otn.309.1576701245408;
        Wed, 18 Dec 2019 12:34:05 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m2sm1164119oim.13.2019.12.18.12.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 12:34:04 -0800 (PST)
Date:   Wed, 18 Dec 2019 14:34:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Xingyu Chen <xingyu.chen@amlogic.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
Message-ID: <20191218203404.GA2451@bogus>
References: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
 <1576153187-28378-3-git-send-email-xingyu.chen@amlogic.com>
 <CAFBinCBHLqgPExPsVaSWdSOr0Oj-jeYa4Z82U-pJ=fS+D1wGnA@mail.gmail.com>
 <f7b0afe7-e317-2422-de7e-878837f9f238@amlogic.com>
 <a8f5ab1d-264c-5b2c-e72b-3774b9f44c22@roeck-us.net>
 <1da513d7-20e1-726a-dcc4-952cbfbbe63a@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1da513d7-20e1-726a-dcc4-952cbfbbe63a@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Dec 18, 2019 at 03:37:49PM +0800, Xingyu Chen wrote:
> Hi, Guenter Martin
> 
> On 2019/12/16 21:30, Guenter Roeck wrote:
> > On 12/15/19 10:03 PM, Xingyu Chen wrote:
> > > Hi, Martin
> > > 
> > > Sorry for the late reply.
> > > 
> > > On 2019/12/13 4:05, Martin Blumenstingl wrote:
> > > > Hi Xingyu and Rob,
> > > > 
> > > > On Thu, Dec 12, 2019 at 1:20 PM Xingyu Chen
> > > > <xingyu.chen@amlogic.com> wrote:
> > > > [...]
> > > > > +examples:
> > > > > +  - |
> > > > > +    watchdog {
> > > > > +          compatible = "amlogic,meson-sec-wdt";
> > > > > +          timeout-sec = <60>;
> > > > > +    };
> > > > in v3 of this patch Rob commented that there shouldn't be an OF node
> > > > if there are no additional properties
> > > > with timeout-sec there's now an additional property so my
> > > > understanding is that it's fine to have an OF node
> > > Your understanding is correct.
> > > > 
> > > > what I don't understand yet is where this node should be placed.
> > > > is it supposed to be a child node of the secure monitor node (for
> > > > which we already have a binding here:
> > > > Documentation/devicetree/bindings/firmware/meson/meson_sm.txt) or
> > > > where else would we place it inside the .dts?
> > > IMO,  Although the watchdog node need to reference the meson_sm
> > > node, there is no
> > > bus-like dependencies between the devices which the two nodes
> > > corresponding to.
> > > so i think that the watchdog node as child node of meson_sm maybe
> > > not appropriate.
> > 
> > The watchdog driver needs the meson SM's dt node, and it depends on the
> > existence
> > of that node. That seems enough of a relationship to warrant having it
> > as child note.
> Thanks for your reply, if i take the wdt node as child of secure monitor
> (sm), how should
> i register or find the wdt device ?
> 
> I only think of the following three methods :
> 1). update the sm driver，and scan&register wdt device when the sm driver
> probes(It is like i2c), but there
> are too many changes involved.

Just add of_platform_default_populate() call and clean-up calls. That's 
not what I'd call 'too many changes'.

 
> 2). add "simple-bus" key string to compatible of sm node, and it will make
> the child node is registered as
> platform device, but it seems that the key string is not match current
> scene.

You previously said it's not a bus...

> 
> secure-monitor {
>     compatible = "amlogic,meson-gxbb-sm",  "simple-bus";
> 
>     watchdog {
>         compatible = "amlogic,meson-sec-wdt";
>         timeout-sec = <60>;
>     }
> }
> 
> 3).  don't register device, and find directly the watchdog node by using the
> of_* API in watchdog
> driver (Eg: linux-4.x/drivers/tee/optee/core.c)
> 
> secure-monitor {
>     compatible = "amlogic,meson-gxbb-sm";
> 
>     watchdog {
>         compatible = "amlogic,meson-sec-wdt";
>         timeout-sec = <60>;
>     }
> }
> 
> The method 3 looks better for me, do you have a better suggestion ? Thanks
> 
> BR
> > 
> > Guenter
> > 
> > .
> > 
