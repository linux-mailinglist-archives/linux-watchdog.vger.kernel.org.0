Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0C411D524
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2019 19:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbfLLSTF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Dec 2019 13:19:05 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45320 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730034AbfLLSTF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Dec 2019 13:19:05 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so1548026pgk.12;
        Thu, 12 Dec 2019 10:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rgR8f1oUjZUBATiXVQBzGKim6OO45u2oQD6/qlDZ5vY=;
        b=Wtm9D6o+Rw8Z/2kp4hHqYDHWqiMHjwhwJqZhBTWYSHV2QpyziCmhpYw+iNK0EgzI3H
         zGleLoIAO28mM3cOv19mKVDWUK61FVVwzzD3+6kbxOz+BfeHEKNahCUGnzcKrhOEXE+2
         aB/nCzugj9ZsvFyd+DPg/5v0DWreTLMC4vnEjGuYeg6Qyq3FlQrMI9sYVRBvRaVuWBDc
         e7sWjrPaysRzCNwpT/Y3OlICwSLUIgfRSM0eBOzYeA9WtZE3B87GJQT/f5eRnyPcTcYU
         Ig0qqPA6T1itDrUh/ZAm6nxFSZ3FSEXMYYWNjaTehaci/dCW3SrZZeqUJpfOQcp9jGgA
         SXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=rgR8f1oUjZUBATiXVQBzGKim6OO45u2oQD6/qlDZ5vY=;
        b=boczkkHJLJ8eypLPeFv6fT8IUU/RFnDjb8f3KQH+dQkFwOc6hdRDlbREiYufvZUGFm
         Uc5k0syikhLMU4p/3vY0pWVaKIoDwP1ko30IuODX7qLOGlKx6Fgkjc9HxkTaidZ7Dkb1
         0CkoFCmu/ZKajrEobfkAcq2embesjRHEJRKwEaCUJ7BLLLnd5lrYJTaxbbVUf9j5/HQA
         +KwvhezNPPWgn8IxnneW/yzt9l1UvmsM8k5Jf/2L+zJlFF/TZu7iM98hMokj1+mm7WXp
         A/9RbzdLraEO8iVpQVSWWgA2NasRV4EGTrDYzzSEYFHcylY8uAbxLBrVt8VD2Pz1HYam
         /Rzw==
X-Gm-Message-State: APjAAAUaxv9vH+YGNjoC+2RyCpmjaCCnwa58RXiNe8cEiKMSkwrB4GkJ
        JVufobTpzPmI2R5X/COcLpygKr80
X-Google-Smtp-Source: APXvYqxQtpo2SEZbeVIFNPFPIA35uoCJcj9XN/Bo4jPUjDncYiMyW5uqrgD6u/nV/eD4veoZsq1Ccg==
X-Received: by 2002:a63:fd10:: with SMTP id d16mr11817204pgh.177.1576174744975;
        Thu, 12 Dec 2019 10:19:04 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d14sm6702804pjz.12.2019.12.12.10.19.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Dec 2019 10:19:04 -0800 (PST)
Date:   Thu, 12 Dec 2019 10:19:02 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@linux-mips.org, Paul Burton <paulburton@kernel.org>,
        Denis Efremov <efremov@linux.com>
Subject: Re: [PATCH 1/2] watchdog: mtx-1: Drop au1000.h header inclusion
Message-ID: <20191212181902.GA31779@roeck-us.net>
References: <20191211210204.31579-1-f.fainelli@gmail.com>
 <20191211210204.31579-2-f.fainelli@gmail.com>
 <21b7be75-db61-3b14-c57c-04af0b78b347@roeck-us.net>
 <3fdc99fa-f75c-33d4-e1c4-ec8ad185e2cd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fdc99fa-f75c-33d4-e1c4-ec8ad185e2cd@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Dec 11, 2019 at 07:38:29PM -0800, Florian Fainelli wrote:
> 
> 
> On 12/11/2019 5:35 PM, Guenter Roeck wrote:
> > On 12/11/19 1:02 PM, Florian Fainelli wrote:
> >> Including au1000.h from the machine specific header directory prevents
> >> this driver from being built on any other platforms (MIPS included).
> >> Since we do not use any definitions, drop it.
> >>
> >> Reported-by: Denis Efremov <efremov@linux.com>
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >> ---
> >>   drivers/watchdog/mtx-1_wdt.c | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
> >> index 25a92857b217..aeca22f7450e 100644
> >> --- a/drivers/watchdog/mtx-1_wdt.c
> >> +++ b/drivers/watchdog/mtx-1_wdt.c
> >> @@ -41,8 +41,6 @@
> >>   #include <linux/uaccess.h>
> >>   #include <linux/gpio/consumer.h>
> >>   -#include <asm/mach-au1x00/au1000.h>
> >> -
> >>   #define MTX1_WDT_INTERVAL    (5 * HZ)
> >>     static int ticks = 100 * HZ;
> >>
> > 
> > Given that this is nothing but yet another gpio watchdog driver, I'd
> > personally rather have it merged with gpio_wdt.c. On a higher level,
> > cleaning up old-style watchdog drivers, without converting them to
> > using the watchdog core, is a waste of time.
> 
> If that makes you feel any better, I was not planning on going further
> than that, and yes, removing this driver and using gpio_wdt.c would be
> the way to go, this driver greatly predates gpio_wdt.c and I have since
> then not had access to my MTX-1 platforms which is why this did not
> happen. We can attempt a "blind conversion" without testing, but what
> good would that make, not sure.
> 

It sounds like this is a purely cosmetical change to improve test build
coverage for a more or less obsolete driver. No, that doesn't make me feel
better; I get way too many of those lately. Worse, some of those test build
"improvements" actually end up breaking real builds, which then costs me
and others even more time to track down.

We should really discourage that. Is there some challenge going on somewhere,
along the line of "improve test build coverage" ?

Guenter

> > 
> > Wim, should we make it a policy to reject patches into old-style drivers
> > unless they fix a real bug ? It is getting a pain to have to review those
> > patches.
> > 
> > Thanks,
> > Guenter
> 
> -- 
> Florian
