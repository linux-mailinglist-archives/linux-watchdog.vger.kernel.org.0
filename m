Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A01E716886D
	for <lists+linux-watchdog@lfdr.de>; Fri, 21 Feb 2020 21:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgBUUrC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 21 Feb 2020 15:47:02 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38228 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgBUUrC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 21 Feb 2020 15:47:02 -0500
Received: by mail-pf1-f196.google.com with SMTP id x185so1864910pfc.5;
        Fri, 21 Feb 2020 12:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=82wXbaKxRFjsoQQsO8QepB6AihqwY3AEJl7r9u0kpGw=;
        b=AuYSHn6mP7IaxfUclYudxXEWRdwuTZLXOSYwBCCQUceCrLM5fqU4As4Rt/q+NUsO1k
         qgDZXU1etfABOXuFfZ6QFrMjNZIUA0BwKT7Ukoi3C4hp5ebskEnKvgKxy9mK+NxdAJZ5
         cJAcTHggDlceqrWd9Xgkk0uF20RGm2kabLgmR8BAFeS7n3X/kpVcnUbUN3jsdRxrSdm6
         qKC3N9Au8cXYCltWUYsgFqiieAoLp+rKe8FcRdS29jg/CXXXE21YFl5kJ3/DWk6ULvn+
         jKjUbbXouX0UMz44Dd2qa1BAqGDDgwCQU4PKPaGaC/e551I4RycTskcwwPXSVb/C4Ko7
         izCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=82wXbaKxRFjsoQQsO8QepB6AihqwY3AEJl7r9u0kpGw=;
        b=BCMKznhacKOk/+zEy66Ct419A0nli0XDpJb030g7FQ8nu61JK/2gexXwdXG3SfjET9
         OCUAbeQNyKwK+Zn1S1MT6EoMMii+9QReYBs2xoSIVUAHt4g/x1boPfmZSY2HvAJsX/Xn
         34trs9Rpt9lT226WiAJDxqA8JuK9b+efgapqJNbWU7cnZ7ljq/QmJvKAGc1x+cmLGKdo
         5pvwQj+qWXvxKW13a9b+dYF1EsdY8emDHmemdak8jA3ZvbiAN5NCGIMKFesI+bg0YENb
         Bg3TwNRN28CgjVL7AQ/72u9CDerXZycWxZCq8NgrkSUxIbJ1Zc6FfLuizUATLP9bIn35
         rFRg==
X-Gm-Message-State: APjAAAVLfcUjav4/4Tts1b+p5KTPMwLt7X7gfduQuPZf3C27BHOXLFgR
        /mOpwVQBGEmTQs7LqzVwSY4=
X-Google-Smtp-Source: APXvYqwAbHoXgv/y42qNumObTpDSMx/5xWOVAecfBhM/FdD2ExFfWZv09tikVXilfBaCIuSFByMblg==
X-Received: by 2002:a63:6383:: with SMTP id x125mr37208834pgb.409.1582318021317;
        Fri, 21 Feb 2020 12:47:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w189sm3770262pfw.157.2020.02.21.12.46.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 12:47:00 -0800 (PST)
Date:   Fri, 21 Feb 2020 12:46:58 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Julius Werner <jwerner@chromium.org>
Cc:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Evan Benn <evanbenn@chromium.org>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-watchdog@vger.kernel.org,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Yonghui Yu <yonghui.yu@amlogic.com>
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add arm,smc-wdt watchdog
 arm,smc-wdt compatible
Message-ID: <20200221204658.GA6074@roeck-us.net>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <20200219223046.GA16537@bogus>
 <CAODwPW8JspiUtyU4CC95w9rbNRyUF-Aeb9TuPm1PzmP6u=y1EA@mail.gmail.com>
 <20200219232005.GA9737@roeck-us.net>
 <CAKz_xw2hvHL=a4s37dmuCTWDbxefQFR3rfcaNiWYJY4T+jqabA@mail.gmail.com>
 <e42320b8-266f-0b0e-b20b-b72228510e81@amlogic.com>
 <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW94KX46PzSrf_uuEFPKudXor=26d=g3Qta5veRfxmMDUA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 21, 2020 at 11:41:47AM -0800, Julius Werner wrote:
> > Because the ATF does not define standard wdt index, each vendor defines
> > its own index.
> > So I don't think that the current driver[0] can fully cover my usecases.
> 
> I think the best way to solve this would be to put the SMC function ID
> as another field into the device tree, so that multiple vendors could
> share the same driver even if their firmware interface uses a
> different SMC. But they still have to implement the same API for that
> SMC, of course, not sure if the Meson driver is suitable for that (but
> if it is then I think merging those drivers would be a good idea).

More common would be to have a single driver and multiple compatible
strings. The driver would then pick the SMC function ID from the compatible
string. After all, we'd not only need the SMC function ID; parameters
are also different.

Guenter
