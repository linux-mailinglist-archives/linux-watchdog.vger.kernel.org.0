Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3D716612D
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2020 16:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgBTPnO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Feb 2020 10:43:14 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45755 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbgBTPnO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Feb 2020 10:43:14 -0500
Received: by mail-pf1-f193.google.com with SMTP id 2so2092248pfg.12;
        Thu, 20 Feb 2020 07:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1DIMRV6Iqi1rLe5wMgz5eqoASoBEhZAuJOJhLs9EWXg=;
        b=SDcgv1u/KxtAEvGdFod3asgbcGb/ypcbFpJI7L5wvrxLVXG1G1OG4sNftp87QbjuaC
         9btXUMC6BSz/MvATW7U0uLF796Pv6wbNHLRCnzQfpAzngStKBcreMdIjAqyNPgAK5O4Q
         dSdHoLLGdEuyf2kPK+06V6aHgQcbCxM2V5f73DfwvE+OwAfGcoKwat+U4zRHFQury1qi
         o4NtU3HAcF6o9aR6mxYkzvNkvZJMS0/bHZYsVPhyaMxi8NH//AFvGjFRchAyBRWWSrwf
         0pBi8Wg4pcJeKyQFOCSeYp4/bqB+Ywvwx0woG7UYS4r7PlZoChbDJTAxMMnLEXikqugP
         TJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1DIMRV6Iqi1rLe5wMgz5eqoASoBEhZAuJOJhLs9EWXg=;
        b=tRQ9gho07qWIj05MjlXHT0MMvtopu537UAjHLGWck4DRg7NJ0sMcz9qrSVby9MiJ27
         fjcBAYiJzZeLFRZB9vQI1Gaaswdr6UuE1lwnX7TDpOzvldAlAOtgUFDgoZm9iGTBC6Zv
         bu2S5VPBf9RgK3dM5gtLi15Dec3pIsG8/P1oeB6JzqdtdLWSSepuQjIptqvSOGrZfxFc
         vsFGCdtZwUaxQYF5hxqdWRo7G9rD3X7+IgV7ZOQ3qD6G4pbwEMzGWddhoPkrtbKFIPtS
         YahkrYr+8FMHkLVMtfloCQ7fa7DRaj1Ql6WcpPMHV1WMEHn+Y6loCRrelySvpvkLIjeK
         j5Sg==
X-Gm-Message-State: APjAAAVE3SM2sM3FdL3ZgdVFXcuoRTKLbKM+nsm5NDzAxl7WBYJfY8mC
        I9R500f/IuZfaa53G9mn81Q=
X-Google-Smtp-Source: APXvYqwO3lW26bxqaJCMoOlpFAJtB3c1MIjoPwgFw5WTaUDCxMX3q2sVzXJyUPW4sVxi/vPZ2XA3Gg==
X-Received: by 2002:a62:6409:: with SMTP id y9mr32901598pfb.30.1582213393847;
        Thu, 20 Feb 2020 07:43:13 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x28sm4161696pgc.83.2020.02.20.07.43.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 07:43:12 -0800 (PST)
Date:   Thu, 20 Feb 2020 07:43:11 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Evan Benn <evanbenn@chromium.org>
Cc:     xingyu.chen@amlogic.com, Julius Werner <jwerner@chromium.org>,
        Rob Herring <robh@kernel.org>,
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
Message-ID: <20200220154311.GA29658@roeck-us.net>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Feb 20, 2020 at 05:41:09PM +1100, Evan Benn wrote:
> Dear Xingyu,
> 
> Could this driver also cover your usecase? I am not familiar with
> meson, but it seems like the meson calls could
> be replaced with arm_smccc calls. Then this driver will cover both
> chips. I am not sure if your firmware is upstream
> somewhere, but this might be adapted;
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405
> 
FWIW, the Meson driver has more functionality.

Guenter

> Thanks
> 
> 
> On Thu, Feb 20, 2020 at 10:20 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Wed, Feb 19, 2020 at 03:04:54PM -0800, Julius Werner wrote:
> > > > You are not the first 'watchdog in firmware accessed via an SMC call'.
> > > > Is there some more detail about what implementation this is? Part of
> > > > TF-A? Defined by some spec (I can dream)?
> > >
> > > This is just some random implementation written by me because we
> > > needed one. I would like it to be the new generic implementation, but
> > > it sounds like people here prefer the naming to be MediaTek specific
> > > (at least for now). The other SMC watchdog we're aware of is
> > > imx_sc_wdt but unfortunately that seems to hardcode platform-specific
> >
> > There is one more pending, for Meson SMC.
> >
> > https://patchwork.kernel.org/project/linux-watchdog/list/?series=227733
> >
> > Unfortunately it uses Meson firmware API functions, though it has pretty
> > much the same functionality since those ultimately end up calling
> > arm_smccc_smc().
> >
> > Guenter
> >
> > > details in the interface (at least in the pretimeout SMC) so we can't
> > > just expand that. With this driver I tried to directly wrap the kernel
> > > watchdog interface so it should be platform-agnostic and possible to
> > > expand this driver to other platforms later if desired. The SMC
> > > function ID would still always have to be platform-specific,
> > > unfortunately (but we could pass it in through the device tree), since
> > > the Arm SMC spec doesn't really leave any room for OS-generic SMCs
> > > like this.
