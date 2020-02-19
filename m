Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC5A4165303
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2020 00:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgBSXUI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 19 Feb 2020 18:20:08 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40120 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgBSXUH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 19 Feb 2020 18:20:07 -0500
Received: by mail-pg1-f193.google.com with SMTP id z7so886644pgk.7;
        Wed, 19 Feb 2020 15:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zTjU5dQLnIByh50nZjXZubn4ZLHJkYRWG/8ptJLiRjw=;
        b=ZNuqnwZQz4FPhaySnryBa1KYuR9FGehK5Ds+5qdR/Mxbf/TNvxEG6gCMYJpY95YbGu
         tDgSoBOnqu3J+MOmT3Oni8Oaa7G6kpcPeG8tLgTCPew/qXaDN1kBcEen5q87vMU3mUDT
         MEY+lzdNqwZW1NXv3qfo/ks6Jrh3K+/RVo5fu2LvTc74nnhH9W7hu6sOjDtnw+BfoGoZ
         wFj66S2w2RPqIFPoc3rF5M/PrgzforO1gMj8U+cgkywv4sCN2XM6vwJaiMWjPnw6gDJA
         1HFW2mr8MX2G8mfnDhKGvCp8T10c5H4EtG1xeIQb7IfptUjhyrvWSg2rnD3+ACXcPKaL
         SqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zTjU5dQLnIByh50nZjXZubn4ZLHJkYRWG/8ptJLiRjw=;
        b=ab3+CnO63Eu6h9RbkVl5Pf96K1EDPWbMe3DVyawJOtFt+1/yaesDm//057XpGHYnzt
         IZ7V/p0lPE6ea73bkmY1G505yawDcWvg8lPnPq2t0+XmEUGbbgWEcxTA0rc49qODMF8f
         F1YX9gYSxVbwYTjCDmfZF8ulw4vOeKHH0qQWVAzYNQ+jlX4GnBpPUV7kNdAGx7QaHjA1
         WQBzH/msjpw3+MbjRIar26thr/Ya6iCFcF+Q/aNsxoqmuxMpJHmJGxqUyrcFFid8M/wr
         a5Dr/93BeiA6ltWd2AkGixPnVE4thjLtE5kLvwbxL6DWCCUivGYXOg1zXGmEAus7765m
         vBUw==
X-Gm-Message-State: APjAAAW2I8pWfrsntcOcwVo/yACl/lAc7QqkKWjo/Advb5loew6zRw1M
        9JSDtDRbJZIA4Jokey/nx6c=
X-Google-Smtp-Source: APXvYqxz0n6zqalLUF3s6QqBodmosHFcUuuBe1/KTM20rWHdJjKmvRZx4tgia2eFo1BcWdur6hHGEQ==
X-Received: by 2002:a63:354b:: with SMTP id c72mr26575153pga.99.1582154406970;
        Wed, 19 Feb 2020 15:20:06 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2sm832488pjv.18.2020.02.19.15.20.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 15:20:06 -0800 (PST)
Date:   Wed, 19 Feb 2020 15:20:05 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Julius Werner <jwerner@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
Message-ID: <20200219232005.GA9737@roeck-us.net>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Feb 19, 2020 at 03:04:54PM -0800, Julius Werner wrote:
> > You are not the first 'watchdog in firmware accessed via an SMC call'.
> > Is there some more detail about what implementation this is? Part of
> > TF-A? Defined by some spec (I can dream)?
> 
> This is just some random implementation written by me because we
> needed one. I would like it to be the new generic implementation, but
> it sounds like people here prefer the naming to be MediaTek specific
> (at least for now). The other SMC watchdog we're aware of is
> imx_sc_wdt but unfortunately that seems to hardcode platform-specific

There is one more pending, for Meson SMC.

https://patchwork.kernel.org/project/linux-watchdog/list/?series=227733

Unfortunately it uses Meson firmware API functions, though it has pretty
much the same functionality since those ultimately end up calling
arm_smccc_smc().

Guenter

> details in the interface (at least in the pretimeout SMC) so we can't
> just expand that. With this driver I tried to directly wrap the kernel
> watchdog interface so it should be platform-agnostic and possible to
> expand this driver to other platforms later if desired. The SMC
> function ID would still always have to be platform-specific,
> unfortunately (but we could pass it in through the device tree), since
> the Arm SMC spec doesn't really leave any room for OS-generic SMCs
> like this.
