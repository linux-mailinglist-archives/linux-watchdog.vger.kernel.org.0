Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC4C1657E5
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2020 07:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgBTGlj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Feb 2020 01:41:39 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33076 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgBTGlj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Feb 2020 01:41:39 -0500
Received: by mail-vs1-f68.google.com with SMTP id n27so2031975vsa.0
        for <linux-watchdog@vger.kernel.org>; Wed, 19 Feb 2020 22:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FII6SdDOT5LM0XD58UCmM9UhU3FnY2YeLrE2lk53Is=;
        b=k5J7L+u1jOqu5YUkSY9+Wm+SZ9fEd0plNX6vVCCQMNxtJ17xPFpHlzurSPf923XUx5
         fGd8FKC/yCneBjJp84L4iNCbiXagGjaBqqevwWiGJTr6ZgEhG51rY5aoA+f0Upr+DuoI
         aK9EFDfSdNNI3IUdXgtYEmwjegBCvffppiAHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FII6SdDOT5LM0XD58UCmM9UhU3FnY2YeLrE2lk53Is=;
        b=dTWgDdpcMW7dmVLXCTVwQBiGKly4Df6ppoyX2lZyKCyNdi8zKkO2+YWtSRMMqvofnV
         zDEUM1mcml3wHipjaLI2DttGTT+eixnP5x48jshOhogBWTN4CoTWLxmwOoW8sVBcoAN5
         3GKwAIgsCIlXCQtwNs2DvJhL8DjMmJNLrUMjX1EMZo5Y1Vlv/W07jcQlnotgYPGY+BJ5
         uVwmgqxBCLKoUkLZd+QfdbFS8kTgkWkPl1KdJM/4kdL0yJRTvWMFb1jhbTHCDCcZh6H4
         qhD78pXeJLXOs4uCV3dVlNpPg8EOtQ93DACmpc7PuZt/roI3rybGIOY8yi6kbMpoMw0D
         ZhWQ==
X-Gm-Message-State: APjAAAWnUR7CWMoRLeR2u/P2BKX+R+b6KoXWI1lXyguUXq8fMoCR1UGC
        kU8JUJv/QkfVOSTAmS/N75o4m5eGwNU=
X-Google-Smtp-Source: APXvYqzBZvcR4VJBoJluvhYLgSchKbv91M4YZRmTLh7077YpHgWAlTGEhXXRAl/CVEYjauqGQeiL/g==
X-Received: by 2002:a67:f758:: with SMTP id w24mr16282013vso.5.1582180898032;
        Wed, 19 Feb 2020 22:41:38 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id v21sm570642vkd.54.2020.02.19.22.41.36
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 22:41:36 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id p6so1984500vsj.11
        for <linux-watchdog@vger.kernel.org>; Wed, 19 Feb 2020 22:41:36 -0800 (PST)
X-Received: by 2002:a67:f541:: with SMTP id z1mr15813130vsn.70.1582180895674;
 Wed, 19 Feb 2020 22:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus> <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
In-Reply-To: <20200219232005.GA9737@roeck-us.net>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Thu, 20 Feb 2020 17:41:09 +1100
X-Gmail-Original-Message-ID: <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
Message-ID: <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
To:     xingyu.chen@amlogic.com
Cc:     Julius Werner <jwerner@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Dear Xingyu,

Could this driver also cover your usecase? I am not familiar with
meson, but it seems like the meson calls could
be replaced with arm_smccc calls. Then this driver will cover both
chips. I am not sure if your firmware is upstream
somewhere, but this might be adapted;
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405

Thanks


On Thu, Feb 20, 2020 at 10:20 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Feb 19, 2020 at 03:04:54PM -0800, Julius Werner wrote:
> > > You are not the first 'watchdog in firmware accessed via an SMC call'.
> > > Is there some more detail about what implementation this is? Part of
> > > TF-A? Defined by some spec (I can dream)?
> >
> > This is just some random implementation written by me because we
> > needed one. I would like it to be the new generic implementation, but
> > it sounds like people here prefer the naming to be MediaTek specific
> > (at least for now). The other SMC watchdog we're aware of is
> > imx_sc_wdt but unfortunately that seems to hardcode platform-specific
>
> There is one more pending, for Meson SMC.
>
> https://patchwork.kernel.org/project/linux-watchdog/list/?series=227733
>
> Unfortunately it uses Meson firmware API functions, though it has pretty
> much the same functionality since those ultimately end up calling
> arm_smccc_smc().
>
> Guenter
>
> > details in the interface (at least in the pretimeout SMC) so we can't
> > just expand that. With this driver I tried to directly wrap the kernel
> > watchdog interface so it should be platform-agnostic and possible to
> > expand this driver to other platforms later if desired. The SMC
> > function ID would still always have to be platform-specific,
> > unfortunately (but we could pass it in through the device tree), since
> > the Arm SMC spec doesn't really leave any room for OS-generic SMCs
> > like this.
