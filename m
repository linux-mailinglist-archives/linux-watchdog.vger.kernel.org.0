Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30E6132D9
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 May 2019 19:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfECRGQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 May 2019 13:06:16 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43584 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfECRGP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 May 2019 13:06:15 -0400
Received: by mail-pf1-f196.google.com with SMTP id e67so3170683pfe.10;
        Fri, 03 May 2019 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EMTmWth6cjKoVYNQSjB9zhFk16R0UDFlctBiJciXhRo=;
        b=Nw7jrbNCjEwObQ2yOv3NASLRHYHi5IkqvvIExe4CncaFhRvoc0x2Nh+DBlMhb2/5jw
         5TnjAzuslyE2AxT19S024BY5Iu6wPP7eMfkjgbluM3Hyoz+PLvr+zYh7Jhh2JAhaASTO
         bPjtI7Lu9p5DFfc5K63QwtUmP3O2u7mcfqejS2jMHJ8hydDtWUUj/itE+LPT4gKFtJ4/
         /bRd9Ol3e8FSl6Cza1IbzolUqOzg1R+l1xxT0M2U+7n6vARI46aK3EoLSF9kGzV7MKGp
         n4LzLLquesfRgKXr3GVOc+j7G3XhoBoCvsY0ZYss0cNbFEf0tBzZJ+p3aQjsouP/BxZN
         PGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=EMTmWth6cjKoVYNQSjB9zhFk16R0UDFlctBiJciXhRo=;
        b=MWEdjhz+Kt95enjdjav2Jg+WOOwYLlzpGMiO2yrX8tikCtLckZI2qtocO2QVb2QCyB
         aD+Yn4xJ3OGUTTDQCJK+T+J56USmwMXPFQ9nMYOMkJi9wH2i06BSLRRZ514UZWXAubW1
         iJC6K1dqgzoBCH7CkWUaUrVLNqTD9qf+JTy8AMhz1P0Sspiqk38+v20r3mpdlqcG/sUt
         sxl+dOBqSEoMZFo/2a/JjxuPwdCC182AQ1nVZRGHUeCstZrYYxp50U7Ej/eIAGk5KGf6
         +u/PPv84wchl9tcqJTQdDdVQJNWPDYDrxc14PP+z0GPlt+gY6JSzp1+x8UBpcuVKB3JY
         O0Vg==
X-Gm-Message-State: APjAAAVT5M+xjXYmievyR+fsmpQ6LGlahBRwxArDXSVogsn89ce6LU+N
        WYG/DEAoT092YKlPpcqreXo=
X-Google-Smtp-Source: APXvYqzMiJzPNH7QZiw09z/SEPAorWvQs2jieP6aiSjA0GAzN1TIMz1BKvSP0/+ObXfGkR3KCurHVQ==
X-Received: by 2002:a62:5286:: with SMTP id g128mr12032169pfb.226.1556903175026;
        Fri, 03 May 2019 10:06:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a80sm7156862pfj.61.2019.05.03.10.06.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 10:06:14 -0700 (PDT)
Date:   Fri, 3 May 2019 10:06:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Ungerer <gerg@uclinux.org>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc <arm@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH 1/6] ARM: ks8695: watchdog: stop using mach/*.h
Message-ID: <20190503170613.GA1783@roeck-us.net>
References: <20190415202501.941196-1-arnd@arndb.de>
 <2424c672-e3fb-4c32-4c24-fafc59d03a96@uclinux.org>
 <CACRpkdaJ+2bub_nDp9=5b4kyKjWDnOGKscWg3KsEVixDpk8rzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaJ+2bub_nDp9=5b4kyKjWDnOGKscWg3KsEVixDpk8rzA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 03, 2019 at 08:16:05AM +0100, Linus Walleij wrote:
> On Fri, May 3, 2019 at 8:02 AM Greg Ungerer <gerg@uclinux.org> wrote:
> 
> > I dug out some old ks8695 based hardware to try this out.
> > I had a lot of trouble getting anything modern working on it.
> > In the end I still don't have a reliable test bed to test this properly.
> 
> What is usually used by old ARMv4 systems is OpenWrt or
> OpenEmbedded. Those is the only build systems that reliably
> produce a userspace for these things now, and it is also the
> appropriate size for this kind of systems.
> 
> > Ultimately though I am left wondering if the ks8695 support in the
> > kernel is useful to anyone the way it is at the moment. With a minimal
> > kernel configuration I can boot up to a shell - but the system is
> > really unreliable if you try to interactively use it. I don't think
> > it is the hardware - it seems to run reliably with the old code
> > it has running from flash on it. I am only testing the new kernel,
> > running with the existing user space root filesystem on it (which
> > dates from 2004 :-)
> 
> Personally I think it is a bad sign that this subarch and boards do
> not have active OpenWrt support, they are routers after all (right?)
> and any active use of networking equipment should use a recent
> userspace as well, given all the security bugs that popped up over
> the years.
> 
> With IXP4xx, Gemini and EP93xx we have found active users and
> companies selling the chips and reference designs and even
> recommending it for new products (!) at times.  If this is not the
> case with KS8695 and no hobbyists are willing to submit it
> to OpenWrt and modernize it to use device tree I think it should be
> deleted from the kernel.
> 

That may be the best approach if indeed no one is using it,
much less maintaining it.

Guenter
